// import 'package:flutter/material.dart';
//
//
// class GridView  extends StatelessWidget {
//   Widget item({Color color,String text}){
//     return Container(
//       padding: EdgeInsets.all(15),
//       child: Text(text),
//       decoration: BoxDecoration(
//           gradient: LinearGradient(
//               colors: [
//                 color.withOpacity(0.7),
//                 color
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight
//           ),
//           borderRadius: BorderRadius.circular(15)
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Container(
//       child: GridView(
//         children: [item(color: Colors.blue,text: "sdjnsdjn")],
//           gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//         mainAxisSpacing: 20,
//         childAspectRatio: 3/2,
//         maxCrossAxisExtent: 200,
//         crossAxisSpacing: 20
//       ))
//     ),);
//   }
// }
