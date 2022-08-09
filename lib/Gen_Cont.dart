import 'package:flutter/material.dart';

const Color defColor = Color(0xFFBABAC8);

class GenCont extends StatelessWidget {
  GenCont({@required this.icon, @required this.text, this.color = defColor});
  final IconData icon;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 70,
          color: color,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: color,
          ),
        )
      ],
    );
  }
}
