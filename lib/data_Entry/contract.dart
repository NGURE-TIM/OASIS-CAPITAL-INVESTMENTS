import 'package:fulusi/colors/colors.dart';
import 'dataEntryWidgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';


late String relationship1='x';
late String phoneNumber1='x';
late String relationship2='x';
late String phoneNumber2='x';

bool Complete=false;
bool buttonIsPressed=false;
onComplete(){
  if (relationship1 != 'x' &&
      phoneNumber1 != 'x' &&
      relationship2 != 'x' &&
      phoneNumber2 != 'x' ){
    Complete=true;
  }
  else{
    Complete=false;
  }
}


class Contract extends StatefulWidget {
  const Contract({Key? key}) : super(key: key);

  @override
  State<Contract> createState() => _entryState();
}

class _entryState extends State<Contract> {
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

              contactTextfields('Contact 1','Relationship' , (value){
                relationship1=value as String;
              },(value){
                phoneNumber1=value;
              }      )  ,
              SizedBox(
                height: 15,
              ),
              contactTextfields(  'Contact 2','Relationship',(value){
                relationship2=value ;
              },(value){
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
                child: ElevatedButton(onPressed: (){
                  onComplete();
                  if(Complete){
                    print('pushing into firebase $relationship1');
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
  Function (dynamic) onChanged;
  Function (String) onChanged2;
  contactTextfields(this.contact,this.relationship  , this.onChanged , this.onChanged2);
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
        DropDownTextField(
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

