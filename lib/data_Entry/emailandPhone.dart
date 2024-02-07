import 'package:flutter/material.dart';
import 'package:fulusi/colors/colors.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:fulusi/data_Entry/dob.dart';
import 'package:fulusi/data_Entry/photo.dart';
import '../globalWidgets.dart';
import 'dataEntryWidgets/widgets.dart';
import 'package:gif_view/gif_view.dart';

class Contacts extends StatefulWidget {

  const Contacts({Key? key}) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  late String phoneNumber ;
  late String email;
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
                    width: 300,
                    height: 300,
                    image: Svg('assets/images/account_Info/Email and password/Email capture-pana.svg'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextWidget('Contact details',
                  FontWeight.w700,
                  mainBlue,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextWidget('Please type in your email and phone number.',
                  FontWeight.w400,
                  grey,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextWidget('Email',
                  FontWeight.w400,
                  mainBlue,
                ),
                buildTextField((value){
                  email=value;
                } , 'Email', 'johndoe@gmail.com', TextInputType.emailAddress),
                const SizedBox(
                  height: 20,
                ),
                TextWidget('Phone number',
                  FontWeight.w400,
                  mainBlue,
                ),
                buildTextField((value){
                  phoneNumber=value;
                } , 'Phone number', '+254 xxx xxx xxx', TextInputType.number),
                const SizedBox(
                  height: 60,
                ),
              Center(
                  child: ElavatedButton('Continue' , white, mainOrange,(){
                    try{
                      if(email.isNotEmpty && phoneNumber.isNotEmpty){
                        print(email);
                        print(phoneNumber);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  const Birthday()),
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



