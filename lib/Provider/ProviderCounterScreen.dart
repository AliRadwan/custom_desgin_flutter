import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Counter1.dart';
import 'Counter2.dart';
import 'CounterProvider.dart';

class ProviderCounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int buildcount=0;
    var count1  = Provider.of<CounterProvider>(context,listen: false);
    // var count2 = context.read<CounterProvider>().increment();
    print("${buildcount++}");
    return Scaffold(
      appBar: AppBar(),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FloatingActionButton(
                onPressed: ()=> count1.increment(),
                // listen true
                child: Icon(Icons.add),
              ),
              Consumer<CounterProvider>(
                builder: (context,value,_)=>FloatingActionButton(
                  onPressed: ()=> value.increment(),
                  // listen true
                  child: Icon(Icons.navigate_before),
                ),
              ),

              // Selector<CounterProvider,var>(
              //   builder:(context,value,child)=>
              //    FloatingActionButton(
              //     onPressed: ()=> value.increment(),
              //     // listen false
              //     child: Icon(Icons.add),
              //   ),
              // ),

              FloatingActionButton(
                onPressed: ()=> context.read<CounterProvider>().increment(),
                // listen false
                child: Icon(Icons.navigate_next),
              )
            ],
          ),
        ),
      body: Center(
        child: Column(
          children: [
            Counter1(),
            Counter2(),

          ],
        ),
      ),
    );
  }
}
