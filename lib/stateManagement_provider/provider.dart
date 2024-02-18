import 'dart:ffi';

import 'package:flutter/material.dart';

class Code extends ChangeNotifier{
  bool successfulCode =false;
  bool wrongCode=false;
  dbCall (){
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
     wrongCode=false;
     successfulCode=false;
     notifyListeners();
  }

}



class VerifyPage extends ChangeNotifier{
  String title ='phone number';
  String buttonName='Email';
  bool upDateTextField=true;
  onClick(){

    if(buttonName == 'Email'){
      buttonName='Phone number';
    }
    else{
      buttonName='Email';
    }

    if(title == 'phone number'){
      title='email';
    }
    else{
      title='phone number';
    }

    upDateTextField=upDateTextField ? false : true;

    notifyListeners();
  }

  bool exists=false;
  dbCall(){
    exists=true;
    notifyListeners();
  }
  inValid(){
    exists=false;
    notifyListeners();
  }
}



