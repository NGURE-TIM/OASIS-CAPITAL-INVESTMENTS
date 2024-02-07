import 'package:flutter/material.dart';
import 'package:fulusi/colors/colors.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:fulusi/data_Entry/photo.dart';
import '../globalWidgets.dart';
import 'dataEntryWidgets/widgets.dart';


class Birthday extends StatefulWidget {

  const Birthday({Key? key}) : super(key: key);

  @override
  State<Birthday> createState() => _BirthdayState();
}

class _BirthdayState extends State<Birthday> {
  late String name ;
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
                const Center(
                  child: Image(
                    width: 400,
                    height: 400,
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
                TextWidget('Please pick your date of birth.',
                  FontWeight.w400,
                  grey,
                ),
                const SizedBox(
                  height: 10,
                ),
                buildTextField((value){
                  name=value;
                } , '', 'John Doe', TextInputType.text),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: ElavatedButton('Continue' , white, mainOrange,(){
                    try{
                      if(name.isNotEmpty){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  const Photo()),
                        );
                      }


                    }
                    catch(e){
                      // TODO:HANDLE INSTANCE WHERE USER TRIES TO PROCEED WITHOUT TYPING IN NAME---ACCESS OF NAME VARIABLE WHERE ITS DOESN'T EXIST
                    }


                  }),
                )


              ],
            ),
          ),
        )
    ));
  }

}


