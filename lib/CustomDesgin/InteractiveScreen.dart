import 'package:flutter/material.dart';

class InteractiveScreen extends StatefulWidget {
  @override
  _InteractiveScreenState createState() => _InteractiveScreenState();
}

class _InteractiveScreenState extends State<InteractiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          height: 500,
          width: double.infinity,
          child: InteractiveViewer(
            boundaryMargin: EdgeInsets.all(40),
              panEnabled: true,
              constrained: true,
              scaleEnabled: true,
              maxScale: 4,
              minScale: 0.3,
              child: Image.asset("assets/images/3.png",fit:BoxFit.cover ,)),
        ),
      ),
    );
  }
}
