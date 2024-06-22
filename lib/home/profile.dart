import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fulusi/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:fulusi/home/Profile/about%20us.dart';
import 'package:fulusi/home/Profile/feedback.dart';
import 'package:animated_icon/animated_icon.dart';
import 'package:fulusi/home/Profile/settings.dart';
import '../globalWidgets.dart';
import '../loan/loan.dart';
import '../networking/whatsapp.dart';
import 'Profile/account.dart';
import 'Profile/faq.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}
class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery
        .of(context)
        .size;
    return PopScope(

      canPop: false,
      child:
      Scaffold(
        backgroundColor: white,
        body: Stack(
          children: [
            Container(
              width: screensize.width,
              height: screensize.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(-1, -1),
                  end: Alignment(1, 1),
                  colors: [

                    mainOrange.withOpacity(0.02),
                    white
                  ],
                  stops: [
                    0.2,
                    0.8
                  ],

                ),
              ),
            ),
            Container(
              width: screensize.width,
              height: screensize.height,
              decoration: BoxDecoration(
                color: white.withOpacity(0.1)
              ),
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    shadowColor: transparent,
                    elevation: 0,
                    backgroundColor: transparent,
                    leading: Icon(Icons.add, color:transparent,),
                    flexibleSpace: AppBar(

                      elevation: 0,
                      leadingWidth: 0,
                      backgroundColor: transparent,
                      leading:null,
                      titleSpacing: 0,
                      automaticallyImplyLeading: false,
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
                      title: Row(
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              'My profile',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                  SliverList( delegate: SliverChildBuilderDelegate(

                        childCount: 1,

                      (BuildContext context, int index){
                       return Column(
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(left: 20,right: 20,top:10),
                             child:Material(
                               borderRadius: BorderRadius.circular(10.0),
                               shadowColor: grey,
                               elevation:2,
                               child: Container(

                                 width: double.infinity,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(10),
                                   image : const DecorationImage(
                                     image: AssetImage("assets/images/container.jpg"),
                                     fit: BoxFit.cover,
                                   ),
                                 ),
                                 child:  Center(
                                   child: Padding(
                                     padding: const EdgeInsets.only(left: 40.0,right: 40,top: 20, bottom: 20),
                                     child: Center(
                                       child: Column(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         children: [

                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.center,
                                             children: [
                                               buildColumn('Due Date'),
                                               Spacer(),
                                               buildColumn('Due Amount'),
                                             ],
                                           ),

                                         ],
                                       ),
                                     ),
                                   ),
                                 ),

                               ),
                             ),
                           ),

                           Padding(
                             padding: const EdgeInsets.only(left:20,right: 20,top: 20),
                             child: Column(
                               children: [
                                 Material(
                                   shadowColor: mainOrange.withOpacity(0.6),
                                   elevation:2,
                                   borderRadius: BorderRadius.circular(10.0),
                                   child: Container(

                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(10.0),
                                     ),
                                     width: double.infinity,

                                     child: Padding(
                                       padding: const EdgeInsets.all(12),
                                       child:   Column(

                                         crossAxisAlignment:CrossAxisAlignment.start ,
                                         children: [
                                           buildPadding('Account', 'assets/images/profile/user (1).png',(){Navigator.push(
                                             context,
                                             MaterialPageRoute(builder: (context) => Account()),
                                           );}),
                                           buildPadding('Coupons', 'assets/images/profile/ticket.png',(){


                                           }),
                                           buildPadding('Feedback', 'assets/images/profile/feedback.png',(){
                                             Navigator.push(
                                               context,
                                               MaterialPageRoute(builder: (context) => Suggestions()),
                                             );
                                           }),
                                           buildPadding('FAQ', 'assets/images/profile/chat.png',(){

                                             Navigator.push(
                                               context,
                                               MaterialPageRoute(builder: (context) => FAQ()),
                                             );
                                           }),
                                           buildPadding('Privacy Policy', 'assets/images/profile/padlock.png',(){

                                           }),
                                           buildPadding('Settings', 'assets/images/profile/cogwheels.png',(){
                                             Navigator.push(
                                               context,
                                               MaterialPageRoute(builder: (context) => Settings()),
                                             );
                                           }),
                                           buildPadding('About us', 'assets/images/profile/information.png',(){
                                             Navigator.push(
                                               context,
                                               MaterialPageRoute(builder: (context) => About()),
                                             );
                                           }),


                                         ],

                                       ),
                                     ) ,
                                   ),
                                 )
                               ],
                             ),
                           )
                         ],
                       ) ;
                      }
              ),
            ),

          ],
        ),
      ),
]
    ),
    )
    );
  }

  Padding buildPadding(String text , String path, Function() pressed) {
    return Padding(
                                        padding: const EdgeInsets.only(top: 10,right: 10,left: 10),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                                height:30,
                                                width:30,
                                                child: Image.asset(path)),
                                            SizedBox(width: 20,),
                                            Text(
                                              text,
                                              style: TextStyle(
                                                  color: black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize:15
                                              ),),
                                            Spacer(),
                                            IconButton(onPressed:pressed,

                                                icon:Icon(Icons.arrow_right_outlined))

                                          ],
                                        ),
                                      );
  }

  Column buildColumn(String text) {
    return Column(
                                children: [
                                  Text(
                                    text,
                                    style: TextStyle(
                                        color: white,
                                        fontWeight: FontWeight.w300,
                                        fontSize:20
                                    ),),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '---',
                                    style: TextStyle(
                                        color: white,
                                        fontWeight: FontWeight.w300,
                                        fontSize:20
                                    ),),
                                ],
                              );
  }
}