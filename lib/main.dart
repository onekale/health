import 'package:flutter/material.dart';
import 'Input_Page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI CALCULATOR',
      theme: ThemeData.dark(),
      home: InputPage(),
    );
  }
}
