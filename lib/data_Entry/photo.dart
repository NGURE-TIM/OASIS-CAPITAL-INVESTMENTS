import 'package:flutter/material.dart';
import 'package:fulusi/colors/colors.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import '../globalWidgets.dart';
import 'dataEntryWidgets/widgets.dart';


class Photo extends StatefulWidget {

  const Photo({Key? key}) : super(key: key);

  @override
  State<Photo> createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  late String name;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        backgroundColor: white,
        body: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Image(
                  width: 200,
                  height: 200,
                  image: Svg('assets/images/account_Info/Photo/undraw_pic_profile_re_7g2h.svg'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: OutlinedButton(onPressed: (){},
                  style: ButtonStyle(
                    side: MaterialStateProperty.all<BorderSide>(
                      const BorderSide(color: mainOrange,
                        width: 2.0,
                      ),
                      // Set the border color
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // Set border radius
                      ),
                    ),
                  ), child: TextWidget('Upload photo',
                  FontWeight.w700,
                  mainOrange,
                ),

                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElavatedButton('Skip ' , white ,mainBlue , (){}),
                  const SizedBox(
                      width:15
                  ),
                  ElavatedButton('Continue' , white, mainOrange,(){}),

                ],
              ),


            ],
          ),
        )
    ));
  }

}


