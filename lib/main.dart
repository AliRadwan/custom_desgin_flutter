import 'package:ali_flutter_desgin/AutoComplete/CarouselScreen.dart';
import 'package:ali_flutter_desgin/test1.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import 'AutoComplete/AutoComplete.dart';
import 'ShowDialog.dart';
import 'Testfile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: Container(decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.black54,
                      Colors.lime,
                    ]
                )
            ),),
            title: Text("title"),
          ),SliverList(delegate: SliverChildListDelegate([
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(child:Text("Show Carousel"),onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CarouselScreen()));
                  },),

                  RaisedButton(child: Text("show FlushBar"),onPressed: (){
                    Flushbar(
                      duration: Duration(seconds: 2),
                      icon: Icon(Icons.info,color: Colors.red,),backgroundColor: Colors.blueGrey,
                      mainButton: FlatButton(child: Text("button"),onPressed: (){Navigator.of(context).pop();}),
                      messageText: Text("this is message"), title: "This is message").show(context);}),
                  
                  SelectableText("sdnkjsdnk lksdnlndlns lknsdlkndlnds lmlmdslmd ",showCursor: true,cursorWidth: 10,toolbarOptions: ToolbarOptions(copy: true,selectAll: true),),
                  /// Text Overflow
                  ///  TextOverflow.clip= الحاله الافتراضيه وهيه قص النص علي حج الكونتينر
                  ///  TextOverflow.ellipsis = يقطع النص ويترك ثلاث نقاط دليل علي التكلمه
                  ///  TextOverflow.fade = يتلاشا النص تدريجيا
                  ///  TextOverflow.visible = اظهار النص كامل بغض النظر علي حجم الكونتينر المحتوي له
                  Text("lsalanlsn  alsknnalnxl lanslnalsn lanslnalns ",overflow: TextOverflow.visible,),
                  RaisedButton(child:Text("Show SnackBar"),onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowDialog())).then((value) => print(value));
                  },),

                  RaisedButton(child:Text("ShowDialog"),onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowDialog())).then((value) => print(value));
                  },),


                  // TestFile(),
                  RaisedButton(child:Text("Auto Search"),onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AutoCompleteDemo()));
                  },),

                  // Text Show shadow
                  Text("login",style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 20,shadows: <Shadow>[
                    Shadow(offset: Offset(10.0,10.0), color: Colors.deepPurple, blurRadius:5),
                    Shadow(offset: Offset(10.0,10.0), color: Colors.blueAccent, blurRadius:5)])),

                  Text('You have pushed the button this many times:',),
                  Text.rich(
                    TextSpan(text: "It is ", children: <TextSpan>[
                      TextSpan(
                          text: "playerName's ",
                          style: TextStyle(
                            color: Colors.redAccent, // <- override the color
                            fontSize: 100, // <- override the font size
                            fontWeight: FontWeight.bold,  // <- override the font weight
                          )),
                      TextSpan(text: "turn to serve.")
                    ]),
                    style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 30,
                        fontFamily: 'Roboto',
                        color: Colors.white),
                  ),
                  Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      direction: Axis.vertical,  //stack individual text widgets on top of each other
                      children: _arrayOfText(),
                    ),
                  ),
                  TextPage()
                ],
              ),
            ),
          ]

          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  String myText = "0123456789";
  List<Text> _arrayOfText() { // split our text into individual text widgets
    return myText
        .split("")
        .map((letter) => Text(
      letter,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontWeight: FontWeight.w100,
          fontSize: 40,
          color: Colors.white),
    ))
        .toList();
  }

}



