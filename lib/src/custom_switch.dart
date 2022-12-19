import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;

  final Function(bool)? onChanged;

  final Future<bool> Function(bool)? onSynChanged;

  final Color activeColor;

  final Color switchColor;

  final Color pointColor;

  final double width;

  final double height;

  final double sizePoint;

  CustomSwitch({
    Key? key,
    this.value = false,
    this.onChanged,
    this.onSynChanged,
    this.activeColor = Colors.black,
    this.width = 50,
    this.height = 30,
    this.sizePoint = 20,
    this.pointColor = Colors.white,
    this.switchColor = Colors.grey,
  }) : super(key: key) {
    assert((onChanged != null && onSynChanged == null) ||
        (onSynChanged != null && onChanged == null));
    assert(height >= 20 && height <= 30);
    assert(width >= 30 && width <= 50);
  }

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with TickerProviderStateMixin {
  Animation? _circle;
  AnimationController? _controller;

  double get _space => (widget.height < 30) ? 2.0 : 4.0;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 60));

    _circle = AlignmentTween(
            begin: Alignment.centerLeft, end: Alignment.centerRight)
        .animate(CurvedAnimation(parent: _controller!, curve: Curves.linear));

    if (widget.value) {
      _controller!.forward();
    } else {
      _controller!.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller!,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            _onGesture();
          },
          child: Container(
            width: widget.width,
            height: widget.height,
            padding: EdgeInsets.only(left: _space, right: _space),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: _circle!.value == Alignment.centerLeft
                    ? widget.switchColor
                    : widget.activeColor),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 0.0, top: 4.0, right: 0.0, bottom: 4.0),
              child: Align(
                alignment: _circle!.value,
                child: Container(
                  width: widget.sizePoint,
                  height: widget.sizePoint,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: widget.pointColor),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  _onGesture() async {
    if (widget.onChanged == null && widget.onSynChanged == null) return;

    var response = false;

    if (widget.onChanged != null) {
      response = !widget.value;
      widget.onChanged!(response);
    } else {
      response = await widget.onSynChanged!(!widget.value);
    }

    if (response) {
      _controller!.forward();
    } else {
      _controller!.reverse();
    }
  }
}
