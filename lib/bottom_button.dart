import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {

  BottomButton({this.text,this.onClick});
final String text;
  final Function onClick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onClick,
      child: Container(

        child:Text( text,
    style: kLargeButtonStyle,
          textAlign: TextAlign.center,
        ),
        color: kBottomContainerColor,
        padding:EdgeInsets.only(top: 22.0),
        width: double.infinity,
        margin: EdgeInsets.only(top: 10.0),
        height: kBottomContainerHeight,
      ),
    );
  }
}

