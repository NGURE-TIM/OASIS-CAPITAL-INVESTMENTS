
import 'package:flutter/material.dart';
import 'package:fulusi/Database/firebase.dart';
import 'package:fulusi/colors/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:provider/provider.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:fulusi/data_Entry/entry.dart';

import '../../../globalWidgets.dart';
import '../../../stateManagement_provider/provider.dart';

int phoneNumber = 0;
 int? errorcode=2;
 bool textField= false;
 FirebaseAuth auth=FirebaseAuth.instance;
 late String number;
final TextEditingController _fieldOne = TextEditingController();
final TextEditingController _fieldTwo = TextEditingController();
final TextEditingController _fieldThree = TextEditingController();
final TextEditingController _fieldFour = TextEditingController();
final TextEditingController _fieldFive = TextEditingController();
final TextEditingController _fieldSix = TextEditingController();
TextEditingController phoneNumberController = TextEditingController(text: '+254');
TextEditingController emailController = TextEditingController();
 String otp='';
 bool otpflag= false;
 void checkTextFieldStatus(){


   bool all =_fieldOne.text.isNotEmpty &&
       _fieldTwo.text.isNotEmpty &&
       _fieldThree.text.isNotEmpty &&
       _fieldFour.text.isNotEmpty &&
       _fieldFive.text.isNotEmpty &&
       _fieldSix.text.isNotEmpty;

   if(all){
     otpflag=true;
   }
 }
String updatesmsCode  () {
  otp=_fieldOne.text +
      _fieldTwo.text +
      _fieldThree.text +
      _fieldFour.text  +
      _fieldFive.text +
      _fieldSix.text ;
  return otp;
}
late StreamDuration streamDuration = StreamDuration(
  config: const StreamDurationConfig(
    countDownConfig: CountDownConfig(
      duration: Duration(minutes: 00, seconds: 60),
    ),
  ),
);

class Verify extends StatefulWidget {
  const Verify({Key? key}) : super(key: key);

  @override
  State<Verify> createState() => _VerifyState();

}

class _VerifyState extends State<Verify> {

