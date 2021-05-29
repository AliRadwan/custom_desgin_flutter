import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class OpenWebUrl extends StatefulWidget {
  @override
  _OpenWebUrlState createState() => _OpenWebUrlState();
}

class _OpenWebUrlState extends State<OpenWebUrl> {

  String url = "https://www.youtube.com/watch?v=5Z-rXuSIUOw&ab_channel=%D9%8A%D9%88%D9%86%D8%B3%D8%A7%D8%B3%D9%88%D9%8A%D9%84%D8%B5YounesSouilass";

  String str ="Open Web";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child:RaisedButton(
          child: Text(str),
          onPressed: ()async{
         try{
           await canLaunch(url) ? await launch(url,enableJavaScript: true,forceWebView: true):throw"Can not open url";
         }catch(e){
           setState(() {
             str = e.toString();
           });
         }
          },
        ) ,
      ),
    );
  }


}
