import 'dart:io';
import 'dart:math';

import 'package:ali_flutter_desgin/CustomCode/GridView.dart';
import 'package:ali_flutter_desgin/CustomCode/Testfile.dart';
import 'package:ali_flutter_desgin/CustomCode/test1.dart';
import 'package:ali_flutter_desgin/CustomDesgin/CustomAnimationScreen.dart';
import 'package:ali_flutter_desgin/CustomDesgin/FadeInImage.dart';
import 'package:ali_flutter_desgin/CustomDesgin/TimerScreen.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:like_button/like_button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;
import 'package:slide_popup_dialog/slide_dialog.dart';
import 'AnimationAppBar.dart';
import 'GridViewScreen.dart';
import 'InteractiveScreen.dart';
import 'ListViewSnapSheetExample.dart';
import 'OpenPDF.dart';
import 'OpenWebUrl.dart';
import 'ShowConfirmDialog.dart';
import 'Timeline/PackageDeliveryTrackingPage.dart';
import 'Timeline/TimelineScreen.dart';
import 'Timeline/TimelineStatusPage.dart';
import 'TransformScreen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marquee/marquee.dart';
import 'dart:math' as math; // import this
import 'AnimatedAlignWidget.dart';
import '../CustomCode/CustomRadioButton.dart';
import '../DarkTheme/MyDrawer.dart';
import 'Dismissible.dart';
import 'ImagePickerScreen.dart';
import 'ListWheelScreen.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../AutoComplete/AutoComplete.dart';
import '../AutoComplete/CarouselScreen.dart';
import '../Provider/ProviderCounterScreen.dart';
import '../CustomCode/ShowDialog.dart';
import 'modal_bottom_sheet.dart';

class MyDesignScreen extends StatefulWidget {


  @override
  _MyDesignScreenState createState() => _MyDesignScreenState();
}

const  items={'ali','Ali','ahmed','alaa'};
// const  items={'ali','ali','ahmed','alaa'};

