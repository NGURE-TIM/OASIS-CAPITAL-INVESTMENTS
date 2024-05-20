import 'package:flutter/material.dart';
import 'package:fulusi/home/Profile/delete.dart';
import 'package:fulusi/home/Profile/fingerprint.dart';

import '../../colors/colors.dart';

List classes=[Delete(),Finger()];
List<String> labels=['Deactivate account','Change login fingerprint'];

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

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
                  'Settings',
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge),
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                      children: List.generate(2, (index) =>
                          Padding(
                            padding: const EdgeInsets.all(8.0),
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
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    children: [
                                      Text(
                                        labels[index],
                                        style: TextStyle(
                                            color: black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15
                                        ),),
                                      Spacer(),
                                      IconButton(onPressed: () {

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => classes[index]),
                                        );
                                      },

                                          icon: Icon(Icons.arrow_right_outlined))

                                    ],
                                  )
                              ),
                            ),
                          ))


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
                        'Log out',
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

    );
  }


}
