import 'package:flutter/material.dart';

class DismissibleScreen extends StatefulWidget {
  @override
  _DismissibleScreenState createState() => _DismissibleScreenState();
}

class _DismissibleScreenState extends State<DismissibleScreen> {
  final li = List<String>.generate(20, (index) => "Item Num${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: li.length,
          itemBuilder: (ctx, index) {
            final item = li[index];
            return Dismissible(
                key: Key(item),
                confirmDismiss: (DismissDirection dir) async{
                  if(dir == DismissDirection.startToEnd){
                    final bool res  = await showDialog(
                      context: context,
                      builder: (BuildContext ctx){
                        return AlertDialog(
                          content: Text(" Are you sure you want to delete $item ?"),
                          actions: [
                            FlatButton(onPressed: (){
                              Navigator.of(ctx).pop();
                            }, child: Text("Cancel")),
                            FlatButton(onPressed: (){
                              setState(() {
                                li.removeAt(index);
                                Navigator.of(ctx).pop();
                              });
                            }, child: Text("Delete")),

                          ],
                        );
                      }
                    );
                    return res;
                  }else{
                    return true;
                  }
                },
                onDismissed: (DismissDirection duration) {
                  setState(() => li.removeAt(index));
                  Scaffold.of(ctx).showSnackBar(
                      SnackBar(content: Text(duration == DismissDirection.startToEnd?"$item Deleted":"$item Liked"),
                        action: SnackBarAction(label: "Undo", onPressed: (){
                          setState(() {
                            li.insert(index, item);
                          });
                        }),
                      ));
                },
                child: ListTile(title: Center(child: Text(item))),
               background: Container(
                 color: Colors.red,
                 alignment: Alignment.centerLeft,
                 child: Icon(Icons.delete)),
              secondaryBackground: Container(
                color: Colors.green,
                alignment: Alignment.centerRight,
                child: Icon(Icons.thumb_up)),
            );
          }),
    );
  }
}
