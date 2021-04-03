import 'package:bmi_calculator/models/person.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Person person = Person();

  @override
  void initState() {
    // TODO: implement initState
    this.person = Person();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    didTouchUp: (details) {
                      this.setState(() {
                        this.person.gender = Gender.male;
                      });
                    },
                    backgroundColor: kColor,
                    child: IconContent.maleCard(
                        this.person.gender == Gender.male
                            ? kActiveForegroundColor
                            : kInactiveForegroundColor),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    didTouchUp: (details) {
                      this.setState(() {
                        this.person.gender = Gender.female;
                      });
                    },
                    backgroundColor: kColor,
                    child: IconContent.femaleCard(
                        this.person.gender == Gender.female
                            ? kActiveForegroundColor
                            : kInactiveForegroundColor),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              backgroundColor: kColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Height",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        this.person.height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        "cm",
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(this.context).copyWith(
                      activeTrackColor: kActiveForegroundColor,
                      thumbColor: Color(0xffeb1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      overlayColor: Color(0x15eb1555),
                    ),
                    child: Slider(
                      value: this.person.height,
                      min: kPersonMinHeight,
                      max: kPersonMaxHeight,
                      inactiveColor: kInactiveForegroundColor,
                      onChanged: (value) {
                        print("value is = $value");
                        double rounded = value.roundToDouble();
                        print("value is = $rounded");
                        this.setState(() {
                          this.person.height = rounded;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    backgroundColor: kColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "WEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          this.person.weight.roundToDouble().toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <RoundIconButton>[
                            RoundIconButton(
                              icon: Icons.remove,
                              handleTap: () {
                                this.setState(() {
                                  this.person.weight -= 1;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                              handleTap: () {
                                this.setState(() {
                                  this.person.weight += 1;
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
                  child: ReusableCard(
                    backgroundColor: kColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          this.person.age.roundToDouble().toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <RoundIconButton>[
                            RoundIconButton(
                              icon: Icons.remove,
                              handleTap: () {
                                this.setState(() {
                                  this.person.age -= 1;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                              handleTap: () {
                                this.setState(() {
                                  this.person.age += 1;
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
            onTapUp: (details) {
              this.person.calculate();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultsPage(
                      person: this.person,
                      recalculate: () {
                        this.reset();
                      },
                    );
                  },
                ),
              );
            },
            child: Container(
              child: Center(
                child: Text(
                  "CALCULATE",
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

  void reset() {
    print("RESET METHOD CALLED.........");
    this.setState(() {
      this.person = Person();
    });
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function handleTap;

  RoundIconButton({this.icon, this.handleTap});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(this.icon),
      onPressed: this.handleTap,
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: kInactiveForegroundColor,
      constraints: BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
    );
  }
}
