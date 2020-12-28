import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class ImagePickerScreen extends StatefulWidget {
  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {

  File _image;
  final picker =ImagePicker();
  List<Asset> imgList  = List<Asset>();

  Future getImage (ImageSource src) async{
    final pickedFile = await picker.getImage(source: src);
    setState(() {
      if(pickedFile != null){
        _image = File(pickedFile.path);
      }else{
        print("No Image Selected");
      }
    });
  }

  Future loadAssets()async{
    try{
      await MultiImagePicker.pickImages(maxImages:300,
       selectedAssets: imgList,
        enableCamera: true,
        materialOptions: MaterialOptions(
          actionBarColor: "green",
          selectCircleStrokeColor: "black"
        )
      );
    }catch(e){}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(onPressed: (){
            loadAssets();
          }, child: Text("Pick image"))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _image == null ?Text("Image Picker"):Image.file(_image),
            GridView.count(crossAxisCount: 3,
            children:List.generate(imgList.length, (index){
              return AssetThumb(asset: imgList[index], width: 300, height: 300
              );
            }),)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.image),
        onPressed: (){
          var ad = AlertDialog(
            title: Text(" Choose Image"),
            content: Container(
              height: 150,
              child: Column(children: [
                Divider(),
                Container(
                  width: 300,
                  color: Colors.deepPurple,
                  child: ListTile(
                    title: Text("Gallery"),
                     leading: Icon(Icons.image),
                    onTap: (){
                      getImage(ImageSource.gallery);
                      // Navigator.of(context).pop();
                    },
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: 300,
                  color: Colors.deepPurple,
                  child: ListTile(
                    title: Text("Camera"),
                    leading: Icon(Icons.camera),
                    onTap: (){
                      getImage(ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                  ),
                ),

              ],),
            ),
          );
          showDialog(context: context,child: ad);
        },
      ),
    );
  }
}
