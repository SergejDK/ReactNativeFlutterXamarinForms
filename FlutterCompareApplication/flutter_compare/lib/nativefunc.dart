import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import './takepicture.dart';

class NativeFuncPage extends StatefulWidget {

  @override
  _NativeFuncState createState() => _NativeFuncState();
}

class _NativeFuncState extends State<NativeFuncPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Native'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Take Picture'),
              onPressed: () async {
                Navigator.push(context,
                 MaterialPageRoute(builder: (context) => TakePictureScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}