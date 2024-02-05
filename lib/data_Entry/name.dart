import 'package:flutter/material.dart';
import 'package:fulusi/colors/colors.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:fulusi/data_Entry/photo.dart';
import '../globalWidgets.dart';
import 'dataEntryWidgets/widgets.dart';


class Name extends StatefulWidget {

  const Name({Key? key}) : super(key: key);

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  late String name;
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
                    image: Svg('assets/images/account_Info/Name/Men talking-pana (1).svg'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextWidget('Your full name',
                  FontWeight.w700,
                  mainBlue,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextWidget('Please type in your full name e.g John Doe.',
                  FontWeight.w400,
                  grey,
                ),
                const SizedBox(
                  height: 20,
                ),
                buildTextField(name),
                const SizedBox(
                  height: 50,
                ),
      Center(
          child: ElavatedButton('Continue' , white, mainOrange,(){
            try{
              if (name.isNotEmpty){
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





