import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constants.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color foregroundColor;

  IconContent({this.icon, this.label, this.foregroundColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FaIcon(
          this.icon,
          color: this.foregroundColor,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          this.label,
          style: TextStyle(
            fontSize: 18,
            color: this.foregroundColor,
          ),
        ),
      ],
    );
  }

  static IconContent maleCard(Color color) {
    return IconContent(
      label: "Male",
      icon: FontAwesomeIcons.mars,
      foregroundColor: color,
    );
  }

  static IconContent femaleCard(Color color) {
    return IconContent(
      label: "Female",
      icon: FontAwesomeIcons.venus,
      foregroundColor: color,
    );
  }
}
