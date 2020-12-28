import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PercentIndicator extends StatefulWidget {
  @override
  _PercentIndicatorState createState() => _PercentIndicatorState();
}

class _PercentIndicatorState extends State<PercentIndicator> {
  double _value = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          CircularPercentIndicator(
            radius: 130.0,
            lineWidth: 10.0,
            percent: 0.8,
            header: Text("Icon Header"),
            center: Icon(
              Icons.person_pin,
              size: 50.0,
              color: Colors.blueAccent,
            ),
            backgroundColor: Colors.grey,
            progressColor: Colors.blue,
          ),
          CircularPercentIndicator(
            radius: 130.0,
            animation: true,
            animationDuration: 1500,
            lineWidth: 15.0,
            percent: 0.5,
            center: Text("40 "),
            circularStrokeCap: CircularStrokeCap.butt,
            backgroundColor: Colors.yellow,
            progressColor: Colors.red,
          ),
          LinearPercentIndicator(
            width: 140.0,
            lineHeight: 14.0,
            percent: 0.5,
            center: Text(
              "50.0 %"
            ),
            trailing: Icon(Icons.mood),
            linearStrokeCap: LinearStrokeCap.roundAll,
            backgroundColor: Colors.grey,
            progressColor: Colors.blue,
          ),
          LinearPercentIndicator(
            width: 170.0,
            animation: true,
            animationDuration: 1000,
            lineHeight: 20.0,
            leading: Text("Left"),
            trailing: Text("right"),
            percent: 0.3,
            center: Text(
                "20.0 %"
            ),
            linearStrokeCap: LinearStrokeCap.butt,
            backgroundColor: Colors.grey,
            progressColor: Colors.blue,
          ),
          Divider(),
          CircularPercentIndicator(
            radius: 130.0,
            animation: true,
            animationDuration: 1500,
            lineWidth: 15.0,
            percent: 0.5,
            center: Text("40 "),
            circularStrokeCap: CircularStrokeCap.butt,
            backgroundColor: Colors.yellow,
            progressColor: Colors.red,
          ),
          Slider(value: _value, onChanged: (val){
            setState(() {
              _value = val;
            });
          },
            min: 0.0,
            max: 1.0,
            divisions: 10,
          )





        ],
      ),
    );
  }
}
