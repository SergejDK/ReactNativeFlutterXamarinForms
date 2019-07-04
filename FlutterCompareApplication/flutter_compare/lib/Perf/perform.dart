import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PerformancePage extends StatefulWidget {

  @override
  _PerformanceState createState() => _PerformanceState();
}

class _PerformanceState extends State<PerformancePage> {

  int _selectedIndex = 0;

  List<Widget> _widgetOptions() {
    return <Widget>[
    Column(
      children: <Widget>[
        RaisedButton(onPressed: () {}, child: Text('This is a raised Button'),),
      ],
    ),
    Column(
      children: <Widget>[
        CupertinoButton(child: Text('Cupertinobutton'), onPressed: () {},)
      ],
    ),
    Column(
      children: <Widget>[
        Text('Some of the Widgets are not covered in Cupertino / Material Design'),
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
            icon: Icon(Icons.image),
            title: Text('Image')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phonelink_setup),
            title: Text('Nativ')

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('List')
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}