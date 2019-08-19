import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/foundation.dart';

class PerformancePage extends StatefulWidget {

  @override
  _PerformanceState createState() => _PerformanceState();
}

class GenerateClass {
  
  String wl = '';

  generate() {
    List<String> l = List<String>();
    for(int i = 0; i < 20; i++) {
      l.add(i.toString());
    }
    return l;
  }

}

class _PerformanceState extends State<PerformancePage> {

  int _selectedIndex = 0;
  Text geoText = Text('Currently no position');
  final List<String> _listing = <String>[];

  getTextPosition() async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      geoText = Text(position.toString());
    });
  }

  generate() {
    var t = GenerateClass();
    var l = t.generate();
    return l;
  }

  buildList() {
    return ListView.builder(
      itemBuilder: (BuildContext _context, int i) {
        if(i.isOdd) {
          return Divider();
        }

        final int index = i ~/ 2;
        if(index >= _listing.length) {
          _listing.addAll(generate());
        }
        return ListTile(
          title: Text(_listing[index]),
        );
      },
    );
  }

  List<Widget> _widgetOptions() {
    return <Widget>[
    Column(
      children: <Widget>[
        geoText,
        RaisedButton(onPressed: () async => {await getTextPosition()}, child: Text('Get Location'),)
      ],
    ),
    Column(
      children: <Widget>[
        Expanded(
          child: buildList(),
        ) 
      ],
    ),
  ];
  } 


  void _onItemTapped(int index) async {
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