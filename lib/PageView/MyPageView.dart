import 'dart:async';

import 'package:ali_flutter_desgin/Splash.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Data {
  final String title;
  final String description;
  final String imageUrl;
  final IconData iconDate;

  Data(this.title, this.description, this.imageUrl, this.iconDate);
}

class MyPageView extends StatefulWidget {
  @override
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  final PageController _controller = PageController(
     initialPage: 0,
  );
  final pageIndexNotifier = ValueNotifier<int>(0);

  int _currentIndex = 0;
  final List<Data> myData = [
    Data("title1", "description1", "assets/images/1.jpg", Icons.ac_unit),
    Data("title2", "description2", "assets/images/2.jpg", Icons.access_alarms_rounded),
    Data("title3", "description3", "assets/images/3.png", Icons.account_box_outlined),
    Data("title4", "description4", "assets/images/4.jpg", Icons.account_balance),
  ];
  
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 4), (timer) {
      if(_currentIndex<3)_currentIndex++;
      _controller.animateToPage(_currentIndex, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Builder(
              builder:(ctx)=> PageView(
                controller: _controller,
                children: myData
                    .map((item) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(image: ExactAssetImage(item.imageUrl),fit: BoxFit.cover)
                          ),child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(item.title),
                    SizedBox(height: 10,),
                    Text(item.description,textAlign: TextAlign.center,)
                  ],
                ),
                        ))
                    .toList(),
                onPageChanged:(val){
                  pageIndexNotifier.value = val;
                  setState(() {
                    _currentIndex = val;
                    // if(_currentIndex==3){
                    //   Future.delayed(Duration(seconds: 2),()=>Navigator.of(ctx).push(MaterialPageRoute(builder:(context)=>Splash())));
                    // }

                  });

                } ,
              ),
            ),
            Indicator(index: _currentIndex,),
            // PageViewIndicator(
            // pageIndexNotifier: pageIndexNotifier,
            // length: myData.length,
            // normalBuilder: (animationController, index) => Circle(
            // size: 8.0,
            // color: Colors.black87,
            // ),
            // highlightedBuilder: (animationController, index) => ScaleTransition(
            // scale: CurvedAnimation(
            // parent: animationController,
            // curve: Curves.ease,
            // ),
            // child: Circle(
            // size: 12.0,
            // color: Colors.accents.elementAt((index + 3) * 3),
            // ),
            // ),
            // ),
            Builder(
              builder:(ctx)=> Align(
                alignment: Alignment(0,0.9),
                  child: Container(
                    width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: RaisedButton(padding: EdgeInsets.all(7),onPressed: ()async{
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>Splash()));
                        SharedPreferences pref = await SharedPreferences.getInstance();
                        pref.setBool("x", true);
                      },child: Text("GET STARTED"),))),
            )
          ],
        ),
      ),
    );
  }
}


class Indicator extends StatelessWidget {
  final int index;

  const Indicator({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0,0.7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildContainer(0,index==0?Colors.blueAccent:Colors.black87),
          buildContainer(1,index==1?Colors.blueAccent:Colors.black87),
          buildContainer(2,index==2?Colors.blueAccent:Colors.black87),
          buildContainer(3,index==3?Colors.blueAccent:Colors.black87),
        ],
      ),
    );
  }

Widget buildContainer(int i,Color color){
    return index==1?Icon(Icons.icecream): Container(
      margin: EdgeInsets.all(4),
      height: 15,width: 15,
      decoration: BoxDecoration(color: color,shape: BoxShape.circle),
    );
}
}
