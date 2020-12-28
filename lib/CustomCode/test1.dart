//How do I make text clickable?
//GestureDetector


import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          print('tapped');
        },
        child: Text(
          'Hello',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              fontFamily: 'Roboto',
                color: Colors.deepPurple),
        ),
      ),
    );
  }
}
