import 'package:flutter/material.dart';
import 'package:fulusi/colors/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'dataEntryWidgets/widgets.dart';


late String Firstname='x';
late String Middlename='x';
late String Lastname='x';
late String ID='x';
late String DOB='x';
late String Gender='x';

bool Complete=false;
onComplete()async{
while(Complete==false)
  await Future.delayed(Duration(seconds:20));
if(Complete){

}

}
class entry extends StatefulWidget {
  const entry({Key? key}) : super(key: key);

  @override
  State<entry> createState() => _entryState();
}

class _entryState extends State<entry> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child:Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text('Application information',
style:TextStyle(
  fontWeight: FontWeight.w800,
  fontSize: 30,
  color: seedBlue
),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Kindly fill in the following Information',
                style:TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: grey
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  circle('1' , 'Basic',seedBlue , white , black),

                  circle('2' , 'Personal' , transparent , seedBlue , grey),

                  circle('3' , 'Contact',transparent , seedBlue ,grey)
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              TextFields('First name','Please enter first name' ,Firstname),
              TextFields('Middle name','Please enter middle name',Middlename),
              TextFields('Last name','Please enter last name',Lastname),
              TextFields('National id','Kenyan issue',ID),
              TextFields('Date of birth ','dd/mm/yy',DOB),
              TextFields('Gender ','Female/Male',Gender),
              const SizedBox(
                height: 10,
              ),
               Container(
                 height: 60,
                 width: double.infinity,
                 child: ElevatedButton(onPressed: (){}, child: Text(
                  'Next',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: white
                  ),
              ),
                  style: ElevatedButton.styleFrom(
                      elevation: 0, backgroundColor: orange
                  ),
              ),
               ),

            ],
          ),
        ),
      ),
    ));
  }
}


