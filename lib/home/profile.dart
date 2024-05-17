import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fulusi/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:animated_icon/animated_icon.dart';
import '../globalWidgets.dart';
import '../loan/loan.dart';
import '../networking/whatsapp.dart';

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
              child: Column(
                children: [
                  AppBar(
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
                  )
                ],
              ),
            ),
            



          ],
        ),
      ),

    );
  }
}