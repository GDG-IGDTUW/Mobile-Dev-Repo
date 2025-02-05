import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double bmi;

  ResultScreen({required this.bmi});

  String getBMICategory() {
    if (bmi < 18.5) {
      return "UnderWeight";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return "Normal Weight";
    } else if (bmi >= 25 && bmi < 29.9) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6DA80),
      appBar: AppBar(
        title: Text(
          "BMI Result",
          style: TextStyle(
            color: Color(0xFFF2CAA8),
          ),
        ),
        backgroundColor: const Color(0xFF9C7E39),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Your BMI is :",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              getBMICategory(),
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Go Back",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
                backgroundColor: Color(0xFF9C7E39),
              ),
            )
          ],
        ),
      ),
    );
  }
}
