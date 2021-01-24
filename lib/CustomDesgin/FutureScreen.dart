import 'package:flutter/material.dart';

class FutureScreen extends StatefulWidget {
  @override
  _FutureScreenState createState() => _FutureScreenState();
}

class _FutureScreenState extends State<FutureScreen> {

  void info() {}

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 2),()=> info() ),
    builder:(ctx,snapShot){
    return Scaffold(appBar: AppBar(),body: Center(
      child: snapShot.connectionState ==ConnectionState.waiting ?CircularProgressIndicator():Text("Data"),
    ),);});
  }
}
