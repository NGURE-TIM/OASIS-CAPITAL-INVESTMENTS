import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
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
