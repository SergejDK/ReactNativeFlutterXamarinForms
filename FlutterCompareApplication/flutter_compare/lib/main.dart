import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './nativefunc.dart';
import 'LF/lfmain.dart';
import 'Perf/perform.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        secondaryHeaderColor: Colors.blue,

        primaryColor: Colors.lightBlue[800],
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedItemIndex = 0;

  List<Widget> pages = [
    Column(
          children: <Widget>[
            Text(
              'Das ist die Implementierung der Beispielappliaktion in Flutter.',
            ),
          ],
        ),
    NativeFuncPage(),
    LookFeelPage(),
    PerformancePage()
  ];

  void _onSelectItem(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
    Navigator.pop(context);
  }

  getAppBar() {
    if( _selectedItemIndex == 0 ) {
      return AppBar(
        title: Text('Start'),
      );
    } else if(_selectedItemIndex == 1) {
      return AppBar(
        title: Text('Native'),
      );
    } else if( _selectedItemIndex == 2) {
      return AppBar(
        title: Text('Look and Feel'),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      );
    } else if (_selectedItemIndex == 3) {
      return AppBar(
        title: Text('Performance'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: pages.elementAt(_selectedItemIndex),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: FlutterLogo()
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Start'),
              onTap: (){
                _onSelectItem(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.add_a_photo),
              title: Text('Native Funktionalitäten'),
              onTap: (){
                _onSelectItem(1);
              },
            ),
            ListTile(
              leading: Icon(Icons.devices),
              title: Text('Look and Feel'),
              onTap: (){
                _onSelectItem(2);
              },
            ),
            ListTile(
              leading: Icon(Icons.local_gas_station),
              title: Text('Performance'),
              onTap: (){
                _onSelectItem(3);
              },
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
