import 'package:flutter/material.dart';

class TextSizeHelper {
  static ({double fontSize, bool stillOverflows, double letterSpacing})
      getOptimalTextSize({
    required String text,
    required TextStyle textStyle,
    required double maxWidth,
    double minFontSize = 8.0,
    double maxFontSize = 16.0,
    double minLetterSpacing = -2.0,
    double maxLetterSpacing = 2.0,
    int? maxLines,
    bool adjustSpacing = true,
  }) {
    double fontSize = maxFontSize;
    double letterSpacing = textStyle.letterSpacing ?? 0.0;
    bool fits = false;

    // First try: Adjust font size
    while (fontSize >= minFontSize && !fits) {
      final testStyle = textStyle.copyWith(
        fontSize: fontSize,
        letterSpacing: letterSpacing,
      );

      if (!_doesOverflow(text, testStyle, maxWidth, maxLines)) {
        fits = true;
        break;
      }

      fontSize -= 1.0;
    }

    // Second try: If still doesn't fit, adjust letter spacing
    if (!fits && adjustSpacing) {
      fontSize = minFontSize; // Use min font size
      double currentSpacing = minLetterSpacing;

      while (currentSpacing <= maxLetterSpacing && !fits) {
        final testStyle = textStyle.copyWith(
          fontSize: fontSize,
          letterSpacing: currentSpacing,
        );

        if (!_doesOverflow(text, testStyle, maxWidth, maxLines)) {
          fits = true;
          letterSpacing = currentSpacing;
          break;
        }

        currentSpacing += 0.5;
      }
    }

    // Final check
    // final finalStyle = textStyle.copyWith(
    //   fontSize: fontSize,
    //   letterSpacing: letterSpacing,
    // );

    final stillOverflows = !fits;

    return (
      fontSize: fontSize,
      stillOverflows: stillOverflows,
      letterSpacing: letterSpacing,
    );
  }

  static bool _doesOverflow(
      String text, TextStyle style, double maxWidth, int? maxLines) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      maxLines: maxLines,
    );

    textPainter.layout(maxWidth: maxWidth);

    return maxLines != null
        ? textPainter.didExceedMaxLines
        : textPainter.width > maxWidth;
  }
}
