import 'dart:html';

import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {
  @override
  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {

  bool value1=false;
  bool value2=false;
  bool value3=false;
  bool value4=false;

  int radioValue=0;
  String result;
  Color resultColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
    body: ListView(
      children: [
        switchListTitle(title: "value 1",subtitle: "this is value 1 ",currentValue: value1,updateValue: (newValue){
          setState(() {
            value1=newValue;
          });
        }),
        switchListTitle(title: "value 2",subtitle: "this is value 2 ",currentValue: value2,updateValue: (newValue){
          setState(() {
            value2=newValue;
          });
        }),switchListTitle(title: "value 3",subtitle: "this is value 3 ",currentValue: value3,updateValue: (newValue){
          setState(() {
            value3=newValue;
          });
        }),switchListTitle(title: "value 4",subtitle: "this is value 4 ",currentValue: value4,updateValue: (newValue){
          setState(() {
            value4=newValue;
          });
        }),
        Text("guss 2+2"),
        Row(
          children: [
            Radio(
              value: 3,
              groupValue: radioValue,
              onChanged: (value){
                setState(() {
                  radioValue=value;
                });
              },
            ),
            Text("4")
          ],
        ),
        radioButton(value: 2),
        radioButton(value: 5),
        radioButton(value: 7),


      ],
    ),);
  }

  Widget switchListTitle({String title,String subtitle,bool currentValue, Function updateValue}){
    return SwitchListTile(
      title: Text(title),
        subtitle: Text(subtitle),
        value: currentValue, onChanged: updateValue
    );
  }


  myDialog(){
    var ad = AlertDialog(content: Container(
      height: 100,child: Column(
      children: [
        Text("$result",style: TextStyle(color:resultColor ),),
        Divider(),
        Text(" Answer is :4")
      ],
    ),
    ),);
    showDialog(context: context,child: ad);
  }
  Row radioButton({int value}){
    return Row(
      children: [
        Radio(value: value, groupValue: radioValue, onChanged: (value){
          radioValue = value;
          result = value==5?"correct Answer":"worng Answer";
          resultColor = value==5?Colors.green:Colors.red;
          myDialog();
        })
      ],
    );
  }
}
