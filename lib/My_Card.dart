import 'package:flutter/material.dart';

const Color cardColor = Color(0xFF141A3C);

class MyCard extends StatelessWidget {
  MyCard(
      {@required this.margin,
      this.color = cardColor,
      @required this.borderRadius,
      this.child,
      this.onPressed});

  final child;
  final EdgeInsets margin;
  final Color color;
  final BorderRadius borderRadius;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: child,
        margin: margin,
        decoration: BoxDecoration(color: color, borderRadius: borderRadius),
      ),
    );
  }
}
