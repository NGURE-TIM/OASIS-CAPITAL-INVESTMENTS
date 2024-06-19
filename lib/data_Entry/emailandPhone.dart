import 'package:flutter/material.dart';
import 'package:fulusi/colors/colors.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:fulusi/data_Entry/dob.dart';

import '../global/size_config.dart';
import '../globalWidgets.dart';
import 'dataEntryWidgets/widgets.dart';

TextEditingController emailController =TextEditingController();
TextEditingController phoneNumberController = TextEditingController(text: '+254');
late String phoneNumber ;
late String email;
class Contacts extends StatefulWidget {

  const Contacts({Key? key}) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {

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
                } , 'Email', 'johndoe@gmail.com', TextInputType.emailAddress, emailController),
                const SizedBox(
                  height: 20,
                ),
                TextWidget('Phone number',
                  FontWeight.w400,
                  mainBlue,
                ),
                buildTextField((value){
                  phoneNumber=value;
                } , 'Phone number', '+254 xxx xxx xxx', TextInputType.number ,phoneNumberController),
                const SizedBox(
                  height: 60,
                ),
              Center(
                  child: ElavatedButton('Continue' , white, mainOrange,(){

                      if(email.isNotEmpty && phoneNumber.isNotEmpty){

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  const Birthday()),
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

}



