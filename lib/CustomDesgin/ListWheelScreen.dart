import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListWheelScreen extends StatefulWidget {
  @override
  _ListWheelScreenState createState() => _ListWheelScreenState();
}

class _ListWheelScreenState extends State<ListWheelScreen> {


  List<Widget> items = [
    ListTile(
      leading: Icon(Icons.local_activity, size: 50),
      title: Text('Activity'),
      subtitle: Text('Description here'),
    ),
    ListTile(
      leading: Icon(Icons.local_airport, size: 50),
      title: Text('Airport'),
      subtitle: Text('Description here'),
    ),
    ListTile(
      leading: Icon(Icons.local_atm, size: 50),
      title: Text('ATM'),
      subtitle: Text('Description here'),
    ),
    ListTile(
      leading: Icon(Icons.local_bar, size: 50),
      title: Text('Bar'),
      subtitle: Text('Description here'),
    ),
    ListTile(
      leading: Icon(Icons.local_cafe, size: 50),
      title: Text('Cafe'),
      subtitle: Text('Description here'),
    ),
    ListTile(
      leading: Icon(Icons.local_car_wash, size: 50),
      title: Text('Car Wash'),
      subtitle: Text('Description here'),
    ),
    ListTile(
      leading: Icon(Icons.local_convenience_store, size: 50),
      title: Text('Heart Shaker'),
      subtitle: Text('Description here'),
    )
  ];



  var _value = 0.0;

  final List<Widget> entries = List<Widget>.generate(
    15,
        (i) => Card(
      color:Colors.amber,
      child: Center(
        child: Text(
          "Item ${i + 1}",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  );




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
      body: ListView(
        children: [
          Container(
            height: 300,
            child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Flexible(
                flex: 8,
                child: ListWheelScrollView(
                  children: entries,
                  itemExtent: 100,
                  offAxisFraction: _value,
                ),
              ),
              Flexible(
                flex: 1,
                child: Center(
                  child: Text(
                    "Drag to change offAxisFraction value",
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Slider(
                  value: _value,

                  ///Color for active side of Slider
                  activeColor: Colors.lightBlue,

                  ///Color for inactive side of Slider
                  inactiveColor: Colors.lightBlue[50],

                  ///Minimum value of the slider
                  min: -1.0,

                  ///Maximum value of the slider
                  max: 1.0,

                  ///No.Of divisions from min to max value on the Slider
                  divisions: 100,

                  ///Value indicator above the slider
                  label: "${_value.toStringAsFixed(2)}",
                  onChanged: (double value) {
                    setState(
                          () {
                        _value = value;
                      },
                    );
                  },
                ),
              ),
            ],
        ),
          ),

          Container(
            width: double.infinity,
            height: 400,
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
        ],
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
