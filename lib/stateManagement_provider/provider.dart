import 'package:flutter/material.dart';

class Code extends ChangeNotifier{
  bool successfulCode =false;
  bool wrongCode=false;
   void dbCall (){
     successfulCode=true;
     notifyListeners();
   }
   void wrong(){
     wrongCode=true;
     notifyListeners();
   }
  void turnWrongON(){
    wrongCode=false;
    notifyListeners();
  }
}

