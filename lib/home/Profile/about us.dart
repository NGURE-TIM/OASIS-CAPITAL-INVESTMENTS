
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../colors/colors.dart';

class About extends StatelessWidget {
  const About ({Key? key}) : super(key: key);

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
            title: Text(
                'About US',
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
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
            
                                height:150,
                                width:150,
                                child: Image.asset('assets/images/cropped-Oasis-Capital-Investments-trans.png')),
                            Text('At Oasis Capital we ignite growth, empower dreams, and transform futures with visionary microfinance solutions.  '
                                ,
                              style: TextStyle(
                                  color: black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            SizedBox(
                              height: 20,
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
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Website',
                                  style: TextStyle(
                                      color: black,
                                      fontWeight: FontWeight.w500,
                                      fontSize:15
                                  ),),
                                Spacer(),
                                Text(
                                  'https://oasiscapital.ke/',
                                  style: TextStyle(
                                      color: grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize:15
                                  ),),
                                IconButton(onPressed:()async{
                                try{
                                await  launchUrlString('https://oasiscapital.ke/');
                                }
                                catch(err){
            //:todo catch errors appropriately
                                }
                                },
            
                                    icon:Icon(Icons.arrow_right_outlined))
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Support Email',
                                  style: TextStyle(
                                      color: black,
                                      fontWeight: FontWeight.w500,
                                      fontSize:15
                                  ),),
                                Spacer(),
                                Text(
                                  'info@oasiscapital.ke',
                                  style: TextStyle(
                                      color: grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize:15
                                  ),),
                                IconButton(onPressed:(){
                                  launchUrlString('mailto:info@oasiscapital.ke?subject=(Edit your subject matter) &body=Hello Oasis!');
                                },
            
                                    icon:Icon(Icons.arrow_right_outlined))
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Hotline',
                                  style: TextStyle(
                                      color: black,
                                      fontWeight: FontWeight.w500,
                                      fontSize:15
                                  ),),
                                Spacer(),
                                Text(
                                  '+254 707 655 659',
                                  style: TextStyle(
                                      color: grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize:15
                                  ),),
                                IconButton(onPressed:()async{
                                  try{
                                    launchUrlString("tel://0707 655 659");
                                  }
                                      catch(e){
                                    //todo:handle exception
                                      }
            
                                },
            
                                    icon:Icon(Icons.arrow_right_outlined))
                              ],
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
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: RichText(
                            textAlign: TextAlign.center, // This will help center the text within the Expanded widget
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: "Copyright @ Oasis Capital 2024. All Rights Reserved. Made with ",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: grey,
                                  ),
                                ),
                                TextSpan(
                                  text: "❤ E-Startups Kenya.",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: error,
                                  ),
                                  recognizer: TapGestureRecognizer(
                                  )
                                    ..onTap=() async{
                                    try{
                                      await  launchUrlString('https://www.e-startupskenya.co.ke/');
                }
                catch(err){
            //:todo catch errors appropriately
                }
                }
                                ),
            
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            
            
            
              ],
            ),
          ),



        ))
      ],

    );
  }
}
