
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../colors/colors.dart';

class Delete extends StatelessWidget {
  const Delete({Key? key}) : super(key: key);

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
                'Delete Account',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge),
          ),
          body: Column(
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
                              decoration:  BoxDecoration(
                                color: white,
                                borderRadius:BorderRadius.circular(10) ,
                                boxShadow: [
                                  BoxShadow(
                                      color: mainOrange.withOpacity(0.5),
                                      blurRadius: 4,
                                      spreadRadius: .05,
                                      offset: Offset(0, 4)
                                  ),
                                ],
                              ),
                              height:100,
                              width:100,
                              child: Image.asset('assets/images/profile/caution.png')),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Center(
                              child: Text(
                                'Delete notification',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 25,
                                    color: mainOrange
                                ),
                              ),
                            ),
                          ),
                          Text('Applying for account deletion means that'
                              ' you are aware and agree to the following conditions:',
                          style: TextStyle(
                            color: black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600
                          ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text('1.Our company reserves the right to review your deletion request.If you have'
                              ' unpaid loans, we have the right to reject your request.',
                            style: TextStyle(
                                color: grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          Text('2.Your guarantor must notified and he/she has the right to decline your request.',
                            style: TextStyle(
                                color: grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          Text('3.After deletion, our company will delete your account information and other personal information(excluding information required by laws,regulations and regulatory requiremnts).',
                            style: TextStyle(
                                color: grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          )
                        ],
                      )
                  ),
                ),
              ),

              Spacer(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: ElevatedButton(onPressed:(){

                    //todo: log out user from current session and delete user data

                  },
                    style:

                    ElevatedButton.styleFrom(
                        fixedSize: Size(200, 45),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        elevation: 3, backgroundColor: mainOrange
                    ), child: Text(
                      'Confirm',
                      style: TextStyle(
                          color: white,
                          fontSize:15
                      ),
                    ),
                  ),

                ),
              ),
            ],
          ),



        ))
      ],

    );;
  }
}
