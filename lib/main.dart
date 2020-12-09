import 'package:ali_flutter_desgin/AutoComplete/CarouselScreen.dart';
import 'package:ali_flutter_desgin/DarkTheme/MyProvider.dart';
import 'package:ali_flutter_desgin/Provider/CounterProvider.dart';
import 'package:ali_flutter_desgin/Provider/ProviderCounterScreen.dart';
import 'Splash.dart';
import 'file:///E:/Work/Flutter/Test/ali_flutter_desgin/ali_flutter_desgin/lib/CustomCode/test1.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AutoComplete/AutoComplete.dart';
import 'CustomDesgin.dart';
import 'DarkTheme/MyDrawer.dart';
import 'CustomCode/ShowDialog.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=>MyProvider()),
      ChangeNotifierProvider(create: (_)=>CounterProvider(),)
    ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
      themeMode: Provider.of<MyProvider>(context).tm,
      theme: ThemeData(primaryColor: Colors.blue),
      darkTheme: ThemeData(primaryColor: Colors.black),
    );
  }
}




