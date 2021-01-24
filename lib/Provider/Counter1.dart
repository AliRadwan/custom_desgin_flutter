import 'package:ali_flutter_desgin/Provider/CounterProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var count1 = Provider.of<CounterProvider>(context);
    var count2 = context.watch<CounterProvider>().counter;
    return Column(
      children: [
        Card(
            child: Center(child: Text(" ${count1.counter}", style: TextStyle(fontSize: 20),
        ))),
        Card(
            child: Center(child: Text(" ${count2}", style: TextStyle(fontSize: 20),
            ))),
        Consumer<CounterProvider>(builder: (context,value,child)=>
          Card(
              child: Center(child: Text(" ${value.counter}", style: TextStyle(fontSize: 20),
              ))),
        ),
        Selector<CounterProvider,int>(
          selector: (context,val)=>val.num,
          builder: (context,value,child)=>Text("$value"),),
        Text("${context.select<CounterProvider,int>((value) => value.num)}")



      ],
    );
  }
}
