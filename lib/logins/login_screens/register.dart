import 'package:flutter/material.dart';
import 'package:fulusi/colors/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

 int phoneNumber = 0;
 int? errorcode=2;
 bool textField= false;
TextEditingController phoneNumberController = TextEditingController(text: '+254');
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                    if(phoneNumber.toString().length==12){
                      setState(() {
                        textField=true;
                       // signInUser(phoneNumber.toString());

                        bottom( context);
                        errorcode=2;
                      });
                    }
                    else if(phoneNumber.toString().length!=12){
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
                   // signInUser(phoneNumber.toString());
                    signInUser('+447123123456');
                    bottom( context);

                  }
                },

                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(12) ,
                    color: accent,
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
  try {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          print('Fatuma');
          await FirebaseAuth.instance.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          print('bruuh');
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          }
        },
        codeSent:  (String verificationId, int? resendToken) async {
          print('daamit');
      String smsCode = 'xxxx';
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
      await FirebaseAuth.instance.signInWithCredential(credential);
    },

      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-resolution timed out...
      },);
  }
      catch(e){
    print(e);
      }

}


 void bottom (BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (ctx) => Container(
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
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'A login code has been sent to ',
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '+$phoneNumber',
                            style: TextStyle(
                              color: seedBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            //  decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),


                  ],
                ),
              )

            ],
          )
        ));
  }

