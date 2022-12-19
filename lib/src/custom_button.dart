import 'package:flutter/material.dart';

import 'custom_progress.dart';
import 'custom_text.dart';

abstract class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? activeColor;
  final Color? disabledColor;
  final String text;
  final Widget Function(String)? builderText;
  final double border;
  final double elevation;
  final double height;
  final double? textSize;
  final Color? textColor;
  final bool enableEffectClicked;
  final TextStyle Function(TextStyle style)? textStyle;

  const CustomButton({
    this.onPressed,
    this.enableEffectClicked = true,
    this.activeColor,
    this.disabledColor,
    required this.text,
    this.textStyle,
    this.textColor,
    this.textSize,
    this.builderText,
    this.border = 8.0,
    this.height = 50.0,
    this.elevation = 8.0,
  })  : assert(disabledColor != null),
        assert(text != null),
        assert(height != null);

  body({required Widget child, required BuildContext context}) {
    var _activeColor = activeColor ?? Theme.of(context).accentColor;

    return ClipRRect(
      borderRadius: BorderRadius.circular(border),
      child: MaterialButton(
        splashColor: (enableEffectClicked) ? null : Colors.transparent,
        highlightColor: (enableEffectClicked) ? null : Colors.transparent,
        disabledColor: disabledColor,
        elevation: elevation,
        color: _activeColor,
        height: height,
        minWidth: double.infinity / 2,
        child: (builderText != null) ? builderText!(text) : child,
        onPressed: onPressed,
      ),
    );
  }
}

class DefaultButton extends CustomButton {
  DefaultButton(
      {required String text,
      double border = 8.0,
      double elevation = 8.0,
      TextStyle Function(TextStyle style)? textStyle,
      Color? activeColor,
      Color? disabledColor,
      bool enableEffectClicked = true,
      double height = 50.0,
      Widget Function(String value)? builderText,
      VoidCallback? onPressed,
      double? textSize,
      Color? textColor})
      : assert(text != null),
        assert(enableEffectClicked != null),
        super(
            text: text,
            activeColor: activeColor,
            disabledColor: disabledColor ?? Colors.grey[200],
            textStyle: textStyle,
            elevation: elevation,
            height: height,
            textSize: textSize,
            textColor: textColor,
            builderText: builderText,
            enableEffectClicked: enableEffectClicked,
            border: border,
            onPressed: onPressed);

  @override
  Widget build(BuildContext context) => body(
      context: context,
      child: Txt(
        text,
        textAlign: TextAlign.center,
        textSize: textSize,
        textColor: textColor,
        textStyle: textStyle,
      ));
}

class CustomProgressButton extends CustomButton {
  CustomProgressButton(
      {this.isLoading = false,
      this.ignorePlatform = false,
      required String value,
      double border = 8.0,
      double elevation = 8.0,
      TextStyle Function(TextStyle style)? textStyle,
      Color? activeColor,
      Color? disabledColor,
      double height = 50.0,
      bool enableEffectClicked = true,
      Widget Function(String value)? builderText,
      VoidCallback? onPressed,
      double? textSize,
      Color? textColor})
      : assert(value != null),
        assert(isLoading != null),
        assert(enableEffectClicked != null),
        super(
            text: value,
            activeColor: activeColor,
            disabledColor: disabledColor ?? Colors.grey[200],
            textStyle: textStyle,
            textSize: textSize,
            enableEffectClicked: enableEffectClicked,
            builderText: builderText,
            textColor: textColor,
            elevation: elevation ,
            height: height,
            border: border ,
            onPressed: (isLoading) ? null : onPressed);

  final bool isLoading;

  final bool ignorePlatform;

  @override
  Widget build(BuildContext context) {
    if (!isLoading)
      return body(
          context: context,
          child: Txt(
            text,
            textStyle: textStyle,
            textSize: textSize,
            textColor: textColor,
          ));
    else
      return body(
          context: context,
          child: Center(
            child: CustomProgress(
              color: activeColor!,
              ignorePlatform: ignorePlatform,
            ),
          ));
  }
}
