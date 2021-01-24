import 'package:ali_flutter_desgin/DarkTheme/MyProvider.dart';
import 'package:ali_flutter_desgin/Provider/CounterProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'CustomDesgin/Splash.dart';
import 'PageView/MyPageView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool decision = preferences.getBool("x");
  Widget _screen = (decision==false || decision== null)?MyPageView():Splash();

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
      home: MyPageView(),
      themeMode: Provider.of<MyProvider>(context).tm,
      theme: ThemeData(primaryColor: Colors.blue),
      darkTheme: ThemeData(primaryColor: Colors.black),
    );
  }
}




