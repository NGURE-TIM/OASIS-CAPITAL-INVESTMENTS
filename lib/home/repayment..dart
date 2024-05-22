import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import '../colors/colors.dart';
import '../networking/whatsapp.dart';
final TextEditingController _controller = TextEditingController();

class Repayment extends StatelessWidget {
  const Repayment ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(

          backgroundColor: mainOrange,

        ),
        SafeArea(child: Scaffold(
          backgroundColor: white,
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: IconButton(onPressed: (){
                  Whatsapp.launchWhatsAppUri();
                },
                  icon: Icon(
                      Icons.headset_mic_outlined
                  ),
                ),
              )
            ],
            title: Text(
                'Repayment',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          spreadRadius: .5,
                          blurRadius: 5,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
            
                    width: double.infinity,
            
                    child: Padding(
                        padding: const EdgeInsets.only(left: 20 ,right: 20 ,bottom: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 0,bottom: 10),
                              child: Text(
                                  'Payment Schedule',
                                  style: Theme.of(context).textTheme.displayMedium),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SimpleCircularProgressBar(
                                    progressStrokeWidth: 15,
                                    backStrokeWidth: 15,
                                    backColor: mainBlue,
                                    //todo:https://medium.com/@avnishnishad/flutter-communication-between-widgets-using-valuenotifier-and-valuelistenablebuilder-b51ef627a58b
                                    onGetText: (double value) {
                                      return Text(
                                      '${value.toInt()}%',
                                      style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: mainBlue,
                                      ),
                                      );
            
                                    },
                                    mergeMode: true,
                                    progressColors: [mainOrange],
                                    fullProgressColor: mainOrange,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                     "0 days",
                                        //todo:update duration
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: mainOrange,
                                        ),
                                      ),
                                      Text(
                                        "before next payment",
                                        //todo:update duration
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: grey
                                        ),
                                      ),
                                      Text(
                                        "Kshs 0",
                                        //todo:update duration
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: mainOrange,
                                        ),
                                      ),
                                      Text(
                                        "weekly payments",
                                        //todo:update duration
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: grey
                                        ),
                                      ),
            
            
                                    ],
                                  ),
                                ),
            
                              ],
                            )
                          ],
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20 ,right: 20 ,bottom: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          spreadRadius: .5,
                          blurRadius: 5,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
            
                    width: double.infinity,
            
                    child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 0,bottom: 10),
                              child: Text(
                                  'Loan Balance Due',
                                  style: Theme.of(context).textTheme.displayMedium),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 0,bottom: 20),
                              child: Text(
                                  'KShs 0.00',
                                  style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: mainOrange,
                ),
                            ),
                            )
                          ],
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20,right: 20,left: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          spreadRadius: .5,
                          blurRadius: 5,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
            
                    width: double.infinity,
            
                    child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Submit your payment through:',
                              style: TextStyle(
                                  color: black,
                                  fontWeight: FontWeight.w500,
                                  fontSize:15
                              ),),
            
                            Row(
                              children: [
                                Container(
                                    height:50,
                                    width:50,
                                    child: Image.asset('assets/images/MPESA/MPESA.jpg')),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "******8055",
                                  style: TextStyle(
            
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: mainBlue,
                                  ),
                                ),
            
            
            
            
                              ],
                            ),
                            Row(
                              children: [
            
                                Text(
                                  "Amount",
                                  style: TextStyle(
            
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: black,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),

                                SizedBox(
                                  height: 30,
                                  width: 90,
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
                                    onChanged:(val){},
                                  ),
                                )
            
            
            
            
            
                              ],
                            ),
                            RichText(
                              text:  TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: " * ",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: mainOrange,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Enter your repayment amount then follow the mpesa prompt.Payment should reflect here immediately.",
            
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: grey,
                                    ),
                                  ),
            
            
                                ],
                              ),
                            ),
            
                          ],
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20,right: 20,left: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          spreadRadius: .5,
                          blurRadius: 5,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
            
                    width: double.infinity,
            
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Text(
                              'App updates',
                              style: TextStyle(
                                  color: black,
                                  fontWeight: FontWeight.w500,
                                  fontSize:15
                              ),),
                            Spacer(),
                            IconButton(onPressed:(){
            
                            },
            
                                icon:Icon(Icons.arrow_right_outlined))
                          ],
                        )
                    ),
                  ),
                ),
            
            
            
              ],
            ),
          ),



        ))
      ],

    );
  }
}