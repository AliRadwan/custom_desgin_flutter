import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'CustomDesgin.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        body: SplashScreen(image: Image.asset("assets/images/5.jpg",),
          seconds: 3,
          title: Text("this is text"),
          backgroundColor: Colors.greenAccent,
          loadingText: Text("Loading...."),
          loaderColor: Colors.blue,
          navigateAfterSeconds:MyDesignScreen(),
        ),
      ),);
  }
}
