import 'package:flutter/material.dart';

class FechDataWithApi extends StatefulWidget {
  @override
  _FechDataWithApiState createState() => _FechDataWithApiState();
}

class _FechDataWithApiState extends State<FechDataWithApi> {


  getData()async{
    try{
      int a = await Future.delayed(Duration(seconds: 1),()=> throw Exception("Invalid"));
      print(a);

    }catch(e){
      print("Error = $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
         child: RaisedButton(
           child: Text("Click me "),
           onPressed: getData  ,
         ),
      ),
    );
  }
}
