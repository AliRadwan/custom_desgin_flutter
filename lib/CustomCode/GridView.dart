import 'package:flutter/material.dart';


List <String> myList=[
  "https://www.allenpress.com/wp-content/uploads/sites/7/2018/12/POST-USPS-RATE-INCREASE-GRAPHIC.jpg",
  "https://www.fluxmagazine.com/wp-content/uploads/2020/03/Mailing-Web-1.jpg",
  "https://blog.travelpayouts.com/en/wp-content/uploads/sites/2/2018/09/email-list.jpg",
  "https://www.fluxmagazine.com/wp-content/uploads/2020/03/Mailing-Web-1.jpg",
  "https://blog.travelpayouts.com/en/wp-content/uploads/sites/2/2018/09/email-list.jpg",
  "https://blog.mailrelay.com/wp-content/uploads/2016/12/mailing.png",];

class GridViewScreen  extends StatelessWidget {
  Widget item({Color color,String text}){
    return Container(
      padding: EdgeInsets.all(15),
      child: Text(text),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                color.withOpacity(0.7),
                color
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(15)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
      child: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisSpacing: 10,
        childAspectRatio: 3/2,
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 10,),
        children:myList.map((item)=>Card(
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 6,
          margin: EdgeInsets.all(10),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight:Radius.circular(15)),
                child: Image.network(  "https://blog.travelpayouts.com/en/wp-content/uploads/sites/2/2018/09/email-list.jpg",),
              ),
              Positioned(bottom: 10,right: 10,child: Container(width: 180,color: Colors.black12,margin: EdgeInsets.only(left: 100,top: 20),child: Text("Hi"),),)
            ],
          ),
        )).toList()

      )
    ),);
  }
}

//          item(color: Colors.blue,text: "sdjnsdjn")