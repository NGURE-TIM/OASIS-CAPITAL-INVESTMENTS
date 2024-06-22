import 'package:flutter/material.dart';
import 'package:fulusi/colors/colors.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../global/size_config.dart';
import '../globalWidgets.dart';

import '../logins/login_screens/register/verify.dart';
import 'code.dart';

class AccountInfo extends StatefulWidget {
  const AccountInfo({Key? key}) : super(key: key);

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Image(
                width:  SizeConfig.screenWidth *0.9,
              height: SizeConfig.screenHeight * 0.53,
                image: Svg('assets/images/account_Info/Account info/undraw_my_personal_files_re_3q0p.svg'),
              ),
              SizedBox(
                height: 20,
              ),
              TextWidget('We only need a few personal details to set up your account.',
                  FontWeight.w700,
                  mainBlue,
              ),
           SizedBox(
                height: 10,
              ),
              TextWidget('A complete profile will help us to facilitate the processing of your request.',
                FontWeight.w400,
               grey,
              ),
                 SizedBox(
                height: 20,
              ),
               Text('Read our privacy policy.',
                style:TextStyle(
                  decoration: TextDecoration.underline,
                  color:error,
                  fontWeight: FontWeight.w600,
                  fontSize:  15,
                ),
              ),
               SizedBox(
                height:50,
          
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElavatedButton('Skip ' , white ,mainBlue , (){Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Verify()),
                  );},3),
                  SizedBox(width: SizeConfig.screenWidth * 0.04),
                  ElavatedButton('Continue' , white, mainOrange,(){Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Referral()),
                  );},3),
          
                ],
              ),
          
          
            ],
          ),
        ),
      )
    ));
  }
}