class _MyDesignScreenState extends State<MyDesignScreen> {
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  String _selectedLetter;
  List _letterList = ['a', 'b', 'c', 'd', 'e'];
  double _fontSize = 30;
  Color _color = Colors.red;
  bool isCheck;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text("app"),
        gradient: LinearGradient(colors: [Colors.red, Colors.purple]),

      ),
      drawer: MyDrawer(),
      body: SafeArea(
        top: true,
        bottom: true,
        // left: true,
        // right: true,
        minimum: EdgeInsets.all(0.0),
        maintainBottomViewPadding: true,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.blue,
                  Colors.blueAccent,
                  Colors.blue,
                ])),
              ),
              title: const Text("title"),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

                    SentMessage(message: "Hello this is cool"),
                    ReceivedMessage(message: "Hi this is awesome chat bubble"),
                    SentMessage(message: "How are you"),
                    ReceivedMessage(message: "I am great how are you doing. It while when we talked."),
                    SentMessage(message: "Now is good day to try something new and work on it. Stick to the plan"),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
                child: ExpansionTileCard(
                  baseColor: Colors.cyan[50],
                  expandedColor: Colors.red[50],
                  key: cardA,
                  leading: CircleAvatar(
                      child: Image.asset("assets/images/devs.jpg")),
                  title: Text("Flutter Dev's"),
                  subtitle: Text("FLUTTER DEVELOPMENT COMPANY"),
                  children: <Widget>[
                    Divider(
                      thickness: 1.0,
                      height: 1.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Text(
                          "FlutterDevs specializes in creating cost-effective and efficient applications with our perfectly crafted,"
                              " creative and leading-edge flutter app development solutions for customers all around the globe.",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceAround,
                      buttonHeight: 52.0,
                      buttonMinWidth: 90.0,
                      children: <Widget>[
                        FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0)),
                          onPressed: () {
                            cardA.currentState?.expand();
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.arrow_downward),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Text('Open'),
                            ],
                          ),
                        ),
                        FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0)),
                          onPressed: () {
                            cardA.currentState?.collapse();
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.arrow_upward),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Text('Close'),
                            ],
                          ),
                        ),
                        FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0)),
                          onPressed: () {
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.swap_vert),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Text('Toggle'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
                    RaisedButton(
                      child: Text("TimelineScreent"),
                      onPressed: () {
                        Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: TimelineScreen()));

                      },
                    ),
                    RaisedButton(
                      child: Text("TimelineStatusPage"),
                      onPressed: () {
                        Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: TimelineStatusPage()));

                      },
                    ),
                    RaisedButton(
                      child: Text("PackageDeliveryTrackingPage"),
                      onPressed: () {
                        Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: PackageDeliveryTrackingPage()));

                      },
                    ),

                    DefaultTextStyle(style: TextStyle(fontSize: 12,color: Colors.cyan), child: Column(
                      children: [
                        Chip(label:Text("Hi there"),),
                        Text("Hi there"*5),
                        Chip(label:Text('\$${444}'),),
        ],
                    )),
                    AnimatedDefaultTextStyle(
                        duration: Duration(milliseconds: 500),
                        style: TextStyle(fontSize: _fontSize,color: _color), child: Column(
                      children: [
                        Text("Hi there"),
                        Text("Hi there"),

                      ],
                    )),
                    Container(
                      width: 300,
                      height: 200,
                      margin: const EdgeInsets.only(top: 24, bottom: 16),
                      decoration: ShapeDecoration(shape: InvertedBorder(radius: 32), color: Colors.brown),
                    ),

                    ClipPath(
                      clipBehavior: Clip.hardEdge,
                      clipper: ShapeBorderClipper(
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                  topLeft: Radius.circular(20.0)))),
                      child: Container(
                        width: 350,
                        color: Colors.pink,
                        height: 200,
                        child: Container(),
                      ),
                    ),

                    SizedBox(
                      height: 70,child: Card(
                      child: Marquee(
                        text: " This is text for test",
                        blankSpace: 20,scrollAxis: Axis.horizontal,crossAxisAlignment: CrossAxisAlignment.start,
                        // pauseAfterRound: Duration(seconds: 1),
                        accelerationDuration: Duration(milliseconds: 50),
                      ),
                    ),
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      height: 70,child: Card(
                      child: Marquee(
                        text: " This is text for test",
                        blankSpace: 50,scrollAxis: Axis.vertical,crossAxisAlignment: CrossAxisAlignment.start,
                        // pauseAfterRound: Duration(seconds: 3),
                        accelerationDuration: Duration(milliseconds: 50),
                      ),
                    ),
                    ),
                    Placeholder(
                      strokeWidth: 3.0,
                      color: Colors.pink,
                      fallbackHeight: 20,
                      fallbackWidth: 300,
                    ),
                    AnimatedAlign(
                        alignment: Alignment.centerRight,
                        curve: Curves.easeInBack,
                        heightFactor: 2.0,
                        widthFactor: 1.0,
                        duration: Duration(seconds: 3),
                        child: Text("Animated Text  ")),
                    AnimatedAlign(
                        alignment: Alignment.centerRight,
                        curve: Curves.bounceInOut,
                        heightFactor: 2.0,
                        widthFactor: 1.0,
                        duration: Duration(seconds: 3),
                        child: FlatButton(
                          child: Text("Animated Button"),
                          onPressed: null,
                        )),
                    Placeholder(
                      strokeWidth: 3.0,
                      color: Colors.pink,
                      fallbackHeight: 20,
                      fallbackWidth: 300,
                    ),

                    InkWell(child: Hero(tag: 'img',child: FlutterLogo(size: 40,),),onTap: (){

                      Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: MyFadeInImage()));
                    },),


                    // Checkbox(value: isCheck,onChanged: (value){
                    //   setState((){
                    //     isCheck = ! isCheck;
                    //   });
                    // },),


                    PhysicalModel(
                      elevation: 6.0,
                      shape: BoxShape.circle,
                      shadowColor: Colors.red,
                      color: Colors.black,
                      borderRadius: BorderRadius.all
                        (Radius.circular(10)),
                      child: Container(
                        height: 120.0,
                        width: 120.0,
                      ),
                    ),

                    InkWell(
                      onTap: () {

                        // Show confirm dialog when clicked on widget
                        showConfirmDialog(
                          context,
                          "Delete Service",
                          "Do you want to delete service?",
                          "Delete",
                          "Cancel",
                              () {
                            // do stuff when clicked on delete
                          },
                        );
                      },
                      child: Row(
                        children: [
                          Icon(FeatherIcons.delete, color: Colors.black, size: 70),
                          Text("Delete"),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Physical Model Widget in circle Box Shape',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            PhysicalModel(
                              elevation: 6.0,
                              shape: BoxShape.circle,
                              shadowColor: Colors.red,
                              color: Colors.black,
                              borderRadius: BorderRadius.all
                                (Radius.circular(10)),
                              child: Container(
                                height: 120.0,
                                width: 120.0,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Physical Model Widget in rectangle Box Shape',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            PhysicalModel(
                              elevation: 6.0,
                              shape: BoxShape.rectangle,
                              shadowColor: Colors.red,
                              color: Colors.white,
                              borderRadius: BorderRadius.all
                                (Radius.circular(10)),
                              child: Container(
                                height: 120.0,
                                width: 120.0,
                                color: Colors.blue[50],
                                child: FlutterLogo(
                                  size: 60,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ClipPath(
                      clipper: TriangleClipper(),
                      child: Container(
                        color: Colors.blueGrey,
                        height: 200,
                        width: 300,
                      ),
                    ),

                    ClipPath(
                      clipBehavior: Clip.hardEdge,
                      clipper: ShapeBorderClipper(
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(100.0),
                                  bottomRight: Radius.circular(100.0),
                                  topRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(0.0)))),
                      child: Container(
                        width: double.infinity,
                        color: Colors.orange,
                        height: 200,
                        child: Container(),
                      ),
                    ),

                    RaisedButton(
                      child: Text("modal_bottom_sheet"),
                      onPressed: () {
                        Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: MyBottomSheet()));

                      },
                    ),

                    RaisedButton(
                      child: Text("AnimationAppBar"),
                      onPressed: () {
                        Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: AnimationAppBar()));

                      },
                    ),


                    RaisedButton(
                      child: Text("MySnappingSheet"),
                      onPressed: () {
                        Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: ListViewSnapSheetExample()));

                      },
                    ),


                    RaisedButton(
                      child: Text("CustomAnimationScreen"),
                      onPressed: () {
                        Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: CustomAnimationScreen()));

                      },
                    ),
                    RaisedButton(
                      child: Text("ImagePickerScreen"),
                      onPressed: () {
                        Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: ImagePickerScreen()));
                        },
                    ),
                    RaisedButton(
                      child: Text("TimerScreen"),
                      onPressed: () {
                        Navigator.push(context, PageTransition(type: PageTransitionType.topToBottom, child: TimerScreen()));
                        },
                    ),
                    RaisedButton(
                      child: Text("OpenPDF "),
                      onPressed: () {
                        Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: OpenPDF()));
                        },
                    ),

                    RaisedButton(
                      child: Text("InteractiveScreen"),
                      onPressed: () {
                        Navigator.push(context, PageTransition(type: PageTransitionType.scale, alignment: Alignment.bottomCenter, child: InteractiveScreen()));
                        },
                    ),
                    RaisedButton(
                      child: Text("ListWheelScreen"),
                      onPressed: () {
                        Navigator.push(context, PageTransition(type: PageTransitionType.size, alignment: Alignment.bottomCenter, child: ListWheelScreen()));
                        },
                    ),
                    RaisedButton(
                      child: Text("DismissibleScreen"),
                      onPressed: () {
                        Navigator.push(context, PageTransition(type: PageTransitionType.rotate, duration: Duration(milliseconds: 1000), child: DismissibleScreen()));
                      },
                    ),

                    RaisedButton(
                      child: Text("AnimatedAlignWidget"),
                      onPressed: () {
                        Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftWithFade, child: AnimatedAlignWidget()));
                        },
                    ),

                    RaisedButton(
                      child: Text("OpenWebUrl"),
                      onPressed: () {
                        Navigator.push(context, PageTransition(type: PageTransitionType.leftToRightWithFade, child: OpenWebUrl()));
                        },
                    ),

                    Center(
                      child: LikeButton(
                        likeCount: 800,
                      ),
                    ),
                    Center(
                      child: LikeButton(
                        size: 25,
                        likeBuilder: (bool isLike){
                          return Icon(
                            Icons.add,size: 30,
                            color: isLike?Colors.deepOrange:Colors.amber,
                          );
                        },

                        onTap: onLikeButtonTapped,
                        bubblesColor: BubblesColor(
                          dotPrimaryColor: Colors.cyan,
                          dotSecondaryColor: Colors.brown,
                        ),
                        circleColor: CircleColor(
                          start: Colors.deepPurple,end: Colors.cyan
                        ),
                      ),
                    ),
                    RaisedButton(
                      child: Text("slide popup"),
                      onPressed: () {
                        slideDialog.showSlideDialog(
                          context: context,
                          child: Text("Hello")
                        );
                      },
                    ),

                    Placeholder(
                      strokeWidth: 3.0,
                      color: Colors.pink,
                      fallbackHeight: 60,
                      fallbackWidth: 300,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              // shape: BoxShape.circle, // if you want circle, default is rectangle
                              gradient: LinearGradient(
                                  colors: [Colors.pink, Colors.lightBlueAccent,Colors.red],
                                  begin: Alignment.bottomLeft,
                                  stops: [0.2,0.5,0.7],
                                  end: Alignment.topRight),
// adds border around the container
                              border: Border.all(
                                color: Colors.lightGreenAccent,
                                width: 6.0,
                                style: BorderStyle.solid,
                              ),
// adds rounded curve around the corners
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
// adds shadow behind the container
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 15.0,
                                  spreadRadius: 3.0,
                                  offset: Offset(10.0, 10.0),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              height: 100,
                              width: 100,
                              decoration: ShapeDecoration(
                                color: Colors.pink,
                                shape: CircleBorder(
                                  // shape is required
                                  side: BorderSide(
                                    color: Colors.blueAccent,
                                    width: 6.0,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                shadows: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 15.0,
                                    spreadRadius: 3.0,
                                    offset: Offset(10.0, 10.0),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: 100,
                              width: 100,
                              decoration: ShapeDecoration(
                                color: Colors.pink,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  side: BorderSide(
                                    color: Colors.blueAccent,
                                    width: 6.0,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                shadows: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 15.0,
                                    spreadRadius: 3.0,
                                    offset: Offset(10.0, 10.0),
                                  ),
                                ],
                              )),
                          Container(
                              height: 100,
                              width: 100,
                              decoration: ShapeDecoration(
                                color: Colors.pink,
                                shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  side: BorderSide(
                                    color: Colors.blueAccent,
                                    width: 6.0,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                shadows: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 15.0,
                                    spreadRadius: 3.0,
                                    offset: Offset(10.0, 10.0),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 100,
                          width: 100,
                          decoration: ShapeDecoration(
                            color: Colors.pink,
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              side: BorderSide(
                                color: Colors.blueAccent,
                                width: 6.0,
                                style: BorderStyle.solid,
                              ),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 15.0,
                                spreadRadius: 3.0,
                                offset: Offset(10.0, 10.0),
                              ),
                            ],
                          )),
                    ),
                    Placeholder(
                      strokeWidth: 3.0,
                      color: Colors.pink,
                      fallbackHeight: 60,
                      fallbackWidth: 300,
                    ),
                    Stack(
                      overflow: Overflow.visible,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10.0,
                                spreadRadius: 3.0,
                                offset: Offset(10.0, 10.0),
                              ),
                            ],
                          ),
                          alignment: Alignment.centerRight,
                          width: 300,
                          height: 300,
                          child: RotatedBox(
                            quarterTurns: 1,
                            child: Text(
                              'Container 1',
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10.0,
                                spreadRadius: 3.0,
                                offset: Offset(10.0, 10.0),
                              ),
                            ],
                          ),
                          alignment: Alignment.centerRight,
                          width: 300,
                          height: 300,
                          child: RotatedBox(
                            quarterTurns: 1,
                            child: Marquee(
                              text: "Container",
                              blankSpace: 20,scrollAxis: Axis.horizontal,crossAxisAlignment: CrossAxisAlignment.start,
                              // pauseAfterRound: Duration(seconds: 1),
                              accelerationDuration: Duration(milliseconds: 50),
                            ),
                          ),
                        ),
                        Positioned(
                          left: -15,
                          top: -15,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 15.0,
                                  spreadRadius: 3.0,
                                  offset: Offset(10.0, 10.0),
                                ),
                              ],
                            ),
                            alignment: Alignment.bottomCenter,
                            width: 250,
                            height: 250,
                            child: Marquee(
                              text: "Container 2",
                              blankSpace: 20,scrollAxis: Axis.horizontal,crossAxisAlignment: CrossAxisAlignment.end,
                              // pauseAfterRound: Duration(seconds: 1),
                              accelerationDuration: Duration(milliseconds: 50),
                            ),
                          ),
                        ),
                        Positioned(
                          top: -50,
                          right: 30,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 10.0,
                                  spreadRadius: 2.0,
                                  offset: Offset(5.0, 5.0),
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            width: 200,
                            height: 200,
                            child: Marquee(
                              text: " Container",
                              blankSpace: 20,scrollAxis: Axis.vertical,crossAxisAlignment: CrossAxisAlignment.center,
                              // pauseAfterRound: Duration(seconds: 1),
                              accelerationDuration: Duration(milliseconds: 50),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 30,
                    ),
                    Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 5.0),
                        ),
                        child: OverflowBox(
                            maxHeight: 300,
                            maxWidth: 300,
                            minHeight: 50,
                            minWidth: 50,
                            alignment: Alignment.center,
                            child: SizedBox(
                                height: 275,
                                width: 0,
                                child: RaisedButton(
                                  onPressed: () {},
                                  color: Colors.amber,
                                  child: Center(
                                    child: Wrap(
                                      alignment: WrapAlignment.center,
                                      direction: Axis.vertical,
                                      //stack individual text widgets on top of each other
                                      children: _arrayOfText(),
                                    ),
                                  ),
                                )))),
                    Divider(
                      height: 70,
                    ),
                    Container(
                      color: Colors.brown,
                      child: SizedOverflowBox(
                        size: Size(50, 100),
                        alignment: Alignment.center,
                        child: RaisedButton(
                          onPressed: () {},
                          color: Colors.amber,
                          child: Text(
                            'Raised Button',
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                      ),
                    ),
                    Placeholder(
                      strokeWidth: 3.0,
                      color: Colors.pink,
                      fallbackHeight: 60,
                      fallbackWidth: 300,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          color: Colors.lightBlueAccent,
                          height: 200,
                          width: 200,
                          child: RotatedBox(
                              quarterTurns: 1,
                              child: Text(
                                'Rotated by a quarter',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.pink),
                              )),
                        ),
                        Container(
                          alignment: Alignment.center,
                          color: Colors.pinkAccent,
                          height: 200,
                          width: 200,
                          child: RotatedBox(
                              quarterTurns: 2,
                              child: Text(
                                'Rotated by 2 quarter',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              )),
                        ),
                        Container(
                          alignment: Alignment.center,
                          color: Colors.limeAccent,
                          height: 200,
                          width: 200,
                          child: RotatedBox(
                              quarterTurns: 3,
                              child: Text(
                                'Rotated by 3 quarter',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.blueAccent),
                              )),
                        ),
                      ],
                    ),
                    Placeholder(
                      strokeWidth: 3.0,
                      color: Colors.pink,
                      fallbackHeight: 60,
                      fallbackWidth: 300,
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.deepPurple, shape: BoxShape.rectangle),
                      position: DecorationPosition.background,
                      child: Text("DecoratedBox"),
                    ),
                    Placeholder(
                      strokeWidth: 3.0,
                      color: Colors.pink,
                      fallbackHeight: 60,
                      fallbackWidth: 300,
                    ),
                    Container(
                      transform: Matrix4.rotationZ(0.2),
                      child: TextButton.icon(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MyGridScreen()));
                          },
                          icon: Icon(Icons.ad_units),
                          label: Text(" GridView Screen ")),
                    ),
                    Placeholder(
                      strokeWidth: 3.0,
                      color: Colors.pink,
                      fallbackHeight: 60,
                      fallbackWidth: 300,
                    ),
                    RaisedButton(
                      child: Text("Transform Screen"),
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => TransformScreen()));
                      },
                    ),
                    Text('Selected Letter'),
                    DropdownButton(
                        value: _selectedLetter,
                        items: _letterList.map((item) {
                          return DropdownMenuItem(
                            child: Text(item),
                            value: item,
                          );
                        }).toList(),
                        onChanged: (newVAl) {
                          setState(() {
                            _selectedLetter = newVAl;
                          });
                        }),
                    ExpansionTile(
                      title: Text(" Account"),
                      leading: Icon(Icons.account_box_outlined),
                      children: [
                        Divider(),
                        Card(
                          child: ListTile(
                            leading: Icon(Icons.account_box),
                            trailing: Icon(Icons.access_alarm_outlined),
                            title: Text("SginIN"),
                            subtitle: Text("Where you can "),
                            onTap: () {},
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: Icon(Icons.account_box),
                            trailing: Icon(Icons.access_alarm_outlined),
                            title: Text("SginIN"),
                            subtitle: Text("Where you can "),
                            onTap: () {},
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Card(
                          child: ListTile(
                            leading: Icon(Icons.account_box),
                            trailing: Icon(Icons.access_alarm_outlined),
                            title: Text("SginIN"),
                            subtitle: Text("Where you can "),
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    RaisedButton(
                      child: Text("FutureScreen"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProviderCounterScreen()));
                      },
                    ),
                    RaisedButton(
                      child: Text("CounterScreen"),
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>ProviderCounterScreen()));
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => ProviderCounterScreen()));
                      },
                    ),
                    RaisedButton(
                      child: Text("CustomRadioButton"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CustomRadioButton()));
                      },
                    ),
                    RaisedButton(
                      child: Text("Show Carousel"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CarouselScreen()));
                      },
                    ),
                    RaisedButton(
                        child: Text("show FlushBar"),
                        onPressed: () {
                          Flushbar(
                                  duration: Duration(seconds: 2),
                                  icon: Icon(
                                    Icons.info,
                                    color: Colors.red,
                                  ),
                                  backgroundColor: Colors.blueGrey,
                                  mainButton: FlatButton(
                                      child: Text("button"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      }),
                                  messageText: Text("this is message"),
                                  title: "This is message")
                              .show(context);
                        }),
                    const SelectableText(
                      "sdnkjsdnk lksdnlndlns lknsdlkndlnds lmlmdslmd ",
                      showCursor: true,
                      cursorWidth: 10,
                      toolbarOptions:
                          ToolbarOptions(copy: true, selectAll: true),
                    ),

                    /// Text Overflow
                    ///  TextOverflow.clip= الحاله الافتراضيه وهيه قص النص علي حج الكونتينر
                    ///  TextOverflow.ellipsis = يقطع النص ويترك ثلاث نقاط دليل علي التكلمه
                    ///  TextOverflow.fade = يتلاشا النص تدريجيا
                    ///  TextOverflow.visible = اظهار النص كامل بغض النظر علي حجم الكونتينر المحتوي له

                    const Text(
                      "lsalanlsn  alsknnalnxl lanslnalsn lanslnalns ",
                      overflow: TextOverflow.visible,
                    ),
                    RaisedButton(
                      child: Text("Show SnackBar"),
                      onPressed: () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShowDialog()))
                            .then((value) => print(value));
                      },
                    ),

                    RaisedButton(
                      child: Text("ShowDialog"),
                      onPressed: () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShowDialog()))
                            .then((value) => print(value));
                      },
                    ),

                    RaisedButton(
                      child: Text("GridScreen"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GridViewScreen()));
                      },
                    ),

                    RaisedButton(
                      child: Text("TestFile()"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TestFile()));
                      },
                    ),

                    RaisedButton(
                      child: Text("Auto Search"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AutoCompleteDemo()));
                      },
                    ),

                    // Text Show shadow
                    const Text("login",
                        style: TextStyle(
                            color: Colors.deepOrangeAccent,
                            fontSize: 20,
                            shadows: <Shadow>[
                              Shadow(
                                  offset: Offset(10.0, 10.0),
                                  color: Colors.deepPurple,
                                  blurRadius: 5),
                              Shadow(
                                  offset: Offset(10.0, 10.0),
                                  color: Colors.blueAccent,
                                  blurRadius: 5)
                            ])),

                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    const Text.rich(
                      const TextSpan(text: "It is ", children: <TextSpan>[
                        const TextSpan(
                            text: "playerName's ",
                            style: TextStyle(
                              color: Colors.redAccent,
                              // <- override the color
                              fontSize: 100,
                              // <- override the font size
                              fontWeight: FontWeight
                                  .bold, // <- override the font weight
                            )),
                        const TextSpan(text: "turn to serve.")
                      ]),
                      style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 30,
                          fontFamily: 'Roboto',
                          color: Colors.indigo),
                    ),
                    Center(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        direction: Axis.vertical,
                        //stack individual text widgets on top of each other
                        children: _arrayOfText(),
                      ),
                    ),
                    TextPage()
                  ],
                ),
              ),
            ]))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Random r = Random();
          setState(() {
            _fontSize = r.nextInt(50).toDouble();
            _color = Color.fromRGBO(r.nextInt(256), r.nextInt(256), r.nextInt(256), 1);
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  String myText = "0123456789";

  List<Text> _arrayOfText() {
    // split our text into individual text widgets
    return myText
        .split("")
        .map((letter) => Text(
              letter,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 40,
                  color: Colors.blueAccent),
            ))
        .toList();
  }

  File image;

  Future getImage(ImageSource src) async {
    final pickFile = await ImagePicker().getImage(source: src);

    if (pickFile != null) {
      image = File(pickFile.path);
      print("Image Selected");
    } else {
      print("NO Image Selected");
    }
  }


  Future<bool> onLikeButtonTapped(bool isLiked) async => !isLiked;


//****************************************************************************************

// String desc=" ";
//   var description = desc.length>=20?desc.replaceRange(20, desc.length, "...")

//****************************************************************************************
// String desc;
// List<MyData> myList;

// var firstItem = myList.firstWhere((element) => element.description == desc,orElse: ()=>null);

}
// class MyData {
//   final String description;
//   MyData(this.description);
// }
//****************************************************************************************


