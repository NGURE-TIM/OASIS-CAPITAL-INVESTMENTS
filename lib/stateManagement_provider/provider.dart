import 'package:flutter/material.dart';

class Code extends ChangeNotifier{
  bool successfulCode =false;
  bool wrongCode=false;
  dbCall (){
    print('5');
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
  void reset(){
    print('2');

     wrongCode=false;
     successfulCode=false;
    print(wrongCode);
    print(successfulCode);
  }

}




