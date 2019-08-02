import 'package:flutter/material.dart';

class BFPage extends StatefulWidget {

  @override
  _BF createState() => _BF();
}

class _BF extends State<BFPage> {

  double size = 14;


  changeTarget(String c) {
    
    if (c == '-') {
      setState(() {
        size = size - 1;
      });
    } else {
      setState(() {
        size = size + 1;
      });
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Semantics(
            //button: true,
            child: RaisedButton(onPressed: () => {}, child: 
              Semantics(
                child: Text('Button BF Text'),
                hint: 'Ein Hilfetext für die Barrierefreiheit des Buttons',
                label: 'Barrierefreiheit Button',
              )
            ,),
          ),
          Semantics(
            child: Text('Label BF Text'),
            hint: 'Ein Hilfetext für die Barrierefreiheit des Textes',
            label: 'Barrierefreiheit Label',
          ),
          RaisedButton(onPressed: () {
            changeTarget('+');
          }, child: Text('Größer'),),
          RaisedButton(onPressed: () {
            changeTarget('-');
          }, child: Text('Kleiner'),),
          Text('Skalier mich', style: new TextStyle(fontSize: size),)
        ],
      ),
      backgroundColor: Colors.lightBlue,
    );
  }
}
