
import 'package:flutter/cupertino.dart';
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

  DateTime _selectedDate = DateTime.now();

  void _datePicker(BuildContext context){
    showDatePicker(
        context: context,
        initialDate:DateTime.utc(2018,2,8) , firstDate: DateTime(2018), lastDate: DateTime.now()).then((value){

      if(value == null){
        return;
      }
          setState(() {
            _selectedDate = value;
          });
    });
  }

  void _datePicker2(BuildContext context){
    showDatePicker(
        context: context,
        initialDate:DateTime.now() ,
        firstDate: DateTime(2018).subtract(new Duration(days: 30)),
        lastDate: DateTime.now().add(new Duration(days: 30))).then((value){

          if(value == null){
            return;
          }
          setState(() {
            _selectedDate =value;
          });
    });
  }


  void _datePicker3(BuildContext context){
    showDatePicker(
      context: context,
      initialDatePickerMode: DatePickerMode.year,
      initialDate: _selectedDate,
      firstDate: DateTime(2010),
        lastDate: DateTime.now()).then((value){

      if(value == null){
        return;
      }
      setState(() {
        _selectedDate =value;
      });
    });
  }


  ///
  /// ======================================================================

  DateTime _setDate = DateTime.now();
  Duration initialtimer = new Duration();
  int selectitem = 1;

  Widget datetimePicker() {
    return CupertinoDatePicker(
      initialDateTime: DateTime.now(),
      onDateTimeChanged: (DateTime newdate) {
        print(newdate);
        setState(() {
          dateTime = newdate.day.toString() +
              '/' +
              newdate.month.toString() +
              '/' +
              newdate.year.toString() +
              ' ' +
              newdate.hour.toString() +
              ' hrs ' +
              newdate.minute.toString() +
              ' mins';
        });
      },
      use24hFormat: true,
      maximumDate: new DateTime(2021, 12, 30),
      minimumYear: 2010,
      maximumYear: 2021,
      minuteInterval: 1,
      mode: CupertinoDatePickerMode.date,
    );
  }

  Widget timePicker() {
    return CupertinoTimerPicker(
      mode: CupertinoTimerPickerMode.hms,
      minuteInterval: 1,
      secondInterval: 1,
      initialTimerDuration: initialtimer,
      onTimerDurationChanged: (Duration changedtimer) {
        setState(() {
          initialtimer = changedtimer;
          time = changedtimer.inHours.toString() +
              ' hrs ' +
              (changedtimer.inMinutes % 60).toString() +
              ' mins ' +
              (changedtimer.inSeconds % 60).toString() +
              ' secs';
        });
      },
    );
  }

  Future<void> bottomSheet(BuildContext context, Widget child,
      {double height}) {
    return showModalBottomSheet(
        isScrollControlled: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(13), topRight: Radius.circular(13))),
        backgroundColor: Colors.white,
        context: context,
        builder: (context) => Container(
            height: height ?? MediaQuery.of(context).size.height / 3,
            child: child));
  }

  Widget button(String text, {Function onPressed, Color color}) {
    return Container(
      width: 200,
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 5),
      color: color ?? Colors.redAccent,
      child: MaterialButton(
          child: Text(
            '$text',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: onPressed),
    );
  }

  String time;
  String dateTime;

  //================================================================


  @override
  Widget build(BuildContext context) {
    var itemList = List.generate(50, (index) => "Flutter $index");
    var controller = ScrollController();
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(onPressed: (){
        controller.animateTo(0.0, duration: Duration(seconds: 1), curve: Curves.easeInOut);
      },),
      body: SingleChildScrollView(
        child: Column(
          children: [




            button(
              "Cupertino date Picker",
              onPressed: () {
                bottomSheet(context, datetimePicker());
              },
            ),
            dateTime == null ? Container() : Text('$dateTime'),
            button(
              "Cupertino Timer Picker",
              color: Colors.green,
              onPressed: () {
                bottomSheet(context, timePicker());
              },
            ),
            time == null ? Container() : Text('$time'),
            button(
              "Cupertino Picker",
              color: Colors.blueAccent,
              onPressed: () {
                Widget child = Scaffold(
                    appBar: AppBar(
                      title: Text(
                        "CupertinoPicker",
                        textAlign: TextAlign.justify,
                      ),
                      backgroundColor: Colors.teal,
                      actions: <Widget>[
                        IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {},
                        )
                      ],
                    ),
                    body: Container(
                      child: CupertinoPicker(
                        magnification: 1.2,
                        backgroundColor: Colors.black87,
                        children: <Widget>[
                          Text(
                            "TextWidget",
                            style:
                            TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          button(
                            'Button Widget',
                          ),
                          IconButton(
                            icon: Icon(Icons.home),
                            color: Colors.white,
                            iconSize: 40,
                            onPressed: () {},
                          )
                        ],
                        itemExtent: 80, //height of each item
                        looping: true,
                        onSelectedItemChanged: (int index) {
                          selectitem = index;
                        },
                      ),
                    ));
                bottomSheet(context, child,
                    height: MediaQuery.of(context).size.height / 2);
              },
            ),


            SizedBox(height: 10,),

            // InkWell(
            //   onTap: ()=>_datePicker(context),
            //     child: Text("${DateFormat.Hm(_selectedDate)}"??" ")),
            Container(child: RaisedButton(onPressed:()=>_datePicker(context),child: Column(children: [
              Text("${DateFormat('hh:mma').format(_selectedDate)}"??" "),
              Text("${DateFormat.y().format(_selectedDate)}"??" "),
              Text("${DateFormat.yMMMMEEEEd().format(_selectedDate)}"??" "),
              Text("${DateFormat.yMd().format(_selectedDate)}"??" "),




            ]))),

            Container(child: RaisedButton(onPressed: ()=>_datePicker2(context),child: Column(children: [
              Text("${DateFormat.yMMMd().format(_selectedDate)}"??" "),

            ]))),

            Container(child: RaisedButton(onPressed: ()=>_datePicker3(context),child: Column(children: [
              Text("${DateFormat.yMMMd().format(_selectedDate)}"??" "),
              Text("${DateFormat('hh:mma').format(_selectedDate)}"??" "),
              Text("${DateFormat.y().format(_selectedDate)}"??" "),
              Text("${DateFormat.yMMMMEEEEd().format(_selectedDate)}"??" "),
              Text("${DateFormat.yMd().format(_selectedDate)}"??" "),


            ]))),

            MaterialButton(
              child: Text(
                "Cupertino date Picker",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.redAccent,
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext builder) {
                      return Container(
                        height: MediaQuery.of(context).copyWith().size.height / 3,
                      );
                    });
              },
            ),

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
            Container(
              height: 300,
              child: ListView.separated(
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
            ),

            //
            Container(
              height: 300,
              child: Row(
                children: [
                  Expanded(child: ListView(
                    controller: controller,
                    children:itemList.map((item){
                      return ListTile(
                        leading: FlutterLogo(),
                        title: Text(item??" "),
                      );
                    }).toList(),
                  ))
                ],
              ),
            ),
          ],
        ),
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
