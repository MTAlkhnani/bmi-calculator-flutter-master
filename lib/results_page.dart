import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import 'constants.dart';
import 'input_page.dart';

class Results extends StatelessWidget {
  const Results({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RESULTS'), automaticallyImplyLeading: false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(40, 50, 40, 50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: activeCardColor,
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    flex: 0,
                    child: Text(
                      status,
                      style: kStyleOfText.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: statusColor),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    flex: 0,
                    child: Text(
                      bmi.toStringAsFixed(2),
                      style: kStyleOfNum.copyWith(fontSize: 70),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    flex: 0,
                    child: Text(
                      'Normal BMI range:',
                      style: kStyleOfText.copyWith(fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    flex: 0,
                    child: Text(
                      '18.5 - 25 kg/m2',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    flex: 0,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: Color(0xFFEB104D),
              width: double.infinity,
              height: 80,
              child: Center(
                child: Text(
                  'RE-CALCULATE YOUR BMI',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CalculateBMI {
  CalculateBMI(
      {this.status,
      @required this.height,
      @required this.weight,
      this.age,
      this.gender});
  String status;
  double height;
  double weight;
  int age;
  Gender gender;
  Color statusColor;
  String text;

  double getBmi() {
    height = height / 100;
    return weight / (height * height);
  }

  String getStatus() {
    if (bmi < 18.5) {
      status = 'UNDERWEIGHT';
    } else if (bmi >= 18.5 && bmi < 25) {
      status = 'NORMAL';
    } else if (bmi >= 25) {
      status = 'OVERWEIGHT';
    }
    return status;
  }

  Color getStatusColor() {
    if (getStatus() == 'UNDERWEIGHT') {
      statusColor = Colors.blue;
    } else if (getStatus() == 'NORMAL') {
      statusColor = Colors.green;
    } else {
      statusColor = Colors.yellow;
    }
    return statusColor;
  }

  String getText() {
    if (getStatus() == 'UNDERWEIGHT') {
      text =
          'If your BMI is less than 18.5, it falls within the underweight range.';
    } else if (getStatus() == 'NORMAL') {
      text =
          'If your BMI is 18.5 to 24.9, it falls within the normal or Healthy Weight range.';
    } else {
      text =
          'If your BMI is 25 or higher, it falls within the overweight range.';
    }
    return text;
  }
}
