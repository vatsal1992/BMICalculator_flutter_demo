import 'package:bmi_calculator/constants.dart';
import 'dart:math';

///BMIStatus - set 'normal' for default selection
enum BMIStatus { underweight, normal, overweight, obese }

class Person {
  ///Height is in Centimeters.millimeters
  double height = 160.0;

  ///Weight is in Kilograms.grams
  double weight = 50.0;

  ///Age is in Years.months
  double age = 25.0;

  ///Gender is 'male' or 'female'. Set 'none' for no default selection.
  Gender gender = Gender.female;

  BMIStatus _status = BMIStatus.normal;

  double _bmiValue = 0.0;

  ///Default. Gender = female, age = 25, weight = 50, height = 160
  Person(
      {this.age = 25,
      this.height = 160,
      this.weight = 50,
      this.gender = Gender.female});

  ///MARK:- PUBLIC METHODS---------------
  void calculate() {
    this._bmiValue = this._calculateBMI();
    this._status = this._getBMIStatus(this._bmiValue);
  }

  double getBMIValue() {
    return this._bmiValue;
  }

  ///Get Message of BMIStatus
  String getMessageOfBMIStatus() {
    String msg = "";
    switch (this._status) {
      case BMIStatus.underweight:
        msg =
            "You have a lower than normal body weight. You can eat a bit more.";
        break;
      case BMIStatus.overweight:
        msg =
            "You have a higher than normal body weight. Try to exercise more.";
        break;
      case BMIStatus.normal:
        msg = "Great news!,You have a perfect body weight. Good Job!";
        break;
      case BMIStatus.obese:
        msg =
            "You have a very high body weight. You must start exercise from now!";
        break;
    }
    return msg;
  }

  ///Get Name of BMIStatus
  String getNameOf() {
    String msg = "";
    switch (this._status) {
      case BMIStatus.underweight:
        msg = "Underweight";
        break;
      case BMIStatus.overweight:
        msg = "Overweight";
        break;
      case BMIStatus.normal:
        msg = "Normal";
        break;
      case BMIStatus.obese:
        msg = "Obese";
        break;
    }
    return msg;
  }

  ///MARK:- PRIVATE METHODS-------------------

  ///Calculate person's BMI value
  double _calculateBMI() {
    return (this.weight / pow(this.height / 100, 2));
  }

  ///Calculate person's BMI value BMIStatus.
  BMIStatus _getBMIStatus(double bmi) {
    //double bmi = this.weight / pow(this.height / 100, 2);
    if (bmi > 29.9) {
      return BMIStatus.obese;
    } else if (bmi > 24.9 && bmi < 30.0) {
      return BMIStatus.overweight;
    } else if (bmi > 18.4 && bmi < 25.0) {
      return BMIStatus.normal;
    } else {
      ///From 18.4 to lower is called underweight.
      return BMIStatus.underweight;
    }
  }
}
