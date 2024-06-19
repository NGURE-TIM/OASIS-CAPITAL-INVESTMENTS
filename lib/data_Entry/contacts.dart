import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fulusi/colors/colors.dart';
import 'dataEntryWidgets/widgets.dart';
import 'package:flutter/material.dart';
//import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter_dropdown_search/flutter_dropdown_search.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';



late String  phoneNumber1='x';
late String  phoneNumber2='x';

List<String> family =['Father', 'Mother', 'Sister', 'Brother'];
final TextEditingController _controller1=TextEditingController();
final TextEditingController _controller2=TextEditingController();

bool Complete=false;
bool buttonIsPressed=false;
onComplete(){
  if ( phoneNumber1 != 'x' &&
      _controller1.text != 'x' &&
      phoneNumber2 != 'x' &&
      _controller2.text!= 'x' ){
    Complete=true;
  }
  else{
    Complete=false;
  }
}


class Contact extends StatefulWidget{
 String Firstname;
 String Middlename;
String Lastname;
 String ID;
 String DOB;
 String Gender;
 String Education;
 String Jobstatus;
 String Profession;
 String Salary;
 String Maritalstatus;

  //User? user;
 Contact(this.Firstname,this.Middlename,this.Lastname ,this.ID,this.DOB,this.Gender,this.Education,this.Jobstatus,this.Profession,this.Salary, this.Maritalstatus );

  @override
  State<Contact> createState() => _entryState();
}

class _entryState extends State<Contact> {
  String?  relationship1= _controller1.text;
  String?  relationship2 =_controller2.text;
 FirebaseFirestore db =FirebaseFirestore.instance;
   void pushToDb()async{
try{
  await db.collection('userData').add({
    "Firstname":widget.Firstname,
    "Middlename":widget.Middlename,
    " Lastname":widget.Lastname,
    "ID":widget.ID,
    " DOB":widget.DOB,
    " Gender":widget.Gender,
    " Education":widget.Education,
    "Jobstatus":widget.Jobstatus,
    " Profession":widget.Profession,
    "Salary":widget.Salary,
    "Maritalstatus":widget.Maritalstatus,
    "contact person1":{
      " relationship1":relationship1,
      "phoneNumber1 ":phoneNumber1,
    },
    "contact person12":{
      " relationship2":relationship2,
      "phoneNumber2 ":phoneNumber2
    }

  });
}
catch(e){
  print(e);
}
   }

  @override
  void initState() {
    super.initState();
  //  ref = FirebaseDatabase.instance.ref().child('сhats');
  }

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
                height: 20,
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
              Text('Just a few more details',
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

                  circle('3' , 'Contact',seedBlue  , white ,black)
                ],
              ),
              const SizedBox(
                height: 30,
              ),

              contactTextfields('Contact 1','Relationship' ,_controller1,(value){
                phoneNumber1=value;
              }      )  ,
              SizedBox(
                height: 15,
              ),
              contactTextfields(  'Contact 2','Relationship',_controller2,(value){
                phoneNumber2=value;
              }  ),

              const SizedBox(
                height: 20,
              ),
              if (!Complete && buttonIsPressed)
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
                child: ElevatedButton(onPressed: ()async{
                  onComplete();
                  if(Complete){
                    print('jn');
pushToDb();
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


class contactTextfields extends StatelessWidget {

  String contact;
  String relationship;
  TextEditingController _controller;
  Function (String) onChanged2;
  contactTextfields(this.contact,this.relationship  , this._controller , this.onChanged2);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          contact,
          style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: black
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
    'Relationship',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: grey
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        /* DropDownTextField(
          dropdownRadius: 40,
          dropdownColor: white,
          isEnabled: true,
          clearOption: false,
          dropDownItemCount: 6,
         dropDownIconProperty: IconProperty(
           icon: Icons.arrow_drop_down_circle
         ),
          listTextStyle: TextStyle(
            color: black,
          ),
          searchShowCursor: false,
          textFieldDecoration: const InputDecoration(
              hintText: 'Tap to select relationship',
              enabledBorder: OutlineInputBorder(
                borderRadius :BorderRadius.all(Radius.circular(10)),
                borderSide:  BorderSide(
                    color: grey, width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius :BorderRadius.all(Radius.circular(10)),
                borderSide:  BorderSide(
                    color: seedBlue, width: 2.0),
              ),
              hintStyle: TextStyle(
                  color: grey,fontSize: 20)),
          dropDownList: const [
            DropDownValueModel(name: 'Husband', value: "value6"),
            DropDownValueModel(name: 'Wife', value: "value6"),
            DropDownValueModel(name: 'Father', value: "value1"),
            DropDownValueModel(name: 'Mother', value: "value3"),
            DropDownValueModel(name: 'Brother', value: "value5"),
            DropDownValueModel(name: 'Sister', value: "value6"),

          ],
          onChanged: onChanged,
        ),*/
        FlutterDropdownSearch(
          hintText: 'Select relationship',
          textController:_controller,
          items: family,
          dropdownHeight: 100,
          dropdownBgColor: white,
suffixIcon: Icons.arrow_drop_down_circle ,
textFieldBorder:  OutlineInputBorder(
    borderRadius :BorderRadius.all(Radius.circular(10)),
    borderSide:  BorderSide(
    color: grey, width: 2.0),
    ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 55,
          width: double.infinity,
          child: TextField(
            style: TextStyle(
                color: black
            ),

            autofocus: false,
            textAlign: TextAlign.left,
            keyboardType: TextInputType.number,
            cursorColor: grey,
            decoration:InputDecoration(
                hintText: 'Key in phonenumber',
                enabledBorder: const OutlineInputBorder(
                  borderRadius :BorderRadius.all(Radius.circular(10)),
                  borderSide:  BorderSide(
                      color: grey, width: 2.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius :BorderRadius.all(Radius.circular(10)),
                  borderSide:  BorderSide(
                      color: seedBlue, width: 2.0),
                ),
                hintStyle: TextStyle(
                    color: grey,fontSize: 20)),
            onChanged:onChanged2,
          ),
        ),
      ],
    );
  }
}

