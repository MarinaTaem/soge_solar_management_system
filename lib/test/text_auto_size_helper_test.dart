// import 'package:flutter/material.dart';

// class TextAutoSizeHelper extends StatefulWidget {
//   final String text;
//   final TextStyle? textStyle;
//   final double maxFontSize;
//   final double minFontSize;
//   final int? maxLine;
//   final TextAlign? textAlign;
//   const TextAutoSizeHelper({
//     Key? key,
//     required this.text,
//     this.textStyle,
//     this.maxFontSize = 40,
//     this.minFontSize = 18,
//     this.maxLine = 1,
//     this.textAlign = TextAlign.left,
//   }) : super(key: key);

//   @override
//   State<TextAutoSizeHelper> createState() => _TextAutoSizeHelperState();
// }

// class _TextAutoSizeHelperState extends State<TextAutoSizeHelper> {
//   // check if the text if fit
//   // Note: 'TextPainter' like a tool for messuring, calculate space that text will take up
//   bool _isTextFit(
//       String text, TextStyle textStyle, double maxWidth, int? maxline) {
//     final TextPainter textPainter = TextPainter(
//         text: TextSpan(text: text, style: textStyle),
//         maxLines: maxline,
//         textDirection: TextDirection.ltr)
//       ..layout(maxWidth: maxWidth);

//     return !textPainter.didExceedMaxLines;
//   }

//   // find font size
//   double _findFontSize(TextStyle defaultStyle, double maxWidth) {
//     double high = widget.maxFontSize;
//     double low = widget.minFontSize;
//     double optimilSize = widget.minFontSize;

//     while (low <= high) {
//       final double mid = (high + low) / 2;
//       final textStyle = defaultStyle.copyWith(fontSize: mid);

//       if (_isTextFit(widget.text, textStyle, maxWidth, widget.maxLine)) {
//         optimilSize = mid;
//         low = mid + 0.5;
//       } else {
//         high = mid - 0.5;
//       }
//     }
//     return optimilSize;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constrains) {
//         final defaultTextStyle = DefaultTextStyle.of(context);
//         var baseTextSyle = widget.textStyle ?? defaultTextStyle.style;
//         // Find optimal font size
//         final optmalFontSize = _findFontSize(baseTextSyle, constrains.maxWidth);
//         final optimalTextStyle =
//             baseTextSyle.copyWith(fontSize: optmalFontSize);
//         // Check if text fit with optimal size
//         final fitCompletly = _isTextFit(
//             widget.text, optimalTextStyle, constrains.maxWidth, widget.maxLine);

//         return SizedBox(
//           width: double.infinity,
//           child: Text(
//             widget.text,
//             overflow: fitCompletly ? null : TextOverflow.ellipsis,
//             style: optimalTextStyle,
//             maxLines: widget.maxLine,
//             textAlign: widget.textAlign,
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';

class TextAutoSizeHelperTest extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final double maxFontSize;
  final double minFontSize;
  final int? maxLine;
  final TextAlign? textAlign;
  const TextAutoSizeHelperTest({
    Key? key,
    required this.text,
    this.style,
    this.maxFontSize = 40,
    this.minFontSize = 18,
    this.maxLine = 1,
    this.textAlign = TextAlign.left,
  }) : super(key: key);

  @override
  State<TextAutoSizeHelperTest> createState() => _TextAutoSizeHelperTestState();
}

class _TextAutoSizeHelperTestState extends State<TextAutoSizeHelperTest> {
  bool _isTextFitWithSize(String text, TextStyle style, double maxWidth,
      int? maxLine, TextScaler textScaler, TextDirection textDirection) {
    final tp = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: maxLine,
      textDirection: textDirection,
      // new API: provide TextScaler for nonlinear scaling support
      textScaler: textScaler,
      textWidthBasis: TextWidthBasis.longestLine,
    )..layout(maxWidth: maxWidth);
    return !tp.didExceedMaxLines;
  }

  /// Returns the best fontSize. Also returns whether even minFontSize still overflows.
  double _computeFontSize(TextStyle baseStyle, double maxWidth,
      TextScaler textScaler, TextDirection textDirection, outEllipsis) {
    // Quick fits
    final maxStyle = baseStyle.copyWith(fontSize: widget.maxFontSize);
    if (_isTextFitWithSize(widget.text, maxStyle, maxWidth, widget.maxLine,
        textScaler, textDirection)) {
      outEllipsis.value = false; // Don't use ellipes
      return widget.maxFontSize;
    }

    final minStyle = baseStyle.copyWith(fontSize: widget.minFontSize);
    final fitsAtMin = _isTextFitWithSize(widget.text, minStyle, maxWidth,
        widget.maxLine, textScaler, textDirection);
    if (!fitsAtMin) {
      // Even min font doesn't fit — use minFontSize and ellipsize
      outEllipsis.value = true;
      return widget.minFontSize;
    }

    // Binary search between min and max to find the largest fitting font size.
    double low = widget.minFontSize;
    double high = widget.maxFontSize;
    const double eps = 1; // precision; reduce if you need finer tuning

    double best = low;
    while (high - low > eps) {
      final mid = (low + high) / 2;
      final testStyle = baseStyle.copyWith(fontSize: mid);
      final isfitTextFitSize = _isTextFitWithSize(widget.text, testStyle,
          maxWidth, widget.maxLine, textScaler, textDirection);
      if (isfitTextFitSize) {
        best = mid;
        low = mid; // try larger
      } else {
        high = mid; // too large
      }
    }

    // final sanity: ensure best fits (it should)
    final finalStyle = baseStyle.copyWith(fontSize: best);
    final finalFits = _isTextFitWithSize(widget.text, finalStyle, maxWidth,
        widget.maxLine, textScaler, textDirection);
    outEllipsis.value = !finalFits; // should be false here
    return best;
  }

  @override
  Widget build(BuildContext context) {
    final textDirection = Directionality.of(context);
    // use new TextScaler API if available
    final textScaler = MediaQuery.textScalerOf(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final defaultStyle = DefaultTextStyle.of(context).style;
        final baseStyle = (widget.style ?? defaultStyle);

        // tiny wrapper for out param
        final _OutBool outEllipsi = _OutBool(false);
        final fontSize = _computeFontSize(baseStyle, constraints.maxWidth,
            textScaler, textDirection, outEllipsi);

        final effectiveStyle = baseStyle.copyWith(fontSize: fontSize);

        return SizedBox(
          width: double.infinity,
          child: Text(
            widget.text,
            style: effectiveStyle,
            maxLines: widget.maxLine,
            overflow:
                outEllipsi.value ? TextOverflow.ellipsis : TextOverflow.visible,
            softWrap: false,
            textAlign: widget.textAlign,
            // new Text widget API: pass the TextScaler
            textScaler: textScaler,
            // The font scaling strategy to use when laying out and rendering the text.
            // TextStyle.fontSize will be adjust by the TextScaller before laying out and rendering the text
          ),
        );
      },
    );
  }
}

/// Small helper to return an "out" boolean from a function (no tuples in Dart).
class _OutBool {
  bool value;
  _OutBool(this.value);
}
