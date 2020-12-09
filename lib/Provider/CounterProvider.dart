import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier{
  int counter =0  ;
  int num = 8;
  increment(){
    counter ++;
    notifyListeners();
  }
}