import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'bottom_button.dart';
class ResultPage extends StatelessWidget {

  ResultPage({@required this.bmiResult,@required this.feed,@required this.resultText});
  final String bmiResult;
  final String resultText;
  final String feed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),


      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result',style:kResultTitleStyle),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText,style: kResultTextStyle,),
                  Text(bmiResult,style: kBmiStyle,),
                  Text(feed,style: kFeedStyle,),


                ],
              ),



            ),
          ),
          BottomButton(
            text: 'RE-CALCULATE',
            onClick:(){
              Navigator.pop(context);
    },),


        ],

      ),

    );
  }
}