//New class
class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width / 2, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}

//New class
class InvertedBorder extends ShapeBorder {
  final double radius;
  final double pathWidth;

  InvertedBorder({@required this.radius, this.pathWidth = 3});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return Path()
      ..fillType = PathFillType.evenOdd
      ..addPath(getOuterPath(rect, textDirection: textDirection), Offset.zero);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) => _createPath(rect);

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  @override
  ShapeBorder scale(double t) => InvertedBorder(radius: radius);

  Path _createPath(Rect rect) {
    final innerRadius = radius + pathWidth;
    final innerRect = Rect.fromLTRB(rect.left + pathWidth, rect.top + pathWidth, rect.right - pathWidth, rect.bottom - pathWidth);

    final outer = Path.combine(PathOperation.difference, Path()..addRect(rect), _createBevels(rect, radius));
    final inner = Path.combine(PathOperation.difference, Path()..addRect(innerRect), _createBevels(rect, innerRadius));
    return Path.combine(PathOperation.difference, outer, inner);
  }

  Path _createBevels(Rect rect, double radius) {
    return Path()
      ..addOval(Rect.fromCircle(center: Offset(rect.left, rect.top), radius: radius))
      ..addOval(Rect.fromCircle(center: Offset(rect.left + rect.width, rect.top), radius: radius))
      ..addOval(Rect.fromCircle(center: Offset(rect.left, rect.top + rect.height), radius: radius))
      ..addOval(Rect.fromCircle(center: Offset(rect.left + rect.width, rect.top + rect.height), radius: radius));
  }
}


