import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Gen_Cont.dart';
import 'My_Card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'info_card.dart';

enum Gender {
  male,
  female,
}

double height = 170;
double weight = 60;
int age = 18;
double bmi;
Gender gender;
String status;
Color statusColor;
String text;

List<Widget> results = [];

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
      drawer: Drawer(
        backgroundColor: Color(0xFF141A3C),
        child: ListView(
          children: results,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kStyleOfText,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toInt().toString(),
                        style: kStyleOfNum,
                      ),
                      Text(
                        'CM',
                        style: kStyleOfText,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Color(0xFFFFFFFF),
                        overlayColor: Color(0x30EB1555),
                        inactiveTrackColor: Color(0xFF888993),
                        thumbColor: Color(0xFFEB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 12)),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round().toDouble();
                        });
                      },
                      min: 120,
                      max: 220,
                    ),
                  )
                ],
              ),
            ),
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
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kStyleOfText,
                        ),
                        Text(
                          weight.toInt().toString(),
                          style: kStyleOfNum,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MyCard(
                    margin: EdgeInsets.fromLTRB(3, 15, 15, 15),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kStyleOfText,
                        ),
                        Text(
                          '$age',
                          style: kStyleOfNum,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => Results())));
              setState(() {
                CalculateBMI bmiClass = CalculateBMI(
                    height: height, weight: weight, gender: selectedGender);
                bmi = bmiClass.getBmi();
                status = bmiClass.getStatus();
                statusColor = bmiClass.getStatusColor();
                text = bmiClass.getText();
                gender = selectedGender;
              });
            },
            child: Container(
              color: Color(0xFFEB104D),
              width: double.infinity,
              height: 80,
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(color: Colors.white, fontSize: 23),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      //elevation: 0.0,
      child: Icon(
        icon,
        color: Color(0xFFBABAC8),
      ),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      splashColor: Color(0xFF4C4F5E),
    );
  }
}
