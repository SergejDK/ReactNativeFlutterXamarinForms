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
    Stopwatch stopwatch = new Stopwatch()..start();
    List<String> l = List<String>();
    for(int i = 0; i < 20; i++) {
      l.add(i.toString());
    }
    stopwatch.toString();
    wl = stopwatch.elapsed.toString();    
    return l;
  }

}

class _PerformanceState extends State<PerformancePage> {

  int _selectedIndex = 0;
  Text geoText = Text('Currently no position');
  String watcherNormalImage = '';
  String watcherGrayScaleImage = '';
  String watcherGeoLocation = '';
  String watcherList = '';
  final List<String> _listing = <String>[];
  
  getNetworkImage() {
    Stopwatch stopwatch = new Stopwatch()..start();
    Image img = Image.network('https://www.w3schools.com/w3css/img_lights.jpg');
    stopwatch.stop();
    watcherNormalImage = stopwatch.elapsed.toString();
    return img;
  }

  getBWImage() {
    Stopwatch stopwatch = new Stopwatch()..start();
    Image img = Image.network('https://www.w3schools.com/w3css/img_lights.jpg', color: Colors.grey, colorBlendMode: BlendMode.hue,);
    stopwatch.stop();
    watcherGrayScaleImage = stopwatch.elapsed.toString();
    return img;
  }

  getTextPosition() async {
    Stopwatch stopwatch = new Stopwatch()..start();
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    stopwatch.stop();
    watcherGeoLocation = stopwatch.elapsed.toString();
    setState(() {
      geoText = Text(position.toString());
    });
  }

  generate() {
    var t = GenerateClass();
    var l = t.generate();
    watcherList += ' || ' + t.wl;
    debugPrint('WATCH: $watcherList');
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
        Text(watcherNormalImage),
        getNetworkImage(),
        Text(watcherGrayScaleImage),
        getBWImage(),
      ],
    ),
    Column(
      children: <Widget>[
        geoText,
        Text(watcherGeoLocation),
        RaisedButton(onPressed: () async => {await getTextPosition()}, child: Text('Get Location'),)
      ],
    ),
    Column(
      children: <Widget>[
        Text(watcherList),
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