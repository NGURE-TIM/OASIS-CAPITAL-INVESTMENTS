import 'package:flutter/material.dart';
import 'package:fulusi/colors/colors.dart';
import 'package:provider/provider.dart';
import '../global/size_config.dart';
import '../globalWidgets.dart';
import 'package:gif_view/gif_view.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../Database/firebase.dart';


import '../logins/login_screens/register/verify.dart';
import '../stateManagement_provider/provider.dart';

String? educationLevel;
String? wageLevel;
class Income extends StatefulWidget {

  const Income({Key? key}) : super(key: key);

  @override
  State<Income> createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
  List educationLevelList=[
    'No Education ' ,'High School ','College ', 'Post Graduate', 'Doctorate', 'Professor',
  ];


  List wageLevelList=[
    '0-20,000 ' ,'20,000-50,000 ','50,000-100,000 ', '100,000-500,000', 'above 500,000',
  ];

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
                  child:  GifView.asset(
                    'assets/images/account_Info/Income/Money income.gif',
                    width:  SizeConfig.screenWidth *1,
                    height: SizeConfig.screenHeight * 0.3,
                    frameRate: 30, // default is 15 FPS
                  )
                ),
                const SizedBox(
                  height: 20,
                ),
                TextWidget('Economic and professional status',
                  FontWeight.w700,
                  mainBlue,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextWidget('Thank you for your patience and cooperation as we finalize the last few details.',
                  FontWeight.w400,
                  grey,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextWidget('Education level',
                  FontWeight.w400,
                  mainBlue,
                ),
                const SizedBox(
                  height: 10,
                ),
          buildDropdownButtonHideUnderline(educationLevelList, educationLevel,(value){
              setState(() {
                educationLevel=value as String;
              });

          }),
                const SizedBox(
                  height: 20,
                ),
                TextWidget('Income bracket',
                  FontWeight.w400,
                  mainBlue,
                ),
                const SizedBox(
                  height: 10,
                ),
                buildDropdownButtonHideUnderline(wageLevelList, wageLevel,(value){
                  setState(() {
                    wageLevel=value as String;
                  });

                }),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: ElavatedButton('Finish' , white, mainOrange,() async{
                             await push(context);
                    //TODO :PREVENT USER FROM WRITING INTO DB MORE THAN ONCE
                  },3),
                )


              ],
            ),
          ),
        )
    ));
  }

  DropdownButtonHideUnderline buildDropdownButtonHideUnderline( List list, String? chooseValue ,Function(Object?)onChanged ) {
    return DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            hint:const Text(
              'Select item',
              style:TextStyle(
                fontSize: 14,
                color: grey
              ),
            ),
            items:list.map((value){
              return DropdownMenuItem(
                value:value,
                child:Text(value,
                style: const TextStyle(
                    fontSize:20,
                    color: Colors.black,
                    fontWeight: FontWeight.w400
                ),
                ),
              );
            }).toList(),
            value:chooseValue,
            onChanged: onChanged,
            buttonStyleData: ButtonStyleData(
              height: 50,
              width: double.infinity,
              padding: const EdgeInsets.only(left: 14, right: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: black,
                ),
                color: white,
              ),
              elevation: 5,
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.arrow_drop_down_circle_outlined,
              ),
              iconSize: 20,
              iconEnabledColor: mainBlue,
              iconDisabledColor:mainBlue,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: white,
              ),
              offset: const Offset(-20, 0),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all(6),
                thumbVisibility: MaterialStateProperty.all(true),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 30,
              padding: EdgeInsets.only(left: 14, right: 14),
            ),
          ),


        );
  }



}

 push(BuildContext context)async {
  await pushToDb(context);

}

navigate(BuildContext context){

  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  const Verify()),
  );
}
