import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  InfoCard(
      {@required this.gender,
      @required this.height,
      @required this.weight,
      @required this.age,
      @required this.bmi,
      @required this.status});

  final String status;
  final Gender gender;
  final double height;
  final double weight;
  final int age;
  final double bmi;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: activeCardColor,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[Text('data'), Text('data')],
          ),
          Row(
            children: <Widget>[Text('data'), Text('data')],
          ),
          Row(
            children: <Widget>[Text('data'), Text('data')],
          ),
        ],
      ),
    );
  }
// it will add a list view to the side menu
}
