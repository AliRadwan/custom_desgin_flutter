import 'package:flutter/material.dart';

class Data {
  final String title;
  final String description;
  final String imageUrl;
  final IconData iconDate;

  Data(this.title, this.description, this.imageUrl, this.iconDate);
}

class MyPageView extends StatefulWidget {
  @override
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  final List<Data> myData = [
    Data("title1", "description1", "imageUrl", Icons.ac_unit),
    Data("title2", "description2", "imageUrl", Icons.ac_unit),
    Data("title3", "description3", "imageUrl", Icons.ac_unit),
    Data("title4", "description4", "imageUrl", Icons.ac_unit),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            PageView(
              children: myData
                  .map((item) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(image: ExactAssetImage(item.imageUrl),fit: BoxFit.cover)
                        ),child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(item.title),
                  SizedBox(height: 10,),
                  Text(item.description,textAlign: TextAlign.center,)
                ],
              ),
                      ))
                  .toList(),
            ),
            Align(
              alignment: Alignment(0,0.9),
                child: Container(
                  width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: RaisedButton(padding: EdgeInsets.all(7),onPressed: null,child: Text("GET STARTED"),)))
          ],
        ),
      ),
    );
  }
}
