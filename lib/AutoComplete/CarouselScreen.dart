import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselScreen extends StatefulWidget {
  @override
  _CarouselScreenState createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  List img = [
    "https://www.allenpress.com/wp-content/uploads/sites/7/2018/12/POST-USPS-RATE-INCREASE-GRAPHIC.jpg",
    "https://www.fluxmagazine.com/wp-content/uploads/2020/03/Mailing-Web-1.jpg",
    "https://blog.travelpayouts.com/en/wp-content/uploads/sites/2/2018/09/email-list.jpg",
    "https://blog.mailrelay.com/wp-content/uploads/2016/12/mailing.png",
  ];

  int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: customCarousel(),
    );
  }

  ListView customCarousel() {
    return ListView(
      children: [
        CarouselSlider(
            items: img.map((imgUrl) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Image.network(imgUrl),
              );
            }).toList(),
            options: CarouselOptions(
                height: 170, initialPage: 0, enlargeCenterPage: true,autoPlay: true,autoPlayInterval: Duration(seconds: 1),enableInfiniteScroll: true,pauseAutoPlayOnTouch: false,reverse: true,onPageChanged: (index,_){
                  setState(() {
                    currentIndex=index;
                  });
            })),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildDots(0),
              buildDots(1),
              buildDots(2),
              buildDots(3),

        ]),
        SizedBox(height: 20,),
        CarouselSlider.builder(
            itemCount: img.length,
            itemBuilder: (_, int index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Image.network(img[index]),
              );
            },
            options: CarouselOptions(height: 170, initialPage: 0,enlargeCenterPage: true,autoPlay: true,autoPlayInterval: Duration(seconds: 2),enableInfiniteScroll: true,scrollDirection: Axis.vertical))
      ],
    );
  }

  Container buildDots(index){
    return Container(margin:EdgeInsets.all(2),width: 10,height: 10,decoration: BoxDecoration(shape: BoxShape.circle,color:currentIndex==index?Colors.deepOrange:Colors.blueGrey ),);

  }
}
