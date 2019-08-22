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
        RaisedButton(onPressed: () {}, child: Text('Button'),),
        TextField(key: Key('tfKey'),   obscureText: true,
          decoration: InputDecoration(
            labelText: 'Placeholder',
          ),),
        Slider(onChanged: (double value) { setState(() {
                mdSlider = value;
              }); }, value: mdSlider, min: 0.0, max: 100.0,),
        Switch(onChanged: (bool value) { setState(() {
                mdSwitch = value;
              }); }, value: mdSwitch,),
        LinearProgressIndicator(value: .25,)
      ],
    ),
    Column(
      // Cupertino
      children: <Widget>[
        CupertinoButton(child: Text('Button'), onPressed: () {},),
        CupertinoTextField(placeholder: 'Placeholder',),
        CupertinoSlider(onChanged: (double value) { setState(() {
                cSlider = value;
              }); }, value: cSlider, min: 0.0, max: 100.0,),
        CupertinoSwitch(onChanged: (bool value) { setState(() {
                cSwitch = value;
              });}, value: cSwitch,),
        LinearProgressIndicator(value: .25,)
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

          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}