import 'dart:io';
import 'dart:math';

import 'package:ali_flutter_desgin/CustomCode/GridView.dart';
import 'package:ali_flutter_desgin/CustomCode/Testfile.dart';
import 'package:ali_flutter_desgin/CustomCode/test1.dart';
import 'package:ali_flutter_desgin/CustomDesgin/CustomAnimationScreen.dart';
import 'package:ali_flutter_desgin/CustomDesgin/TimerScreen.dart';
import 'GridViewScreen.dart';
import 'InteractiveScreen.dart';
import 'OpenPDF.dart';
import 'OpenWebUrl.dart';
import 'TransformScreen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marquee/marquee.dart';

import 'AnimatedAlignWidget.dart';
import '../CustomCode/CustomRadioButton.dart';
import '../DarkTheme/MyDrawer.dart';
import 'Dismissible.dart';
import 'ImagePickerScreen.dart';
import 'ListWheelScreen.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../AutoComplete/AutoComplete.dart';
import '../AutoComplete/CarouselScreen.dart';
import '../Provider/ProviderCounterScreen.dart';
import '../CustomCode/ShowDialog.dart';

class MyDesignScreen extends StatefulWidget {
  @override
  _MyDesignScreenState createState() => _MyDesignScreenState();
}

class _MyDesignScreenState extends State<MyDesignScreen> {
  String _selectedLetter;
  List _letterList = ['a', 'b', 'c', 'd', 'e'];
  double _fontSize = 30;
  Color _color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: SafeArea(
        top: true,
        bottom: true,
        // left: true,
        // right: true,
        minimum: EdgeInsets.all(0.0),
        maintainBottomViewPadding: true,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.blue,
                  Colors.blueAccent,
                  Colors.blue,
                ])),
              ),
              title: const Text("title"),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

                    DefaultTextStyle(style: TextStyle(fontSize: 12,color: Colors.cyan), child: Column(
                      children: [
                        Text("Hi there"),
                        Text("Hi there"),
                        Text("Hi there"),
                      ],
                    )),
                    AnimatedDefaultTextStyle(
                        duration: Duration(milliseconds: 500),
                        style: TextStyle(fontSize: _fontSize,color: _color), child: Column(
                      children: [
                        Text("Hi there"),
                        Text("Hi there"),

                      ],
                    )),


                    SizedBox(
                      height: 70,child: Card(
                      child: Marquee(
                        text: " This is text for test",
                        blankSpace: 20,scrollAxis: Axis.horizontal,crossAxisAlignment: CrossAxisAlignment.start,
                        // pauseAfterRound: Duration(seconds: 1),
                        accelerationDuration: Duration(milliseconds: 50),
                      ),
                    ),
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      height: 70,child: Card(
                      child: Marquee(
                        text: " This is text for test",
                        blankSpace: 50,scrollAxis: Axis.vertical,crossAxisAlignment: CrossAxisAlignment.start,
                        // pauseAfterRound: Duration(seconds: 3),
                        accelerationDuration: Duration(milliseconds: 50),
                      ),
                    ),
                    ),
                    Placeholder(
                      strokeWidth: 3.0,
                      color: Colors.pink,
                      fallbackHeight: 20,
                      fallbackWidth: 300,
                    ),
                    AnimatedAlign(
                        alignment: Alignment.centerRight,
                        curve: Curves.easeInBack,
                        heightFactor: 2.0,
                        widthFactor: 1.0,
                        duration: Duration(seconds: 3),
                        child: Text("Animated Text  ")),
                    AnimatedAlign(
                        alignment: Alignment.centerRight,
                        curve: Curves.bounceInOut,
                        heightFactor: 2.0,
                        widthFactor: 1.0,
                        duration: Duration(seconds: 3),
                        child: FlatButton(
                          child: Text("Animated Button"),
                          onPressed: null,
                        )),
                    Placeholder(
                      strokeWidth: 3.0,
                      color: Colors.pink,
                      fallbackHeight: 20,
                      fallbackWidth: 300,
                    ),

                    RaisedButton(
                      child: Text("CustomAnimationScreen"),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>CustomAnimationScreen()));
                      },
                    ),
                    RaisedButton(
                      child: Text("ImagePickerScreen"),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ImagePickerScreen()));
                      },
                    ),
                    RaisedButton(
                      child: Text("TimerScreen"),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TimerScreen()));
                      },
                    ),
                    RaisedButton(
                      child: Text("OpenPDF "),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => OpenPDF()));
                      },
                    ),

                    RaisedButton(
                      child: Text("InteractiveScreen"),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => InteractiveScreen()));
                      },
                    ),
                    RaisedButton(
                      child: Text("ListWheelScreen"),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ListWheelScreen()));
                      },
                    ),
                    RaisedButton(
                      child: Text("DismissibleScreen"),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DismissibleScreen()));
                      },
                    ),


                    RaisedButton(
                      child: Text("AnimatedAlignWidget"),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AnimatedAlignWidget()));
                      },
                    ),

                    RaisedButton(
                      child: Text("OpenWebUrl"),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => OpenWebUrl()));
                      },
                    ),

                    Placeholder(
                      strokeWidth: 3.0,
                      color: Colors.pink,
                      fallbackHeight: 60,
                      fallbackWidth: 300,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              // shape: BoxShape.circle, // if you want circle, default is rectangle
                              gradient: LinearGradient(
                                  colors: [Colors.pink, Colors.lightBlueAccent],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight),
// adds border around the container
                              border: Border.all(
                                color: Colors.lightGreenAccent,
                                width: 6.0,
                                style: BorderStyle.solid,
                              ),
// adds rounded curve around the corners
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
// adds shadow behind the container
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 15.0,
                                  spreadRadius: 3.0,
                                  offset: Offset(10.0, 10.0),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              height: 100,
                              width: 100,
                              decoration: ShapeDecoration(
                                color: Colors.pink,
                                shape: CircleBorder(
                                  // shape is required
                                  side: BorderSide(
                                    color: Colors.blueAccent,
                                    width: 6.0,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                shadows: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 15.0,
                                    spreadRadius: 3.0,
                                    offset: Offset(10.0, 10.0),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: 100,
                              width: 100,
                              decoration: ShapeDecoration(
                                color: Colors.pink,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  side: BorderSide(
                                    color: Colors.blueAccent,
                                    width: 6.0,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                shadows: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 15.0,
                                    spreadRadius: 3.0,
                                    offset: Offset(10.0, 10.0),
                                  ),
                                ],
                              )),
                          Container(
                              height: 100,
                              width: 100,
                              decoration: ShapeDecoration(
                                color: Colors.pink,
                                shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  side: BorderSide(
                                    color: Colors.blueAccent,
                                    width: 6.0,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                shadows: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 15.0,
                                    spreadRadius: 3.0,
                                    offset: Offset(10.0, 10.0),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 100,
                          width: 100,
                          decoration: ShapeDecoration(
                            color: Colors.pink,
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              side: BorderSide(
                                color: Colors.blueAccent,
                                width: 6.0,
                                style: BorderStyle.solid,
                              ),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 15.0,
                                spreadRadius: 3.0,
                                offset: Offset(10.0, 10.0),
                              ),
                            ],
                          )),
                    ),
                    Placeholder(
                      strokeWidth: 3.0,
                      color: Colors.pink,
                      fallbackHeight: 60,
                      fallbackWidth: 300,
                    ),
                    Stack(
                      overflow: Overflow.visible,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10.0,
                                spreadRadius: 3.0,
                                offset: Offset(10.0, 10.0),
                              ),
                            ],
                          ),
                          alignment: Alignment.centerRight,
                          width: 300,
                          height: 300,
                          child: RotatedBox(
                            quarterTurns: 1,
                            child: Text(
                              'Container 1',
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10.0,
                                spreadRadius: 3.0,
                                offset: Offset(10.0, 10.0),
                              ),
                            ],
                          ),
                          alignment: Alignment.centerRight,
                          width: 300,
                          height: 300,
                          child: RotatedBox(
                            quarterTurns: 1,
                            child: Marquee(
                              text: "Container",
                              blankSpace: 20,scrollAxis: Axis.horizontal,crossAxisAlignment: CrossAxisAlignment.start,
                              // pauseAfterRound: Duration(seconds: 1),
                              accelerationDuration: Duration(milliseconds: 50),
                            ),
                          ),
                        ),
                        Positioned(
                          left: -15,
                          top: -15,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 15.0,
                                  spreadRadius: 3.0,
                                  offset: Offset(10.0, 10.0),
                                ),
                              ],
                            ),
                            alignment: Alignment.bottomCenter,
                            width: 250,
                            height: 250,
                            child: Marquee(
                              text: "Container 2",
                              blankSpace: 20,scrollAxis: Axis.horizontal,crossAxisAlignment: CrossAxisAlignment.end,
                              // pauseAfterRound: Duration(seconds: 1),
                              accelerationDuration: Duration(milliseconds: 50),
                            ),
                          ),
                        ),
                        Positioned(
                          top: -50,
                          right: 30,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 10.0,
                                  spreadRadius: 2.0,
                                  offset: Offset(5.0, 5.0),
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            width: 200,
                            height: 200,
                            child: Marquee(
                              text: " Container",
                              blankSpace: 20,scrollAxis: Axis.vertical,crossAxisAlignment: CrossAxisAlignment.center,
                              // pauseAfterRound: Duration(seconds: 1),
                              accelerationDuration: Duration(milliseconds: 50),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 30,
                    ),
                    Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 5.0),
                        ),
                        child: OverflowBox(
                            maxHeight: 300,
                            maxWidth: 300,
                            minHeight: 50,
                            minWidth: 50,
                            alignment: Alignment.center,
                            child: SizedBox(
                                height: 275,
                                width: 0,
                                child: RaisedButton(
                                  onPressed: () {},
                                  color: Colors.amber,
                                  child: Center(
                                    child: Wrap(
                                      alignment: WrapAlignment.center,
                                      direction: Axis.vertical,
                                      //stack individual text widgets on top of each other
                                      children: _arrayOfText(),
                                    ),
                                  ),
                                )))),
                    Divider(
                      height: 70,
                    ),
                    Container(
                      color: Colors.brown,
                      child: SizedOverflowBox(
                        size: Size(50, 100),
                        alignment: Alignment.center,
                        child: RaisedButton(
                          onPressed: () {},
                          color: Colors.amber,
                          child: Text(
                            'Raised Button',
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                      ),
                    ),
                    Placeholder(
                      strokeWidth: 3.0,
                      color: Colors.pink,
                      fallbackHeight: 60,
                      fallbackWidth: 300,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          color: Colors.lightBlueAccent,
                          height: 200,
                          width: 200,
                          child: RotatedBox(
                              quarterTurns: 1,
                              child: Text(
                                'Rotated by a quarter',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.pink),
                              )),
                        ),
                        Container(
                          alignment: Alignment.center,
                          color: Colors.pinkAccent,
                          height: 200,
                          width: 200,
                          child: RotatedBox(
                              quarterTurns: 2,
                              child: Text(
                                'Rotated by 2 quarter',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              )),
                        ),
                        Container(
                          alignment: Alignment.center,
                          color: Colors.limeAccent,
                          height: 200,
                          width: 200,
                          child: RotatedBox(
                              quarterTurns: 3,
                              child: Text(
                                'Rotated by 3 quarter',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.blueAccent),
                              )),
                        ),
                      ],
                    ),
                    Placeholder(
                      strokeWidth: 3.0,
                      color: Colors.pink,
                      fallbackHeight: 60,
                      fallbackWidth: 300,
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.deepPurple, shape: BoxShape.rectangle),
                      position: DecorationPosition.background,
                      child: Text("DecoratedBox"),
                    ),
                    Placeholder(
                      strokeWidth: 3.0,
                      color: Colors.pink,
                      fallbackHeight: 60,
                      fallbackWidth: 300,
                    ),

                    Container(
                      transform: Matrix4.rotationZ(0.2),
                      child: TextButton.icon(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MyGridScreen()));
                          },
                          icon: Icon(Icons.ad_units),
                          label: Text(" GridView Screen ")),
                    ),

                    Placeholder(
                      strokeWidth: 3.0,
                      color: Colors.pink,
                      fallbackHeight: 60,
                      fallbackWidth: 300,
                    ),

                    RaisedButton(
                      child: Text("Transform Screen"),
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => TransformScreen()));
                      },
                    ),

                    Text('Selected Letter'),
                    DropdownButton(
                        value: _selectedLetter,
                        items: _letterList.map((item) {
                          return DropdownMenuItem(
                            child: Text(item),
                            value: item,
                          );
                        }).toList(),
                        onChanged: (newVAl) {
                          setState(() {
                            _selectedLetter = newVAl;
                          });
                        }),
                    ExpansionTile(
                      title: Text(" Account"),
                      leading: Icon(Icons.account_box_outlined),
                      children: [
                        Divider(),
                        Card(
                          child: ListTile(
                            leading: Icon(Icons.account_box),
                            trailing: Icon(Icons.access_alarm_outlined),
                            title: Text("SginIN"),
                            subtitle: Text("Where you can "),
                            onTap: () {},
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: Icon(Icons.account_box),
                            trailing: Icon(Icons.access_alarm_outlined),
                            title: Text("SginIN"),
                            subtitle: Text("Where you can "),
                            onTap: () {},
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Card(
                          child: ListTile(
                            leading: Icon(Icons.account_box),
                            trailing: Icon(Icons.access_alarm_outlined),
                            title: Text("SginIN"),
                            subtitle: Text("Where you can "),
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),

                    RaisedButton(
                      child: Text("FutureScreen"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProviderCounterScreen()));
                      },
                    ),
                    RaisedButton(
                      child: Text("CounterScreen"),
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>ProviderCounterScreen()));
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => ProviderCounterScreen()));
                      },
                    ),

                    RaisedButton(
                      child: Text("CustomRadioButton"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CustomRadioButton()));
                      },
                    ),

                    RaisedButton(
                      child: Text("Show Carousel"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CarouselScreen()));
                      },
                    ),

                    RaisedButton(
                        child: Text("show FlushBar"),
                        onPressed: () {
                          Flushbar(
                                  duration: Duration(seconds: 2),
                                  icon: Icon(
                                    Icons.info,
                                    color: Colors.red,
                                  ),
                                  backgroundColor: Colors.blueGrey,
                                  mainButton: FlatButton(
                                      child: Text("button"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      }),
                                  messageText: Text("this is message"),
                                  title: "This is message")
                              .show(context);
                        }),

                    const SelectableText(
                      "sdnkjsdnk lksdnlndlns lknsdlkndlnds lmlmdslmd ",
                      showCursor: true,
                      cursorWidth: 10,
                      toolbarOptions:
                          ToolbarOptions(copy: true, selectAll: true),
                    ),

                    /// Text Overflow
                    ///  TextOverflow.clip= الحاله الافتراضيه وهيه قص النص علي حج الكونتينر
                    ///  TextOverflow.ellipsis = يقطع النص ويترك ثلاث نقاط دليل علي التكلمه
                    ///  TextOverflow.fade = يتلاشا النص تدريجيا
                    ///  TextOverflow.visible = اظهار النص كامل بغض النظر علي حجم الكونتينر المحتوي له

                    const Text(
                      "lsalanlsn  alsknnalnxl lanslnalsn lanslnalns ",
                      overflow: TextOverflow.visible,
                    ),
                    RaisedButton(
                      child: Text("Show SnackBar"),
                      onPressed: () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShowDialog()))
                            .then((value) => print(value));
                      },
                    ),

                    RaisedButton(
                      child: Text("ShowDialog"),
                      onPressed: () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShowDialog()))
                            .then((value) => print(value));
                      },
                    ),

                    RaisedButton(
                      child: Text("GridScreen"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GridViewScreen()));
                      },
                    ),

                    RaisedButton(
                      child: Text("TestFile()"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TestFile()));
                      },
                    ),

                    RaisedButton(
                      child: Text("Auto Search"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AutoCompleteDemo()));
                      },
                    ),

                    // Text Show shadow
                    const Text("login",
                        style: TextStyle(
                            color: Colors.deepOrangeAccent,
                            fontSize: 20,
                            shadows: <Shadow>[
                              Shadow(
                                  offset: Offset(10.0, 10.0),
                                  color: Colors.deepPurple,
                                  blurRadius: 5),
                              Shadow(
                                  offset: Offset(10.0, 10.0),
                                  color: Colors.blueAccent,
                                  blurRadius: 5)
                            ])),

                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    const Text.rich(
                      const TextSpan(text: "It is ", children: <TextSpan>[
                        const TextSpan(
                            text: "playerName's ",
                            style: TextStyle(
                              color: Colors.redAccent,
                              // <- override the color
                              fontSize: 100,
                              // <- override the font size
                              fontWeight: FontWeight
                                  .bold, // <- override the font weight
                            )),
                        const TextSpan(text: "turn to serve.")
                      ]),
                      style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 30,
                          fontFamily: 'Roboto',
                          color: Colors.indigo),
                    ),
                    Center(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        direction: Axis.vertical,
                        //stack individual text widgets on top of each other
                        children: _arrayOfText(),
                      ),
                    ),
                    TextPage()
                  ],
                ),
              ),
            ]))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Random r = Random();
          setState(() {
            _fontSize = r.nextInt(50).toDouble();
            _color = Color.fromRGBO(r.nextInt(256), r.nextInt(256), r.nextInt(256), 1);
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  String myText = "0123456789";

  List<Text> _arrayOfText() {
    // split our text into individual text widgets
    return myText
        .split("")
        .map((letter) => Text(
              letter,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 40,
                  color: Colors.blueAccent),
            ))
        .toList();
  }

  File image;

  Future getImage(ImageSource src) async {
    final pickFile = await ImagePicker().getImage(source: src);

    if (pickFile != null) {
      image = File(pickFile.path);
      print("Image Selected");
    } else {
      print("NO Image Selected");
    }
  }


//****************************************************************************************

// String desc=" ";
//   var description = desc.length>=20?desc.replaceRange(20, desc.length, "...")

//****************************************************************************************
// String desc;
// List<MyData> myList;

// var firstItem = myList.firstWhere((element) => element.description == desc,orElse: ()=>null);

}
// class MyData {
//   final String description;
//   MyData(this.description);
// }
//****************************************************************************************


