import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class PickedImage extends StatefulWidget {

  final void Function(File pickedImage) pickFile;

   PickedImage({ this.pickFile});

  @override
  _PickedImageState createState() => _PickedImageState();
}

class _PickedImageState extends State<PickedImage> {

  File _pickedImage;
  final picker =ImagePicker();

  Future getImage (ImageSource src) async {
    final pickedFile = await picker.getImage(source: src);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
      widget.pickFile(_pickedImage);
    } else {
      print("No Image Selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.green,
          backgroundImage: _pickedImage != null?FileImage(_pickedImage):null,
        ),
        SizedBox(height: 10,),
        IconButton(icon: Icon(Icons.image), onPressed:(){
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
                      Navigator.of(context).pop();
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
        } ),
      ],
    );
  }
}
