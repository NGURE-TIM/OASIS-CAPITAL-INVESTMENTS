import 'dart:ffi';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:fulusi/colors/colors.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:fulusi/data_Entry/photo.dart';
import '../global/size_config.dart';
import '../globalWidgets.dart';
import 'dataEntryWidgets/widgets.dart';


import 'income.dart';
DateTime selectedDate = DateTime.now();
class Birthday extends StatefulWidget {

  const Birthday({Key? key}) : super(key: key);

  @override
  State<Birthday> createState() => _BirthdayState();
}

class _BirthdayState extends State<Birthday> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image(
                    width:  SizeConfig.screenWidth *1,
                    height: SizeConfig.screenHeight * 0.5,
                    image: Svg('assets/images/account_Info/DOB/Calendar-rafiki.svg'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextWidget('Date of birth',
                  FontWeight.w700,
                  mainBlue,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextWidget('Just a few more details to go .Please pick your date of birth.',
                  FontWeight.w400,
                  grey,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,

                  decoration:  BoxDecoration(

                    color: Colors.grey.shade700,
                  ),
                  child:
                  buildScrollDatePicker(
                          ( value) {
                          selectedDate = value;
                      }
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: ElavatedButton('Continue' , white, mainOrange,(){

                      if(selectedDate != DateTime.now()){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  const Income()),
                        );
                      }

                  },3),
                )


              ],
            ),
          ),
        )
    ));
  }
ScrollDatePicker buildScrollDatePicker(Function(DateTime) onChanged ) {
    return ScrollDatePicker(

                  selectedDate: selectedDate,
                  locale: const Locale('en'),
                  onDateTimeChanged: onChanged,
                );
  }


}


