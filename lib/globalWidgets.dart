
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
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 3, backgroundColor: bodyColor
      ), child: Text(
        text,
        style: TextStyle(
            color: textColor,
                fontSize: 12
        ),
      ),
    );
  }
}