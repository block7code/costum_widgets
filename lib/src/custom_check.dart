import 'package:costum_widgets/costum_widgets.dart';
import 'package:flutter/material.dart';

enum CheckType { circle, custom }

class CustomCheck extends StatelessWidget {
  final double size;

  final CheckType type;

  final double sizePoint;

  final double borderRadius;

  final bool value;

  final ValueChanged<bool>? onChanged;

  final Color activeColor;

  final Color checkColor;

  final Color colorPoint;

  final Widget Function(BuildContext context, double sizePoint)? builder;

  CustomCheck(
      {this.size = 20,
      this.borderRadius = 0.0,
      this.sizePoint = 14.0,
      required this.value,
      this.type = CheckType.custom,
      this.onChanged,
      this.builder,
      this.activeColor = Colors.black,
      this.checkColor = Colors.grey,
      this.colorPoint = Colors.white});

  _builder(BuildContext context) {
    if (!value) return empty;

    if (builder == null) return _defaultPoint;

    return Center(
      child: builder!(context, this.sizePoint),
    );
  }

  _decoration() {
    if (type == CheckType.custom) {
      return BoxDecoration(
          color: (value) ? activeColor : Colors.transparent,
          shape: BoxShape.rectangle,
          border:
              Border.all(width: 2.0, color: (value) ? activeColor : checkColor),
          borderRadius: BorderRadius.circular(borderRadius));
    } else if (type == CheckType.circle) {
      return BoxDecoration(
          border:
              Border.all(width: 2.0, color: (value) ? activeColor : checkColor),
          color: (value) ? activeColor : Colors.transparent,
          shape: BoxShape.circle);
    }
  }

  Widget get _defaultPoint => Center(
        child: Icon(
          Icons.done,
          color: colorPoint,
          size: sizePoint,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.all(8.0),
        decoration: _decoration(),
        width: size,
        height: size,
        child: _builder(context),
      ),
      onTap: () => (onChanged != null) ? onChanged!(!value) : null,
    );
  }
}
