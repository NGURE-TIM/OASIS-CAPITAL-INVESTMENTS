import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'colors/colors.dart';
import 'logins/login_screens/register/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'data_Entry/entry.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();
try {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
} catch (e) {
  print("Error initializing Firebase: $e");
}
  runApp(Fulusi());
}

class Fulusi extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
title: 'Fulusi',
theme: ThemeData(
  brightness: Brightness.dark,
  fontFamily:'Roboto',
),
home: const Splash(),
);
}
}

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  FlutterSplashScreen.gif(

      backgroundColor:  seedBlue,
      gifPath: 'assets/images/splashscreen.gif',
      gifWidth: 269,
      gifHeight: 474,
     nextScreen:entry(),

     //Register(),
      duration: const Duration(milliseconds: 5000),
      onInit: () async {
        debugPrint("onInit");
      },
      onEnd: () async {
        debugPrint("onEnd 1");
      },
    );
  }
}
