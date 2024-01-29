
import 'package:fulusi/colors/colors.dart';
import 'dataEntryWidgets/widgets.dart';
import 'package:flutter/material.dart';
import 'contacts.dart';
late String Education='x';
late String Jobstatus='x';
late String Profession='x';
late String Salary='x';
late String Maritalstatus='x';

bool Complete=false;
bool buttonIsPressed=false;
onComplete(){

  if (Education != 'x' &&
      Jobstatus != 'x' &&
      Profession != 'x' &&
      Salary != 'x' &&
      Maritalstatus != 'x'){
    Complete=true;
  }
  else{

    Complete=false;
  }
}


class Personal extends StatefulWidget {
  String Firstname;
  String Middlename;
  String Lastname;
  String ID;
  String DOB;
  String Gender;
  //User? user;
  Personal( this. Firstname , this.Middlename , this.Lastname , this.ID , this.DOB , this.Gender);


  @override
  State<Personal> createState() => _entryState();
}

class _entryState extends State<Personal> {
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
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  circle('1' , 'Basic',seedBlue , white , black),

                  circle('2' , 'Personal' , seedBlue , white, black),

                  circle('3' , 'Contact',transparent , seedBlue ,grey)
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              TextFields('Education','Highest education merit' ,Education, (value){
                Education=value;
              }),
              TextFields('Job status','Employed/Un-employed',Jobstatus,(value){
                Jobstatus=value;
              }),
              TextFields('Profession','Please enter your profession',Profession,(value){
                Profession=value;
              }),
              TextFields('Salary','Monthly gross salary',Salary,(value){
                Salary=value;
              }),
              TextFields('Marital status ','Single/Married',Maritalstatus,(value){
                Maritalstatus=value;
              }),
              const SizedBox(
                height: 10,
              ),
              if (Complete==false && buttonIsPressed)
                const Center(
                  child: Column(
                    children: [
                      Text(
                        'One or more fields are not filled !!',
                        style: TextStyle(
                          color: error,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),

              Container(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(onPressed: (){

    onComplete();
    if(Complete){

    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Contact(widget.Firstname,widget.Middlename,widget.Lastname ,widget.ID,widget.DOB,widget.Gender, Education,Jobstatus,Profession,Salary,Maritalstatus)),
    );
    }
    else{
    setState(() {
    buttonIsPressed=true;
    });
    }

                }, child: Text(
                  'Next',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: white
                  ),
                ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
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

