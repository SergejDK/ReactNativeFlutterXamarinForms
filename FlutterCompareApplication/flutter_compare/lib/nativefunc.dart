import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_saver/image_saver.dart';

class NativeFuncPage extends StatefulWidget {

  @override
  _NativeFuncState createState() => _NativeFuncState();
}

class _NativeFuncState extends State<NativeFuncPage> {

  File _image;
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    await ImageSaver.toFile(
          fileData: Uint8List.fromList(image.readAsBytesSync()));
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: RaisedButton(
                child: Text('Click me'),
                onPressed: getImage,
              ),
            ),
            Center(
             child: _image == null
              ? Semantics(
                child: Text('No image selected.'),
                label: 'Imagetext',
                hint: 'no action',
              )
              : Semantics(
                child: Image.file(_image),
                label: 'Current Image',
                hint: 'Your current picture',
              ), 
            ),
          ],
        ),
      ),
    );
  }
}