class SentMessage extends StatelessWidget {
  final String message;

  const SentMessage({
    Key key,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageTextGroup = Flexible(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                ),
                child: Text(
                  message,
                  style: TextStyle(color: Colors.white,
                      fontFamily: 'Monstserrat',
                      fontSize: 14),
                ),
              ),
            ),
            CustomPaint(painter: Triangle(Colors.grey[900])),
          ],
        ));

    return Padding(
      padding: EdgeInsets.only(right: 18.0, left: 50, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SizedBox(height: 30),
          messageTextGroup,
        ],
      ),
    );
  }
}

class ReceivedMessage extends StatelessWidget {
  final String message;

  const ReceivedMessage({
    Key key,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageTextGroup = Flexible(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: CustomPaint(
                painter: Triangle(Colors.grey[300]),
              ),
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                ),
                child: Text(
                  message,
                  style: TextStyle(color: Colors.black,
                      fontFamily: 'Monstserrat',
                      fontSize: 14),
                ),
              ),
            ),
          ],
        ));

    return Padding(
      padding: EdgeInsets.only(right: 50.0, left: 18, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SizedBox(height: 30),
          messageTextGroup,
        ],
      ),
    );
  }
}

class Triangle extends CustomPainter {
  final Color bgColor;

  Triangle(this.bgColor);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = bgColor;

    var path = Path();
    path.lineTo(-5, 0);
    path.lineTo(0, 10);
    path.lineTo(5, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
