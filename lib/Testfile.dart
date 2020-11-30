
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TestFile extends StatefulWidget {
  @override
  _TestFileState createState() => _TestFileState();
}


List <Info> data=[
  Info(id: 2, name: "Ali"),
  Info(id: 2, name: "Ali"),
  Info(id: 2, name: "Ali"),
  Info(id: 2, name: "Ali"),
];


class _TestFileState extends State<TestFile> {

  DateTime _selectedDate;

  void _datePicker(BuildContext context){
    showDatePicker(
        context: context,
        initialDate:DateTime.utc(2018,2,8) , firstDate: DateTime(2018), lastDate: DateTime.now()).then((value) => {
          _selectedDate == value
    });
  }

  @override
  Widget build(BuildContext context) {
    var itemList = List.generate(50, (index) => "Flutter $index");
    var controller = ScrollController();
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        controller.animateTo(0.0, duration: Duration(seconds: 1), curve: Curves.easeInOut);
      },),
      body: Column(
        children: [
          InkWell(
            onTap: ()=>_datePicker(context),
              child: Text("${DateFormat.yMMMd().format(_selectedDate)}")),
          InkWell(
              onTap: ()=>_datePicker(context),
              child: Text("${DateFormat('yy-MMM-dd').format(_selectedDate)}")),
          ...data.map((val){
            return Row(
              children: [
                Text(val.name),
                Text("${val.id}")
              ],
            );
          }).toList(),
          Container(
            height: 300,
            child: ListView.separated(
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(),
                ),
                padding: EdgeInsets.only(top: 20),
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: 15,
                cacheExtent: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Text("pokemon: value[index]");
                }),
          ),
          ListView.separated(
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(),
              ),
              padding: EdgeInsets.only(top: 20),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: 100,
              cacheExtent: 5,
              itemBuilder: (BuildContext context, int index) {
                return Text("pokemon: value[index]");
              }),
          Row(
            children: [
              Expanded(child: ListView(
                controller: controller,
                children:itemList.map((item){
                  return ListTile(
                    leading: FlutterLogo(),
                    title: Text(item),
                  );
                }).toList(),
              ))
            ],
          ),
        ],
      ),
    );
  }
}


class Info{
  int id;
  String name;
  Info({
    @required this.id, @required this.name
});

}
