
import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'result_page.dart';
import 'bottom_button.dart';
import 'round_icon.dart';
import 'calculator_brain.dart';

enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 60;
  int age= 2;
  Gender selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body:Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(


                    child: ReusableCard(
                onPress: (){
                  setState(() {
                    selectedGender=Gender.male;
                  });
    },
                      colour: selectedGender== Gender.male? kActiveColor:kInActiveColor ,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),),
                  ),

                Expanded(



                    child: ReusableCard(
onPress: (){
  setState(() {
    selectedGender=Gender.female;
  });
    },
                      colour: selectedGender== Gender.female? kActiveColor:kInActiveColor,
                      cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),),
                  ),




              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
                colour:kInActiveColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style:kTextStyle,
                  textAlign: TextAlign.center,

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                     height.toString(),
                          style: kNumberStyle,
                    ),
                    Text(
                      'cm',
                          style:kTextStyle
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),

                      ),

                    child:Slider(
                      value: height.toDouble(),
                      min:120,
                      max: 220,
                      onChanged:(double newValue){
                        setState((){
                          height =newValue.round();
                        });
                      },
                    )
    ),
                  ],
                )
              ],
            ),)
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child:
                  ReusableCard(colour: kInActiveColor,
                    cardChild:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style:kNumberStyle

                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           RoundIconButton(icon: FontAwesomeIcons.plus,
                           onClick: (){
                             setState(() {
                               weight++;
                             });
                           },),
                            SizedBox(width: 10.0,),
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                            onClick:(){
                              setState(() {
                                weight--;
                              });
                            },)
                          ],
                        ),

                      ],

                    ))
                ),
                Expanded(
                  child:
                  ReusableCard(colour: kInActiveColor,
                  cardChild:Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text(
    'AGE',
    style: kTextStyle,
    ),
    Text(
    age.toString(),
    style:kNumberStyle

    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    RoundIconButton(icon: FontAwesomeIcons.plus,
    onClick: (){
    setState(() {
    age++;
    });
    },),
    SizedBox(width: 10.0,),
    RoundIconButton(icon: FontAwesomeIcons.minus,
      onClick:(){
       setState(() {
       age--;
       });
       },)
        ],
       ),

          ],

        ))
             ),


            ],
          ),
           ),

    BottomButton(text: 'CALCULATE',onClick: (){
      CalculatorBrain calc = CalculatorBrain(height:height,weight:weight);
      print(calc.calculatorBMI());
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(

        bmiResult:calc.getResult(),
        resultText:calc.calculatorBMI(),
        feed:calc.getFeed(),
      )));
    },)

        ],

      )

    );
  }
}
