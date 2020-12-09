import 'package:ali_flutter_desgin/DarkTheme/MyProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var value = Provider.of<MyProvider>(context,listen: true).swVal;
    return Drawer(
      child: Center(
        child: Row(children: [
          Padding(padding: EdgeInsets.all(40),
          child: Text("Light"),),
          Switch(value: value, onChanged: (bool val)=>Provider.of<MyProvider>(context,listen: false).switchChangeTheme(val),activeColor: Colors.black54,inactiveThumbColor: Colors.blueGrey,),
          Padding(padding: EdgeInsets.all(40),
            child: Text("Dark"),),

        ],),
      ),
    );
  }
}
