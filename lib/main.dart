import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //primaryColor: Color(0xFF0A0E21),
        colorScheme: ColorScheme.light(
            primary: Color(0xFF101639), secondary: Colors.purple),
        scaffoldBackgroundColor: Color(0xFF0D1237),
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: InputPage(),
    );
  }
}
