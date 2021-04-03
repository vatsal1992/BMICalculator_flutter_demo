import 'package:bmi_calculator/models/person.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';

class ResultsPage extends StatelessWidget {
  final Person person;
  final Function recalculate;

  ResultsPage({@required this.person, @required this.recalculate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Text(
                "Your Result",
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              backgroundColor: kColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    this.person.getNameOf().toUpperCase(),
                    style: kResultTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    this.person.getBMIValue().toStringAsFixed(1),
                    style: kBMITextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    this.person.getMessageOfBMIStatus(),
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTapUp: (details) {
              Navigator.pop(context);
              this.recalculate();
            },
            child: Container(
              child: Center(
                child: Text(
                  "RE-CALCULATE",
                  style: kLargeButtonTextStyle,
                ),
              ),
              color: kBottomColor,
              padding: EdgeInsets.only(bottom: 10.0),
              margin: EdgeInsets.only(top: 5),
              width: double.infinity,
              height: 80.0,
            ),
          ),
        ],
      ),
    );
  }
}
