import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListWheelScreen extends StatefulWidget {
  @override
  _ListWheelScreenState createState() => _ListWheelScreenState();
}

class _ListWheelScreenState extends State<ListWheelScreen> {
  static const  List <String> namesList=[
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
  "Jun",
  "Jul",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec",
  "This",
  "Is",
  "the",
  "end"];



  List<Color> colorList = List.generate(namesList.length, (index) => Colors.primaries[index]);

@override
  Widget build(BuildContext context) {
    int i = 0 ;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: ListWheelScrollView(
          itemExtent: 100,
          children: namesList.map((String name){
            return Container(
              decoration: BoxDecoration(
                color: colorList[i++],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1,color: Colors.red),
              ),
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(name),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ListWheelScreen2 extends StatefulWidget {

  @override
  _ListWheelScreen2State createState() => _ListWheelScreen2State();
}

class _ListWheelScreen2State extends State<ListWheelScreen2> {
  static const  List <String> namesList2=[
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
    "This",
    "Is",
    "the",
    "end"];

  List<Color> colorList2 = List.generate(namesList2.length, (index) => Colors.primaries[index]);

  @override
  Widget build(BuildContext context) {
    int l=0;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: ListWheelScrollView(
            itemExtent: 100,
            children:[
              ...namesList2.map((String name){
                return Container(
                  decoration: BoxDecoration(
                    color: colorList2[l++],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1,color: Colors.red),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Text(name),
                  ),
                );
              })
            ]
        ),
      ),
    );
  }
}
