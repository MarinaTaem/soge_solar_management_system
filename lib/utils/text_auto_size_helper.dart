import 'package:flutter/material.dart';

class TextAutoSizeHelper extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final int? maxLines;
  final TextAlign? textAlign;
  final double maxFontSize;
  final double minFontSize;
  const TextAutoSizeHelper({
    Key? key,
    required this.text,
    this.style,
    this.maxLines = 1,
    this.textAlign = TextAlign.left,
    this.maxFontSize = 40,
    this.minFontSize = 1,
  }) : super(key: key);

  @override
  State<TextAutoSizeHelper> createState() => _TextAutoSizeHelperState();
}

class _TextAutoSizeHelperState extends State<TextAutoSizeHelper> {
  // check if font is fit
  bool _isFitFontSize(String text, int? maxLines, TextStyle textStyle,
      double maxWidth, TextScaler textScaler, TextDirection textDirection) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: textStyle),
      textScaler: textScaler,
      maxLines: maxLines,
      textWidthBasis: TextWidthBasis.longestLine,
      textDirection: textDirection,
    )..layout(maxWidth: maxWidth);
    return !textPainter.didExceedMaxLines;
  }

  // find the best fontSize
  double _findFitFontSize(TextStyle textStyle, double maxWidth,
      TextScaler textScaler, ellipeses, TextDirection textDirection) {
    // if text fit with max size
    final maxStyle = textStyle.copyWith(fontSize: maxWidth);
    final isMaxStyle = _isFitFontSize(widget.text, widget.maxLines, maxStyle,
        maxWidth, textScaler, textDirection);
    if (isMaxStyle) {
      ellipeses.value = false;
      return widget.maxFontSize;
    }
    // if text fit with min size
    final minStyle = textStyle.copyWith(fontSize: widget.minFontSize);
    final isMinStyle = _isFitFontSize(widget.text, widget.maxLines, minStyle,
        maxWidth, textScaler, textDirection);
    if (!isMinStyle) {
      ellipeses.value = true;
      return widget.minFontSize;
    }
    // find the best size
    double high = widget.maxFontSize;
    double low = widget.minFontSize;
    double bestFontSize = low;

    while (high - low > 0.1) {
      double mid = (high + low) / 2;
      final testFontSize = textStyle.copyWith(fontSize: mid);
      final isFitFont = _isFitFontSize(widget.text, widget.maxLines,
          testFontSize, maxWidth, textScaler, textDirection);
      if (isFitFont) {
        bestFontSize = mid;
        low = mid;
      } else {
        high = mid;
      }
    }
    final finalStyle = textStyle.copyWith(fontSize: bestFontSize);
    final isFinalSizeFit = _isFitFontSize(widget.text, widget.maxLines,
        finalStyle, maxWidth, textScaler, textDirection);
    ellipeses.value = !isFinalSizeFit;

    return bestFontSize;
  }

  @override
  Widget build(BuildContext context) {
    final TextScaler textScaler = MediaQuery.of(context).textScaler;
    final TextDirection textDirection = Directionality.of(context);

    // textdirection
    return LayoutBuilder(builder: (context, constrains) {
      final defaultTextStyle = DefaultTextStyle.of(context).style;
      final baseStyle = widget.style ?? defaultTextStyle;

      final OutBool ellipsis = OutBool(false);
      final fontSize = _findFitFontSize(
        baseStyle,
        constrains.maxWidth,
        textScaler,
        ellipsis,
        textDirection,
      );
      final effictFontStyle = baseStyle.copyWith(fontSize: fontSize);

      return SizedBox(
        width: double.infinity,
        child: Text(
          widget.text,
          style: effictFontStyle,
          overflow:
              ellipsis.value ? TextOverflow.ellipsis : TextOverflow.visible,
          softWrap: false,
          maxLines: widget.maxLines,
          textScaler: textScaler,
          textAlign: widget.textAlign,
        ),
      );
    });
  }
}

class OutBool {
  bool value;
  OutBool(this.value);
}
