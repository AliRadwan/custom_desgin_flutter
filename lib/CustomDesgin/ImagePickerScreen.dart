
import 'dart:io';

import 'package:ali_flutter_desgin/Widgets/Pickers/PickedImage.dart';
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

  File _imageFile;
  void _pickedImage(File pickedImage){
    _imageFile = pickedImage;
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              PickedImage(),
              _image == null ?Text("Image Picker"):Image.file(_image),
              Container(
                height: 500,
                child: GridView.count(crossAxisCount: 3,
                children:List.generate(imgList.length, (index){
                  return AssetThumb(asset: imgList[index], width: 250, height: 250
                  );
                }),),
              )
            ],
          ),
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
