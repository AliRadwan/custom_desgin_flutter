
import 'dart:io';

import 'package:ali_flutter_desgin/CustomCode/GridView.dart';
import 'package:image_picker/image_picker.dart';

import 'CustomCode/CustomRadioButton.dart';
import 'DarkTheme/MyDrawer.dart';
import 'file:///E:/Work/Flutter/Test/ali_flutter_desgin/ali_flutter_desgin/lib/CustomCode/test1.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import 'AutoComplete/AutoComplete.dart';
import 'AutoComplete/CarouselScreen.dart';
import 'Provider/ProviderCounterScreen.dart';
import 'CustomCode/ShowDialog.dart';

class MyDesignScreen extends StatefulWidget {
  @override
  _MyDesignScreenState createState() => _MyDesignScreenState();
}

class _MyDesignScreenState extends State<MyDesignScreen> {

  String _selectedLetter;
  List _letterList = ['a','b','c','d','e'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: Container(decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.blueAccent,
                      Colors.blue,
                    ]
                )
            ),),
            title: const Text("title"),
          ),SliverList(delegate: SliverChildListDelegate([
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Selected Letter'),
                  DropdownButton(
                    value: _selectedLetter,
                      items: _letterList.map((item){
                        return DropdownMenuItem(child: Text(item),value: item,);
                      }).toList(), onChanged: (newVAl){
                      setState(() {
                        _selectedLetter = newVAl;
                      });
                  }),
                  ExpansionTile(title: Text(" Account"),leading: Icon(Icons.account_box_outlined),
                  children: [
                    Divider(),
                    Card(
                      child: ListTile(
                        leading: Icon(Icons.account_box),
                        trailing: Icon(Icons.access_alarm_outlined),
                        title: Text("SginIN"),
                        subtitle: Text("Where you can "),
                        onTap: (){

                        },
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: Icon(Icons.account_box),
                        trailing: Icon(Icons.access_alarm_outlined),
                        title: Text("SginIN"),
                        subtitle: Text("Where you can "),
                        onTap: (){

                        },
                      ),
                    ),
                    SizedBox(height: 50,),
                    Card(
                      child: ListTile(
                        leading: Icon(Icons.account_box),
                        trailing: Icon(Icons.access_alarm_outlined),
                        title: Text("SginIN"),
                        subtitle: Text("Where you can "),
                        onTap: (){

                        },
                      ),
                    ),


                  ],),
                  RaisedButton(child:Text("CounterScreen"),onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProviderCounterScreen()));
                  },),

                  RaisedButton(child:Text("CustomRadioButton"),onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomRadioButton()));
                  },),


                  RaisedButton(child:Text("Show Carousel"),onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CarouselScreen()));
                  },),

                  RaisedButton(child: Text("show FlushBar"),onPressed: (){
                    Flushbar(
                        duration: Duration(seconds: 2),
                        icon: Icon(Icons.info,color: Colors.red,),backgroundColor: Colors.blueGrey,
                        mainButton: FlatButton(child: Text("button"),onPressed: (){Navigator.of(context).pop();}),
                        messageText: Text("this is message"), title: "This is message").show(context);}),


                  const     SelectableText("sdnkjsdnk lksdnlndlns lknsdlkndlnds lmlmdslmd ",showCursor: true,cursorWidth: 10,toolbarOptions: ToolbarOptions(copy: true,selectAll: true),),
                  /// Text Overflow
                  ///  TextOverflow.clip= الحاله الافتراضيه وهيه قص النص علي حج الكونتينر
                  ///  TextOverflow.ellipsis = يقطع النص ويترك ثلاث نقاط دليل علي التكلمه
                  ///  TextOverflow.fade = يتلاشا النص تدريجيا
                  ///  TextOverflow.visible = اظهار النص كامل بغض النظر علي حجم الكونتينر المحتوي له
                  const  Text("lsalanlsn  alsknnalnxl lanslnalsn lanslnalns ",overflow: TextOverflow.visible,),
                  RaisedButton(child:Text("Show SnackBar"),onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowDialog())).then((value) => print(value));
                  },),

                  RaisedButton(child:Text("ShowDialog"),onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowDialog())).then((value) => print(value));
                  },),

                  RaisedButton(child:Text("GridScreen"),onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>GridViewScreen()));
                  },),

                  // TestFile(),
                  RaisedButton(child:Text("Auto Search"),onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AutoCompleteDemo()));
                  },),

                  // Text Show shadow
                  const    Text("login",style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 20,shadows: <Shadow>[
                    Shadow(offset: Offset(10.0,10.0), color: Colors.deepPurple, blurRadius:5),
                    Shadow(offset: Offset(10.0,10.0), color: Colors.blueAccent, blurRadius:5)])),

                  const Text('You have pushed the button this many times:',),
                  const Text.rich(
                    const TextSpan(text: "It is ", children: <TextSpan>[
                      const  TextSpan(
                          text: "playerName's ",
                          style: TextStyle(
                            color: Colors.redAccent, // <- override the color
                            fontSize: 100, // <- override the font size
                            fontWeight: FontWeight.bold,  // <- override the font weight
                          )),
                      const  TextSpan(text: "turn to serve.")
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

  File image;
  Future getImage(ImageSource src) async {
    final pickFile = await ImagePicker().getImage(source: src);

    if(pickFile != null){
      image = File(pickFile.path);
      print("Image Selected");
    }else{
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
