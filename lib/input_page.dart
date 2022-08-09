import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Gen_Cont.dart';
import 'My_Card.dart';

const Color activeCardColor = Color(0xFF272A4E);
const Color unActiveCardColor = Color(0xFF141A3C);
const Color activeTextColor = Colors.white;
const Color unActiveTextColor = Color(0xFFBABAC8);

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = Color(0xFF141A3C);
  Color femaleCardColor = Color(0xFF141A3C);
  Color maleTextColor = Color(0xFFBABAC8);
  Color femaleTextColor = Color(0xFFBABAC8);

  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: Color(0xFF101639),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyCard(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? activeCardColor
                        : unActiveCardColor,
                    margin: EdgeInsets.fromLTRB(15, 15, 3, 15),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    child: GenCont(
                      icon: FontAwesomeIcons.mars,
                      text: 'MALE',
                      color: selectedGender == Gender.male
                          ? activeTextColor
                          : unActiveTextColor,
                    ),
                  ),
                ),
                Expanded(
                  child: MyCard(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? activeCardColor
                        : unActiveCardColor,
                    margin: EdgeInsets.fromLTRB(3, 15, 15, 15),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    child: GenCont(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                      color: selectedGender == Gender.female
                          ? activeTextColor
                          : unActiveTextColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Middle card
          Expanded(
            child: MyCard(
                margin: EdgeInsets.all(15),
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyCard(
                      margin: EdgeInsets.fromLTRB(15, 15, 3, 15),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      )),
                ),
                Expanded(
                  child: MyCard(
                      margin: EdgeInsets.fromLTRB(3, 15, 15, 15),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )),
                ),
              ],
            ),
          ),
          Container(
            color: Color(0xFFEB104D),
            width: double.infinity,
            height: 80,
          ),
        ],
      ),
    );
  }
}
