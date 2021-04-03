import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constants.dart';

class ReusableCard extends StatelessWidget {
  final Color backgroundColor;
  final Function didTouchUp;
  final Widget child;

  ReusableCard({this.backgroundColor, this.didTouchUp, this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: this.didTouchUp,
      child: Container(
        child: this.child,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: this.backgroundColor,
        ),
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      ),
    );
  }
}
