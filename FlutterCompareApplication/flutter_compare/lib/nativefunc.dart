import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NativeFuncPage extends StatefulWidget {

  @override
  _NativeFuncState createState() => _NativeFuncState();
}

class _NativeFuncState extends State<NativeFuncPage> {

  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
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
      floatingActionButton: Semantics(
        child: FloatingActionButton(
            onPressed: getImage,
            tooltip: 'Pick Image',
            child: Semantics(
              child: Icon(Icons.add_a_photo),
              button: true,
              hint: 'Click for taking picture',
              label: 'Pick image',
            ), 
        ), 
      )
    );
  }
}