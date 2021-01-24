import 'package:flutter/material.dart';
import 'dart:math';


class TransformScreen extends StatefulWidget {
  @override
  _TransformScreenState createState() => _TransformScreenState();
}

class _TransformScreenState extends State<TransformScreen> {



  double value = 0.0;
  double value1 = 0.0;
  double value2= 0.0;
  double value3 = 0.0;
  double value4 = 0.0;


  @override
  Widget build(BuildContext context) {
    // this 2 line equal
    // badl ma a5od object mn el class we astd3y meno function ba5od kolh mara wa7da
    Matrix4 a = Matrix4.rotationZ(-20*(pi/180));
    a.translate(10);
//=
    Matrix4 b = Matrix4.rotationZ(-20*(pi/180))..translate(10);

    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [



        Transform(
          transform: Matrix4.skew(value, value),
          child: Container(
            color: Colors.deepPurple,
            width: 100,
            height: 100,
          ),
        ),
        Slider(value: value, onChanged: (double val)=>setState(()=> value=val),min: 0,max: 150,divisions: 100,activeColor: Colors.greenAccent,inactiveColor: Colors.green,),

        Transform.translate(
          offset: Offset(value1,value1),
          child: Container(
            color: Colors.deepPurple,
            width: 100,
            height: 100,
          ),
        ),
        Slider(value: value1, onChanged: (double val)=>setState(()=> value1=val),min: 0,max: 150,divisions: 100,activeColor: Colors.greenAccent,inactiveColor: Colors.green,),

        Transform.scale(
          scale: value2,
          child: Container(
            color: Colors.lightGreenAccent,
            width: 100,
            height: 100,
          ),
        ),
        Slider(value: value2, onChanged: (double val)=>setState(()=> value2=val),min: 0,max: 4,divisions: 4,activeColor: Colors.greenAccent,inactiveColor: Colors.green,),

        Transform.rotate(
          angle: value3*(pi/180),
          child: Container(
            color: Colors.cyanAccent,
            width: 100,
            height: 100,
          ),
        ),
        Slider(value: value3, onChanged: (double val)=>setState(()=> value3=val),min: 0,max: 360,divisions: 100,activeColor: Colors.greenAccent,inactiveColor: Colors.green,),
        Container(
          color: Colors.blueAccent,
          width: value4,
          height: value4,
        ),
        Text("Value = ${(value4).round()}",style: TextStyle(fontSize: 15),),
        Slider(value: value4, onChanged: (double val)=>setState(()=> value4=val),min: 0,max: 100,divisions: 5,activeColor: Colors.greenAccent,inactiveColor: Colors.green,label:"${value4}",),





      ],),
    );
  }
}
