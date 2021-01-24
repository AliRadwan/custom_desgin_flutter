import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pdf_flutter/pdf_flutter.dart';

class OpenPDF extends StatefulWidget {
  @override
  _OpenPDFState createState() => _OpenPDFState();
}

class _OpenPDFState extends State<OpenPDF> {


  bool _isLoading = true;

  // PDFDocument document;

  File localFile;


  int selectedIndex ;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    // loadDocument();
  }
  //
  // loadDocument() async {
  //   document = await PDFDocument.fromAsset('assets/sample.pdf');
  //
  //   setState(() => _isLoading = false);
  // }
  //
  // changePDF(value) async {
  //   setState(() => _isLoading = true);
  //   if (value == 1) {
  //
  //     // Load from file
  //     PDFDocument doc = await PDFDocument.fromFile(localFile);
  //
  //     // document = await PDFDocument.fromAsset('assets/sample2.pdf');
  //   } else if (value == 2) {
  //     document = await PDFDocument.fromURL(
  //         "http://conorlastowka.com/book/CitationNeededBook-Sample.pdf");
  //   } else {
  //     document = await PDFDocument.fromAsset('assets/sample.pdf');
  //   }
  //   setState(() => _isLoading = false);
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(
      //   child: Column(
      //     children: <Widget>[
      //       SizedBox(height: 36),
      //       ListTile(
      //         title: Text('Load from Assets'),
      //         onTap: () {
      //           changePDF(1);
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Load from URL'),
      //         onTap: () {
      //           changePDF(2);
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Restore default'),
      //         onTap: () {
      //           changePDF(3);
      //         },
      //       ),
      //
      //
      //
      //       SizedBox(height: 40,),
      //
      //
      //
      //     ],
      //   ),
      // ),
      appBar: AppBar(
        title: const Text('FlutterPluginPDFViewer'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
                    // _isLoading
                    //       ? Center(child: CircularProgressIndicator())
                    //       : PDFViewer(document: document),

            SizedBox(height: 40,),

            IndexedStack(
              index: selectedIndex,
              children: <Widget>[
                Column(children: <Widget>[
                  Text("PDF.assets(assetname)"),
                  PDF.assets(
                    "assets/demo.pdf",
                    height:  MediaQuery.of(context).size.height,
                    width:  MediaQuery.of(context).size.width,
                    placeHolder: Image.asset("assets/images/pdf.png",
                        height: 200, width: 100),
                  )
                ]),
                Column(
                  children: <Widget>[
                    Text("PDF.network(url)"),
                    PDF.network(
                      'https://google-developer-training.github.io/android-developer-fundamentals-course-concepts/en/android-developer-fundamentals-course-concepts-en.pdf',
                      height:  MediaQuery.of(context).size.height,

                      width: MediaQuery.of(context).size.width,
                      placeHolder: Image.asset("assets/images/pdf.png",
                          height: 200, width: 100),
                    ),
                  ],
                ),
                localFile != null
                    ? Column(
                  children: <Widget>[
                    Text("PDF.file(fileName)"),
                    PDF.file(
                      localFile,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      placeHolder: Image.asset("assets/images/pdf.png",
                          height: 200, width: 100),
                    ),
                  ],
                )
                    : InkWell(
                  onTap: () async {
                    File file = await FilePicker.getFile(
                        allowedExtensions: ['pdf'],
                        type: FileType.custom);
                    setState(() {
                      localFile = file;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Select PDF from device",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 45, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(

          currentIndex: 0,

          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blue,

          onTap: onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              title: Text("Assets",style: TextStyle(color:  selectedIndex ==0 ? Colors.blue : Colors.grey,),),
              icon: Icon(Icons.book,color:  selectedIndex ==0 ? Colors.blue : Colors.grey, ),

              backgroundColor: Colors.grey,
            ),
            BottomNavigationBarItem(
                title: Text("Network",style: TextStyle(color:  selectedIndex ==1 ? Colors.blue : Colors.grey),),
                icon: Icon(Icons.book,color: selectedIndex ==1 ? Colors.blue : Colors.grey
                )),
            BottomNavigationBarItem(title: Text("Device",style: TextStyle(color:  selectedIndex ==2 ? Colors.blue : Colors.grey),), icon: Icon(Icons.book,color:  selectedIndex ==2 ? Colors.blue : Colors.grey,)),
          ]),


    );
  }
}
