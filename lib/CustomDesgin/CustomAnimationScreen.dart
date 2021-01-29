import 'package:flutter/material.dart';

class CustomAnimationScreen extends StatefulWidget {
  @override
  _CustomAnimationScreenState createState() => _CustomAnimationScreenState();
}

class _CustomAnimationScreenState extends State<CustomAnimationScreen> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation<double> _animation;
  Animation<AlignmentGeometry> _animation2;
  Animation<Decoration> _animation3;

  Animation<TextStyle> _animation5;


  final DecorationTween _decorationTween4 = DecorationTween(
    end: BoxDecoration(
      color:  const Color(0xFFFFFFFF),
      border: Border.all(width: 2.0, color: const Color(0xFFFFFFFF)),
      borderRadius: BorderRadius.zero,
      shape: BoxShape.rectangle,
      boxShadow: [
        BoxShadow(
            blurRadius: 8,
            offset: Offset(0, 15),
            color: Color(0xff00D99E).withOpacity(.6),
            spreadRadius: -9)
      ],
    ),
      begin: BoxDecoration(
        color:  const Color(0xFFF88FFF),
        border: Border.all(width: 2.0, color: const Color(0xFFFFF00F)),
        borderRadius: BorderRadius.zero,
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
              blurRadius: 8,
              offset: Offset(0, 15),
              color: Color(0xff11D330).withOpacity(.6),
              spreadRadius: -9)
        ],
      )

  );


  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,duration: Duration(seconds: 2),
        // lowerBound: 0.0,upperBound: 1
    )..repeat(reverse: true,min: 0.0);
    _animation = CurvedAnimation(parent: _controller,curve: Curves.linear);


    _animation2 = Tween<AlignmentGeometry>(begin: Alignment.bottomRight,end: Alignment.topLeft).animate(CurvedAnimation(parent: _controller,curve: Curves.linear));

    _animation3 = DecorationTween(begin: BoxDecoration(color: Colors.cyan),end:BoxDecoration(color: Colors.amber)).animate(CurvedAnimation(parent: _controller,curve: Curves.linear));

    _animation5 = TextStyleTween(
      begin: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 25),
      end: TextStyle(color: Colors.cyan,fontWeight: FontWeight.bold,fontSize: 55),
    ).animate(CurvedAnimation(parent: _controller,curve: Curves.linear));


    super.initState();
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(children: [
          RotationTransition(turns: _animation,child: const Padding(padding: EdgeInsets.all(8),child: FlutterLogo(size: 70,),),),
          ScaleTransition(scale: _animation,child: const Padding(padding: EdgeInsets.all(8),child: FlutterLogo(size: 70,),),),
          SizeTransition(sizeFactor: _animation,child: const Padding(padding: EdgeInsets.all(8),child: FlutterLogo(size: 70,),),),
          SizeTransition(axis: Axis.horizontal ,sizeFactor: _animation,child: const Padding(padding: EdgeInsets.all(8),child: FlutterLogo(size: 70,),),),
          FadeTransition(opacity: _animation,child: const Padding(padding: EdgeInsets.all(8),child: FlutterLogo(size: 70,),),),
          AlignTransition(alignment: _animation2,child: const Padding(padding: EdgeInsets.all(8),child: FlutterLogo(size: 70,),),),
          DecoratedBoxTransition(decoration: _animation3,child: const Padding(padding: EdgeInsets.all(8),child: FlutterLogo(size: 70,),),),
          DecoratedBoxTransition(decoration: _decorationTween4.animate(_controller),child: const Padding(padding: EdgeInsets.all(8),child: FlutterLogo(size: 70,),),),
          DefaultTextStyleTransition(style: _animation5,child: const Padding(padding: EdgeInsets.all(8),child: Text("Text"),),),
        ]),
      ),
    );
  }
}
