import 'package:flutter/material.dart';

class AnimationAppBar extends StatefulWidget {
  const AnimationAppBar({Key key}) : super(key: key);

  @override
  _AnimationAppBarState createState() => _AnimationAppBarState();
}

class _AnimationAppBarState extends State<AnimationAppBar> {
  @override
  Widget build(BuildContext context) {
    double curve1Height = 0;
    double curve2Height = 0;
    double curve3Height = 0;
    bool show = false;

      if(show){
        curve1Height = 400;
        curve2Height = 300;
        curve3Height = 200;
      }else{
        curve1Height = 0;
        curve2Height = 0;
        curve3Height = 0;
      }
      //start animation
    return  //start animation
       Scaffold(
        appBar: AppBar(title: GestureDetector(
            onTap: () {
              show=!show;
              setState(() {});
            },
            child: Text('Flutter Animation')),),
        body: Container(
          child:  Stack(
            children: [
              AnimatedContainer(
                height: curve1Height,
                duration: Duration(milliseconds: 500),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100),bottomRight: Radius.circular(100)),
                  child: Container(
                    color: Colors.green,
                  ),
                ),
              ),
              AnimatedContainer(
                height: curve2Height,
                duration: Duration(milliseconds: 500),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100),bottomRight: Radius.circular(100)),
                  child: Container(
                    color: Colors.red,
                  ),
                ),
              ),
              AnimatedContainer(
                height: curve3Height,
                duration: Duration(milliseconds: 500),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100),bottomRight: Radius.circular(100)),
                  child: Container(
                    color: Colors.brown,
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }}

