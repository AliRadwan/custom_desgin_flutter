import 'dart:async';

import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {

  var _start = 0;
  Timer _timer;

  startTimer(int i){
    if(_timer != null){
      _timer.cancel();
    }
    setState(() {
      _start=i;
    });
    _timer = Timer.periodic(Duration(milliseconds: 500), (timer) =>setState(() {
      _start<1?_timer.cancel():_start -=1;
    }));
  }
  pauseTimer(){
    if(_timer != null){
      _timer.cancel();
    }
  }
  continueTimer(){
    startTimer(_start);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child:Column(children: [
        Text("$_start",style: TextStyle(color: Colors.amber,fontSize: 50),),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton.icon(onPressed:()=> startTimer(10), icon: Icon(Icons.replay), label: Text("Restart")),
            FlatButton.icon(onPressed: pauseTimer, icon: Icon(Icons.pause), label: Text("Pause")),
            FlatButton.icon(onPressed: continueTimer, icon: Icon(Icons.play_arrow), label: Text("Continue")),
          ],
        )
      ],) ,),
    );
  }
}
