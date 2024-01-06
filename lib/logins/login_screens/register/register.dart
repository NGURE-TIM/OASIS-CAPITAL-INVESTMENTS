import 'package:flutter/material.dart';
import 'package:fulusi/colors/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:slide_countdown/slide_countdown.dart';


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
late final StreamDuration streamDuration = StreamDuration(
  config: const StreamDurationConfig(
    countDownConfig: CountDownConfig(
      duration: Duration(minutes: 01, seconds: 60),
    ),
  ),
);
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();

}

class _RegisterState extends State<Register> {

   @override
   void initState(){
     super.initState();
     streamDuration;
   }
@override
void dispose(){
     super.dispose();
     phoneNumberController.dispose();
     _fieldOne.dispose();
     _fieldTwo.dispose();
     _fieldThree.dispose();
     _fieldFour.dispose();
     _fieldFive.dispose();
     _fieldSix.dispose();
     streamDuration.dispose();

}
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor:seedBlue,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
              ),
              const Align(
                alignment: Alignment(-0.6, 0.0),
                child: Text(
                  'Getting started',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize:30
                  ),
                ),
              ),
              const SizedBox(
                height:50,
              ),
              Container(
                width: 300,
                child: TextField(
                  onChanged: (value){
                    phoneNumber=int.tryParse(value)??0 ;
                    number=phoneNumber.toString();
                    if(number.length==12){
                      setState(() {
                        textField=true;
                    signInUser('+$number');
                        bottom( context);
                        errorcode=2;
                      });
                    }
                    else if(number.length!=12){
                       textField=false;
setState(() {
  errorcode=0;
});
                    }
                  },
                  cursorColor: white,
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  style:const TextStyle(
                      fontSize:25,
                      color: white
                  ),
                  decoration:const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: white), // Set the color you want
                    ),
                    enabledBorder: UnderlineInputBorder(

                      borderSide: BorderSide(color: white), // Set the color you want
                    ),

                    labelText: 'Phone Number',
                    labelStyle:TextStyle(
                        fontWeight: FontWeight.w100,
                        color: white
                    ) ,
                    filled: false,
                  ) ,
                ),
              ),
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

                    signInUser('+$number');
                    bottom( context);
                  }
                },

                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(12) ,
                    color: orange,
                  ) ,

                  height: 50,
                  width:250 ,
                  child: Center(
                    child: Text(
                      'CONTINUE',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 220,
              ),
              Padding(
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
              )
            ],
          ),
        ),
      ),
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
    return textField ? Text('Phone number should be 12 digits long inclusive of country code!',

      style: TextStyle(
        fontSize: 10,
        color: error,
      ),
    )
        : SizedBox();
  }

signInUser(String phoneNumber) async{
   print('hello timmy');
  try {
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (e) {
      },
      codeSent:  (String verificationId, int? resendToken) async {
        streamDuration.pause();
        while(otpflag==false){
          await Future.delayed(Duration(seconds:5));
          checkTextFieldStatus();
              if(otpflag){
                //TODO:handle an erroneous otp
                String smsCode = updatesmsCode();
                PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
                await auth.signInWithCredential(credential);
                //TODO:sign in user
                break;
              }
        }
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print('hellosdclicnlqlwc');
      },);
  }
  catch(e){}

}


 void bottom (BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        isScrollControlled: true,
        builder: (ctx) => Padding(
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
                Padding(
                  padding: const EdgeInsets.all(20.0),
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
                    style:  TextStyle(
                    color: black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                    child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'A login code has been sent to ',
                            style: TextStyle(
                              color:black,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '+$phoneNumber',
                                style: TextStyle(
                                  color: seedBlue,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
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

                        const SizedBox(
                          height: 10,
                        ),
                       Row(
                         children: [
                           const Text('Resending the code in ',),
                           SlideCountdownSeparated(
                              streamDuration: streamDuration, decoration: BoxDecoration(
                               color: seedBlue,
                               borderRadius:BorderRadius.all(Radius.circular(5))
                             ),
                           )
                         ],
                       ),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: ElevatedButton(onPressed: (){}, child: Text(
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
        ));
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
