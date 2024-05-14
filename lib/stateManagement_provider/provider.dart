import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:fulusi/networking/mpesa.dart';


class Loans extends ChangeNotifier{
  late DateTime  dateDue= DateTime.now();
  late double principal ;
 final double rate = 0.04;
 late double interest =0;
 late double weekly=0;
 late double total=0;
 late  double charges=0;
late double time =0 ;
 calculateTime(String Item){
   try {
     if (Item=='7 Days/1 Installments'){
       time=1;
       dateDue =DateTime.now().add(Duration(days: 7));
     }
     else if (Item=='14 Days/2 Installments'){
       time=2;
       dateDue =DateTime.now().add(Duration(days: 14));
     }
     else if (Item=='21 Days/3 Installments'){
       time=3;
       dateDue =DateTime.now().add(Duration(days: 21));
     }
     else if (Item=='28 Days/4 Installments'){
       time=4;
       dateDue =DateTime.now().add(Duration(days: 28));
     }
     else {
       time =0;
     }

   }
   catch(e){
     time=0;
   }
    notifyListeners();
 }
 findPrincipal(limit){
   try{
     principal=limit;

     for(var fee in charge){
if (principal > fee['min'] && principal <= fee['max']){
  charges=fee['transfer_fee'];
}
     }
   }
   catch(e){
     principal=0;
   }


 }

getInterest (){
   try{
     interest = principal * rate * time;
     total=principal + interest + charges;


     if(time > 0){
       weekly= total/time;
     }
     else {
       weekly=0;
     }
   }
   catch(e){
     principal=0;
     interest=0;
     weekly=0;
     total=0;
   }

   notifyListeners();
}

}



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
bool x=false;
  bool exists=false;
  dbCall(){
    exists=true;
    x=true;
    notifyListeners();
  }
  reset(){
    //reseting value back to false
    exists=false;
    notifyListeners();
  }
}


class TimerDuration extends ChangeNotifier{
  bool done = false;
  late StopWatchTimer stopWatchTimer;

  TimerDuration() {
    stopWatchTimer = StopWatchTimer(
      onEnded: () {
        done = true;
        notifyListeners();
      },
      mode: StopWatchMode.countDown,
      presetMillisecond: StopWatchTimer.getMilliSecFromMinute(1),
    );
  }
  void start() {
    stopWatchTimer.onStartTimer();
    notifyListeners();
  }
  void stop() {
    stopWatchTimer.onStopTimer();
    notifyListeners();
  }
  void reset() {
    stopWatchTimer.onResetTimer();
    notifyListeners();
  }
  void resetState() {
    done=false;
    notifyListeners();
  }
}