  @override
  Widget build(BuildContext context) {
    final Size screensize=MediaQuery.of(context).size;
    return  Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screensize.width,
          height: screensize.height,
          child: Stack(
            children: [
              Image.asset(
                'assets/images/photorealistic-money-with-plant_23-2151027561.webp',
                width: screensize.width,
                height: screensize.height,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(

                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: const Alignment(0.0 ,0.55),
                    colors: [
                      Colors.transparent,
                      black.withOpacity(1), // Adjust opacity as needed
                    ],
                  ),
                ),
                width: screensize.width,
                height: screensize.height,
                child:
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                      ),
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: Image.asset("assets/images/cropped-Oasis-Capital-Investments-trans.png"),
                      ),
                      const Center(
                        child: Text(
                          'Your trusted partners.',
                          style: TextStyle(
                            color: white,
                              fontWeight: FontWeight.w400,
                              fontSize:30
                          ),
                        ),
                      ),
                      const SizedBox(
                        height:10,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 60,right: 60),
                        child:Consumer<VerifyPage>(
                        builder:(context,dataProviderModel,child){
                          return  Text(
                            'Please verify your ${dataProviderModel.title} to continue',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: white,

                                fontWeight: FontWeight.w500,
                                fontSize:18
                            ),
                          );}
                        ),
                      ),
                      const SizedBox(
                        height:50,
                      ),

                      Consumer<VerifyPage>(
                          builder:(context,dataProviderModel,child) {
                            return dataProviderModel.upDateTextField ? Container(
                              width: 300,
                              child: buildTextField(context, (value) {
                                phoneNumber=int.tryParse(value!)??0 ;
                                number=phoneNumber.toString();
                                if (number.length == 12) {
                                  setState(() {
                                    textField = true;
                                    signInUser('+$number', context);
                                    Future.delayed( const Duration(milliseconds: 100));
                                    bottom(context);
                                    errorcode = 2;
                                  });
                                }
                                else if (number.length < 12 || number.length >12) {
                                  //:todo fix the over 12 digits i suggest using contoller
                                  textField = false;
                                  setState(() {
                                    errorcode = 0;
                                  });
                                }
                              }, phoneNumberController, TextInputType.phone,
                                  'Phone Number', 'xxx-xxx-xxx'),
                            ) : Container(
                            width: 300,
                            child: buildTextField(context, (value) {
                            if (number.length == 12) {
                            setState(() {
                            textField = true;
                            signInUser('+$number', context);
                            bottom(context);
                            errorcode = 2;
                            });
                            }
                            else if (number.length != 12) {
                            textField = false;
                            setState(() {
                            errorcode = 0;
                            });
                            }
                            }, emailController, TextInputType.emailAddress,
                            'Email', 'johnDoe@gmail.com'),
                            );
                          }),
                      const SizedBox(
                        height:5,
                      ),
                      errortext(errorcode),

                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: (){
                          if(textField==true){
                            signInUser('+$number', context);
                            Future.delayed( const Duration(milliseconds: 500));
                            bottom( context);
                          }
                        },

                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: mainOrange,
                              width: 1.0, // Adjust border thickness as needed
                            ),
                            borderRadius:BorderRadius.circular(30) ,
                            color: transparent,
                          ) ,

                          height: 50,
                          width:250 ,
                          child: const Center(
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      const Row(
                       
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 40,
                            child: Divider(
                              color: white,
                              thickness: 1,

                            ),
                          ),
                          SizedBox(
                            width:5,
                          ),
                          Text(
                            'or verify via ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: white,

                                fontWeight: FontWeight.w300,
                                fontSize:18
                            ),
                          ),
                          SizedBox(
                            width:5,
                          ),
                          SizedBox(
                            width: 40,
                            child: Divider(
                              color: white,
                              thickness: 1,

                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Consumer<VerifyPage>(
                          builder:(context,dataProviderModel,child){
                       return ElavatedButton(dataProviderModel.buttonName , mainOrange, white,() {

    Provider.of<VerifyPage>(context , listen: false).onClick();
                        },3);
  }),

                    ],
                  ),
                ),
              )

            ],

          ),
        ),
      ),
    );
  }

  TextField buildTextField(BuildContext context, Function(String?) onchanged ,TextEditingController controller,TextInputType type , String label,String? hint ) {
    return TextField(

                        onChanged: onchanged,
                        cursorColor: white,

                        controller: controller,
                        keyboardType: type,
                        style: const TextStyle(
                            fontSize:25,
                            color: white
                        ),
                        decoration:InputDecoration(
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: white), // Set the color you want
                          ),
                          enabledBorder: const UnderlineInputBorder(

                            borderSide: BorderSide(color: white), // Set the color you want
                          ),

                          labelText: label,
                          labelStyle:const TextStyle(
                              fontWeight: FontWeight.w100,
                              color: white
                          ) ,
                          hintText: hint,
                          hintStyle: const TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: 18,
                              color: white
                          ) ,
                          filled: false,
                        ) ,
                      );
  }
}
Widget errortext(int? errorC){
  bool textField=false;
  if(errorC==0){
textField=true;
  }
  else{
    textField=false;
  }
    return textField ? const Text('Phone number should be 12 digits long inclusive of country code!',

      style: TextStyle(
        color: error,
        fontWeight: FontWeight.w700,
        fontSize: 10,
      ),
    )
        : const SizedBox();
  }

