import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class PerformancePage extends StatefulWidget {

  @override
  _PerformanceState createState() => _PerformanceState();
}

class _PerformanceState extends State<PerformancePage> {

  int _selectedIndex = 0;
  Text geoText = Text('Currently no position');
  final List<String> _listing = <String>[];
  
  getNetworkImage() {
    return Image.network('https://www.w3schools.com/w3css/img_lights.jpg');
  }

  getBWImage() {
    return Image.network('https://www.w3schools.com/w3css/img_lights.jpg', color: Colors.grey, colorBlendMode: BlendMode.hue,);
  }

  getTextPosition() async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      geoText = Text(position.toString());
    });
  }

  generate() {
    List<String> l = List<String>();
    for(int i = 0; i < 20; i++) {
      l.add(i.toString());
    }
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
        getNetworkImage(),
        getBWImage(),
      ],
    ),
    Column(
      children: <Widget>[
        geoText
      ],
    ),
    buildList(),
  ];
  } 


  void _onItemTapped(int index) async {
    if(index == 1) {
      await getTextPosition();
    }
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