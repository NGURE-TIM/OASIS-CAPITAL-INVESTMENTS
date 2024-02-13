import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fulusi/splashPages/splash.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:fulusi/stateManagement_provider/provider.dart';
void main() async{
WidgetsFlutterBinding.ensureInitialized();
try {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
} catch (e) {
}
  runApp(Fulusi());
}

class Fulusi extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MultiProvider(
  providers:[
    ChangeNotifierProvider(create: (context)=>Code()),
    //ChangeNotifierProvider(create: (context)=>pushToDb()),
  ],
  child:   MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Fulusi',
  theme: ThemeData(
    brightness: Brightness.dark,
    fontFamily:'Roboto',
  ),
  home: const Splash(),
  ),
);
}
}