signInUser(String phoneNumber , BuildContext  context ) async{

  await verifyPhoneNumber(phoneNumber, context);
  //user can only signin with a verified number
  bool exists =context.mounted ? Provider.of<VerifyPage>(context, listen: false).exists : false;
  if(exists){

    try {
      streamDuration.play();
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => entry()),
          );
        },
        //TODO: Ask the user to check for a connection.
        verificationFailed: (e) {
        },
        codeSent:  (String verificationId, int? resendToken) async {
          while(otpflag==false){

            await Future.delayed(const Duration(milliseconds: 200));
            checkTextFieldStatus();

            if(otpflag && context.mounted){

              streamDuration.pause();
              Provider.of<Code>(context , listen: false).reset();
              buildShowProgress(context);
              String smsCode = updatesmsCode();
              PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
              try{ UserCredential userCredential = await auth.signInWithCredential(credential);
              User? user=userCredential.user;
              Provider.of<Code>(context , listen: false).dbCall();
              await Future.delayed(const Duration(milliseconds: 100));
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => entry()),

              );

              }catch(e){
                Provider.of<Code>(context , listen: false).wrong();
                otpflag=false;
                clearTexts(context);
              }

            }
          }
        },
        codeAutoRetrievalTimeout: (String verificationId) {

        },);
    }
    catch(e){
      //TODO: errors in this process
    }
  }


}

 void bottom (BuildContext ctx) {


    showModalBottomSheet(
        context: ctx,
        isScrollControlled: true,
        transitionAnimationController: AnimationController(
          vsync: Navigator.of(ctx),
          duration: const Duration(milliseconds: 900), // Adjust animation duration as needed
          reverseDuration: const Duration(milliseconds: 900),
        ),
        builder: (ctx)

        {

          return

          Padding(
          padding:  EdgeInsets.only(
              bottom: MediaQuery.of(ctx).viewInsets.bottom
          ),
          child: Container(
            width: 300,
            height: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: white
            ),
            child:Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text("Enter verification code",
                    style: TextStyle(
                      color: black,
                      fontWeight: FontWeight.w600,
                      fontSize: 25
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30,),
                  child: DefaultTextStyle(
                    style:  const TextStyle(
                    color: black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                    child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Consumer<VerifyPage>(
                    builder:(context,dataProviderModel,child) {

                      return

                     dataProviderModel.exists ? RichText(
                       text: TextSpan(
                         text: 'A login code has been sent to ',
                         style: const TextStyle(
                           color: black,
                           fontWeight: FontWeight.w700,
                           fontSize: 20,
                         ),
                         children: <TextSpan>[
                           TextSpan(
                             text: '+$phoneNumber',
                             style: const TextStyle(
                               color: seedBlue,
                               decoration: TextDecoration.underline,
                               fontWeight: FontWeight.w700,
                               fontSize: 20,
                             ),
                           ),
                         ],
                       ),
                     ) :
                     RichText(
                       text: TextSpan(
                         text: '+$phoneNumber ',
                         style: const TextStyle(

                           color: black,
                           fontWeight: FontWeight.w700,
                           fontSize: 20,
                         ),
                         children: const <TextSpan>[
                           TextSpan(
                             text: "is ether incorrect or doesn't exist in our records.Kindly confirm your entry",
                             style: TextStyle(
                               color:error,
                               fontWeight: FontWeight.w800,
                               fontSize:18,
                             ),
                           ),
                         ],
                       ),
                     );
                    }
                        ),
                        const SizedBox(height: 20),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    OtpInput(_fieldOne,1),
    OtpInput(_fieldTwo,2),
    OtpInput(_fieldThree,3),
    OtpInput(_fieldFour,4),
    OtpInput(_fieldFive,5),
    OtpInput(_fieldSix,6),
  ],
),

                        Consumer<Code>(
                            builder:(context,dataProviderModel,child){
                              return dataProviderModel.wrongCode ? const Text('Your code is incorrect',
                                style: TextStyle(
                                  color: error,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                              )  :
                              const SizedBox(
                                height: 10,
                              );
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                         children: [
                           Text('Resending the code in '),
                           SlideCountdownSeparated(
                             streamDuration: streamDuration, decoration: BoxDecoration(
                               color: seedBlue,
                               borderRadius:BorderRadius.all(Radius.circular(5))
                           ),
                           ),
                         ],
                       ),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: ElevatedButton(onPressed: (){
                            clearTexts(ctx);


                          }, child: Text(
                            'RETRY',
                            style: TextStyle(
                              color: white
                            ),
                          ),
                            style: ElevatedButton.styleFrom(
                              elevation: 0, backgroundColor: orange
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ),
        );});
  }
























void clearTexts(BuildContext context){
  _fieldOne.clear();
  _fieldTwo.clear();
  _fieldThree.clear();
  _fieldFour.clear();
  _fieldFive.clear();
  _fieldSix.clear();

}



class OtpInput extends StatelessWidget {
  final  TextEditingController controller;
  final int input;
OtpInput(this.controller , this.input);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width :40,
      child: TextField(
        style: TextStyle(
          color: black
        ),
        autofocus: false,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: seedBlue,
        decoration:InputDecoration(
          hintText: 'x',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:  BorderSide(
                color: orange, width: 2.0),
          ),
            focusedBorder: OutlineInputBorder(
              borderSide:  BorderSide(
                  color: grey, width: 2.0),
            ),
          hintStyle: TextStyle(
            color: grey,fontSize: 20)),
        onChanged: (value){
          if(value.length==1){
            FocusScope.of(context).nextFocus();
          }
        },
        onEditingComplete: (){
           otpflag=true;
        },
      ),
    );
  }
}


/* Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: transparent,
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElavatedButton('Mobile phone' , white, mainBlue,() {

                            },3),
                            ElavatedButton('Email' , mainOrange, white,() {

                            },0),
                          ],
                        ),
                        ),*/


/*Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),

                        child:    RichText(

                          text: TextSpan(
                            text: 'By clicking continue, i ascertain i have read the ',
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Terms and Conditions ',
                                style: TextStyle(
                                  fontSize: 15,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(
                                text: 'and that the keyed in phone number is mine and the M-pesa account associated with it.',
                              ),
                            ],
                          ),
                        ),

                      )*/