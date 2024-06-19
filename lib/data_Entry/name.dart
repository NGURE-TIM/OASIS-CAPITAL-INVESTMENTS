import 'package:flutter/material.dart';
import 'package:fulusi/colors/colors.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:fulusi/data_Entry/photo.dart';
import '../global/size_config.dart';
import '../globalWidgets.dart';
import 'dataEntryWidgets/widgets.dart';

TextEditingController controller= TextEditingController();
TextEditingController idcontroller= TextEditingController();
late String name ;
late String id;

class Name extends StatefulWidget {

  const Name({Key? key}) : super(key: key);

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {

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
                    height: SizeConfig.screenHeight * 0.35,
                    image: Svg('assets/images/account_Info/Name/Men talking-pana (1).svg'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextWidget('Identification',
                  FontWeight.w700,
                  mainBlue,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextWidget('Please type in your full name e.g John Doe , and Kenyan ID number',
                  FontWeight.w400,
                  grey,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextWidget('Full name',
                  FontWeight.w400,
                  mainBlue,
                ),

                buildTextField((value){

                  name=value;
                } , '', 'John Doe', TextInputType.text ,controller),
                const SizedBox(
                  height: 20,
                ),
                TextWidget('Id number',
                  FontWeight.w400,
                  mainBlue,
                ),
                buildTextField((value){
                  id=value;
                } , '', 'Kenyan issue', TextInputType.number ,idcontroller),
                const SizedBox(
                  height: 50,
                ),
      Center(
          child: ElavatedButton('Continue' , white, mainOrange,(){
            try{
             if(name.isNotEmpty && id.isNotEmpty){
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) =>  const Photo()),
               );
             }


            }
            catch(e){
              // TODO:HANDLE INSTANCE WHERE USER TRIES TO PROCEED WITHOUT TYPING IN NAME---ACCESS OF NAME VARIABLE WHERE ITS DOESN'T EXIST
            }


          },3),
      )


              ],
            ),
          ),
        )
    ));
  }

}





