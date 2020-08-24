import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

typedef OnPressed = void Function();

class HoverableButton extends StatefulWidget {
  final Widget child;
  final OnPressed onPressed;
  final double height;
  final double width;

  const HoverableButton(
      {Key key, this.onPressed, this.child, this.height, this.width})
      : super(key: key);

  @override
  _HoverableButtonState createState() => _HoverableButtonState();
}

class _HoverableButtonState extends State<HoverableButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: MouseRegion(
        cursor: SystemMouseCursors.none,
        onEnter: (_) {
          setState(() {
            isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            isHovered = false;
          });
        },
        child: Container(
          height: widget.height,
          width: widget.width,
          child: Center(
            child: AnimatedAlign(
              alignment:
                  !isHovered ? Alignment.bottomCenter : Alignment.topCenter,
              duration: const Duration(milliseconds: 400),
              child: widget.child,
            ),
          ),
        ),
      ),
      onTap: widget.onPressed,
    );
  }
}
