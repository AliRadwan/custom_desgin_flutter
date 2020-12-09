import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowDialog extends StatefulWidget {
  @override
  _ShowDialogState createState() => _ShowDialogState();
}

class _ShowDialogState extends State<ShowDialog> {

  String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(decoration: BoxDecoration(
           gradient: LinearGradient(
             colors: [
               Colors.blue,
               Colors.black54,
               Colors.lime,
             ]
           )
        ),),
        title: Text("title"),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.access_alarms_rounded),onPressed: (){Navigator.of(context).pop(name);},),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(children: [
              ClipRRect(borderRadius: BorderRadius.circular(20),child:Image(image: null ,),),
            Positioned(
              bottom: 20,
                right: 20,
                child: Text("My Text",softWrap: true,overflow: TextOverflow.fade,))]),
            RaisedButton(
              child: Text('Show Material Dialog'),
              onPressed: _showMaterialDialog,
            ),
            RaisedButton(
              child: Text('Show Cupertino Dialog'),
              onPressed: _showCupertinoDialog,
            ),
          ],
        ),
      ),
    );
  }

  _showMaterialDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,barrierColor: Colors.red.withOpacity(0.7),
        builder: (_) => new AlertDialog(
          title: new Text("Material Dialog"),
          content: new Text("Hey! I'm Coflutter!"),
          actions: <Widget>[
            FlatButton(
              child: Text('Close me!'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ));
  }

  _showCupertinoDialog() {
    showDialog(
        context: context,
        builder: (_) => new CupertinoAlertDialog(
          title: new Text("Cupertino Dialog"),
          content: new Text("Hey! I'm Coflutter!"),
          actions: <Widget>[
            FlatButton(
              child: Text('Close me!'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ));
  }
}

