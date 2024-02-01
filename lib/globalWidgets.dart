
import 'package:flutter/material.dart';

class ElavatedButton extends StatelessWidget {
 Function() onPressed ;
  String text;
  Color textColor;
  Color bodyColor;

  ElavatedButton(this.text,this.textColor,this.bodyColor , this.onPressed);


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed:onPressed,
      style:

      ElevatedButton.styleFrom(
    fixedSize: Size(150, 45),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          elevation: 3, backgroundColor: bodyColor
      ), child: Text(
        text,
        style: TextStyle(
            color: textColor,
                fontSize:17
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  FontWeight? weight;

  Color textColor;
  String textBody;

  TextWidget(this.textBody,this.weight,this.textColor);

  @override
  Widget build(BuildContext context) {
    return Text(textBody,
      style: TextStyle(
        color:textColor,
        fontWeight: weight,
        fontSize: 20,
      ),
    );
  }
}
