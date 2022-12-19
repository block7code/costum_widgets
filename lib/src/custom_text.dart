import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class Rich {
  final TextStyle style;
  final String key;
  final ValueChanged<String>? onRichTap;

  Rich({required this.style, required this.key, this.onRichTap});
}

class Txt extends StatelessWidget {
  final Color? textColor;
  final double? textSize;
  final String? fontFamily;
  final String value;
  final int maxLine;
  final Rich? rich;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final TextDecoration? textDecoration;
  final TextDirection? textDirection;
  final Locale? locale;
  final TextStyle Function(TextStyle value)? textStyle;

  Txt(this.value,
      { Key? key,
        this.fontFamily,
        this.maxLine = 0,
        this.textSize,
        this.textColor,
        this.textAlign,
        this.rich,
        this.locale,
        this.textDecoration = TextDecoration.none,
        this.textDirection,
        this.textStyle,
        this.textOverflow})
      :super(key: key);



  List<TextSpan> _getSpans({required String text, required TextStyle style}) {
    List<TextSpan> spans = [];
    try {
      int spanBoundary = 0;
      do {
        final startIndex = text.indexOf(rich!.key, spanBoundary);

        if (startIndex == -1) {
          spans.add(TextSpan(style: style, text: text.substring(spanBoundary)));
          return spans;
        }

        if (startIndex > spanBoundary) {
          spans.add(TextSpan(
              style: style, text: text.substring(spanBoundary, startIndex)));
        }

        final endIndex = startIndex + rich!.key.length;

        final spanText = text.substring(startIndex, endIndex);

        spans.add(TextSpan(
            text: spanText,
            style: rich!.style,
            recognizer: _onRichTap(spanText)));

        spanBoundary = endIndex;
      } while (spanBoundary < text.length);
    } catch (error) {}
    return spans;
  }

  TapGestureRecognizer? _onRichTap(String value) {
    if (rich!.onRichTap == null) return null;
    return TapGestureRecognizer()..onTap = () => rich!.onRichTap!(value);
  }

  @override
  Widget build(BuildContext context) {
    final String _text = value;

    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);

    TextStyle _effectiveTextStyle = (textStyle != null)
        ? textStyle!(defaultTextStyle.style)
        : defaultTextStyle.style;

    assert(!(textStyle != null && textColor != null));
    assert(!(textStyle != null && textSize != null));
    assert(!(textStyle != null && fontFamily != null));
    assert(!(textStyle != null && textDecoration != TextDecoration.none));


    final TextAlign _textAlign =
        textAlign ?? defaultTextStyle.textAlign ?? TextAlign.start;

    final TextDirection _textDirection =
        textDirection ?? Directionality.of(context);

    final TextOverflow _textOverflow =
        textOverflow ?? defaultTextStyle.overflow;

    final _locale = locale ?? Localizations.maybeLocaleOf(context);

    if (textStyle != null) {
      _effectiveTextStyle =
          defaultTextStyle.style.merge(textStyle!(defaultTextStyle.style));
    }

    if (fontFamily != null) {
      _effectiveTextStyle =
          _effectiveTextStyle.copyWith(fontFamily: fontFamily);
    }

    if (textColor != null) {
      _effectiveTextStyle = _effectiveTextStyle.copyWith(color: textColor);
    }

    if (textSize != null) {
      _effectiveTextStyle = _effectiveTextStyle.copyWith(fontSize: textSize);
    }

    if (textDecoration != null) {
      _effectiveTextStyle =
          _effectiveTextStyle.copyWith(decoration: textDecoration);
    }

    _effectiveTextStyle = _effectiveTextStyle.copyWith(
      locale: _locale,
      decoration: textDecoration,
    );

    if (rich == null)
      return Text(
        _text,
        maxLines: maxLine == 0 ? null : maxLine,
        locale: _locale,
        overflow: _textOverflow,
        textAlign: _textAlign,
        textDirection: _textDirection,
        style: _effectiveTextStyle,
      );

    var spans = _getSpans(text: _text, style: _effectiveTextStyle);

    return Text.rich(
      TextSpan(style: _effectiveTextStyle, children: spans),
      textAlign: _textAlign,
    );
  }
}