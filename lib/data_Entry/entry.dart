import 'package:flutter/material.dart';
import 'package:fulusi/colors/colors.dart';
import 'dataEntryWidgets/widgets.dart';
import 'package:fulusi/data_Entry/personal.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

late String Firstname='x';
late String Middlename='x';
late String Lastname='x';
late String ID='x';
late String DOB='x';
late String Gender='x';

bool Complete=false;
bool buttonIsPressed=false;
onComplete(){

 if (Firstname != 'x' &&
      Middlename != 'x' &&
      Lastname != 'x' &&
      ID != 'x' &&
      DOB != 'x' &&
      Gender != 'x'){
   Complete=true;
 }
 else{
   Complete=false;
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
                height: 10,
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
                height: 10,
              ),

              TextFields('First name','Please enter first name' ,Firstname , (value){
                Firstname=value;
              }),
              TextFields('Middle name','Please enter middle name',Middlename,(value){
                Middlename=value;
              }),
              TextFields('Last name','Please enter last name',Lastname,(value){
                Lastname=value;
              }),
              TextFields('National id','Kenyan issue',ID,(value){
                ID=value;
              }),
              TextFields('Date of birth ','dd/mm/yy',DOB,(value){
                DOB=value;
              }),
              TextFields('Gender ','Female/Male',Gender,(value){
                Gender=value;
              } ),
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
                 child: ElevatedButton(onPressed: ()async{
                   onComplete();
                   if(Complete){
                     /* showDialog(
                       context: context,
                       builder: (BuildContext context) {
                         return Stack(
                             children: [
                               ModalBarrier(
                                 color: black.withOpacity(0.4),
                               ),
                               AlertDialog(
                                 backgroundColor: transparent,
                                 content: SimpleCircularProgressBar(
                                   size: 50,
                                   progressStrokeWidth: 5,
                                   backStrokeWidth: 8,
                                   mergeMode: true,
                                   progressColors: const [seedBlue],
                                   backColor: Colors.black.withOpacity(0.4),
                                   animationDuration: 3,
                                 ),
                               ),
                             ]
                         );
                       },
                     );
                     */

                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => Personal()),
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
