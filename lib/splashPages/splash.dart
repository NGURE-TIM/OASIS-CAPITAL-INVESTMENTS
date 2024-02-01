import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:fulusi/splashPages/carousel.dart';

import '../colors/colors.dart';


class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  FlutterSplashScreen.fadeIn(
      backgroundColor: white,
      childWidget: SizedBox(
        height: 300,
        width: 300,
        child: Image.asset("assets/images/cropped-Oasis-Capital-Investments-trans.png"),
      ),
      duration: const Duration(milliseconds: 5515),
      nextScreen: const Carousel(),
    );

  }
}