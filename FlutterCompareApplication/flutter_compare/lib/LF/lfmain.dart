import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LookFeelPage extends StatefulWidget {

  @override
  _LookFeelState createState() => _LookFeelState();
}

class _LookFeelState extends State<LookFeelPage> {
  int _selectedIndex = 0;
  bool checkBoxValue = false;
  bool mdSwitch = false;
  double mdSlider = 50.0;
  bool cSwitch = false;
  double cSlider = 50.0;

  List<Widget> _widgetOptions() {
    return <Widget>[
    Column(
      // Material Design
      children: <Widget>[
        RaisedButton(onPressed: () {}, child: Text('This is a raised Button'),),
        TextField(key: Key('tfKey'),),
        Checkbox(
          onChanged: (bool value) {
              setState(() {
                checkBoxValue = value;
              });
          }, value: checkBoxValue,),
        Switch(onChanged: (bool value) { setState(() {
                mdSwitch = value;
              }); }, value: mdSwitch,),
        Slider(onChanged: (double value) { setState(() {
                mdSlider = value;
              }); }, value: mdSlider, min: 0.0, max: 100.0,)
      ],
    ),
    Column(
      // Cupertino
      children: <Widget>[
        CupertinoButton(child: Text('Cupertinobutton'), onPressed: () {},),
        CupertinoSwitch(onChanged: (bool value) { setState(() {
                cSwitch = value;
              });}, value: cSwitch,),
        CupertinoTextField(placeholder: 'CupertinoTextField',),
        CupertinoSegmentedControl(children: {'T': Text('Part 1'), 'T2': Text('Part 2'), 'T3': Text('Part 3') }, onValueChanged: (value) {},),
        CupertinoSlider(onChanged: (double value) { setState(() {
                cSlider = value;
              }); }, value: cSlider, min: 0.0, max: 100.0,)
      ],
    ),
    Column(
      //Standard
      children: <Widget>[
        Text('Some of the Widgets are not covered in Cupertino / Material Design'),
        Image.network('https://www.w3schools.com/w3css/img_lights.jpg'),
        Text('Many of those are just MD or Cupertino - Image and Texts are the only Basics and layout definitions')
      ],
    ),
  ];
  } 


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions().elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.android),
            title: Text('Material Design')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_iphone),
            title: Text('Cupertino Design')

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            title: Text('Standard Design')
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}