import 'package:flutter/material.dart';
import 'package:fulusi/colors/colors.dart';

class circle extends StatelessWidget {
  String text;
  String label;
  Color fill;
  Color textColor;
  Color textColor2;
  circle(this.text, this.label, this.fill,this.textColor , this.textColor2);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(
                width: 2,
                color: seedBlue
            ),
            color: fill,
            shape: BoxShape.circle
        ),
        child: Center(
          child: Text(text,
            style:TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: textColor
            ),
          ),
        ),
      ),
        SizedBox(
          height:5,
        ),
        Text(label,
          style:TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: textColor2
          ),
        )
      ],
    );
  }
}





class TextFields extends StatelessWidget {

  String label;
  String hintText;
  String textvalue;
  Function (String) onChanged;
  TextFields(this.label , this.hintText , this.textvalue , this.onChanged);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          label,
          style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: black
          ),
        ),
        Container(
          height: 55,
          width: double.infinity,
          child: TextField(
            style: TextStyle(
                color: black
            ),

            autofocus: false,
            textAlign: TextAlign.left,
            //controller: controller,
            cursorColor: grey,
            decoration:InputDecoration(
                hintText: hintText,
                enabledBorder: const OutlineInputBorder(
                  borderRadius :BorderRadius.all(Radius.circular(10)),
                  borderSide:  BorderSide(
                      color: grey, width: 2.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius :BorderRadius.all(Radius.circular(10)),
                  borderSide:  BorderSide(
                      color: seedBlue, width: 2.0),
                ),
                hintStyle: TextStyle(
                    color: grey,fontSize: 20)),
            onChanged:onChanged,
          ),
        ),
      ],
    );
  }
}



Container buildTextField(  Function(String)onChanged , String label,String hint ,TextInputType type , TextEditingController controller  ) {

  return Container(
    width: 300,
    child: TextField(
      onChanged: onChanged,
controller: controller,
      cursorColor: white,
      keyboardType: type,
      style:const TextStyle(
          fontSize:20,
          color: Colors.black,
          fontWeight: FontWeight.w300
      ),
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: black), // Set the color you want
        ),
        enabledBorder: UnderlineInputBorder(

          borderSide: BorderSide(color: black), // Set the color you want
        ),

        hintText: hint,
        hintStyle:TextStyle(
            fontWeight: FontWeight.w200,
            color: grey
        ) ,
        filled: false,
      ) ,
    ),
  );
}