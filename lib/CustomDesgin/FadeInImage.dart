import 'package:flutter/material.dart';

class MyFadeInImage extends StatefulWidget {
  @override
  _MyFadeInImageState createState() => _MyFadeInImageState();
}

class _MyFadeInImageState extends State<MyFadeInImage> with SingleTickerProviderStateMixin{

  AnimationController  _controller;
  Animation<Size> _animation;

  @override
  void initState() {

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    )..repeat();

    _animation = Tween<Size>(
      begin: Size(200,150),
      end: Size(200,350)
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear
    ));

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
      appBar: AppBar(),
      body: ListView(
        children: [
          Hero(
            tag: 'img',
            child: Container(
               child: FadeInImage(height: 200,width: 200,
                 placeholder: AssetImage('assets/images/1.jpg',),
                 image: NetworkImage('https://www.w3bai.com/css/img_lights.jpg'),
               ),
            ),
          ),
          AnimatedBuilder(animation: _controller, builder: (ctx,child)=>
           FlutterLogo(size: _animation.value.height,),
          ),
          ListTile(trailing: Icon(Icons.arrow_forward),title: Text("forward"),
          tileColor: Colors.cyan,onTap: ()=> _controller.forward(),),

          ListTile(trailing: Icon(Icons.arrow_forward),title: Text("forward"),
            tileColor: Colors.cyan,onTap: ()=> _controller.repeat(),),



        ],
      ),
    );
  }
}
