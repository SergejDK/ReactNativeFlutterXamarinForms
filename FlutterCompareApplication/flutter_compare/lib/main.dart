import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compare/barrierefreiheit.dart';
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
            //Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/FH_Dortmund-logo.svg/1200px-FH_Dortmund-logo.svg.png'),
            Text(
              'Vergleich von Mobile App Frameworks zur Cross-Platform Entwicklung',
            ),
          ],
        ),
    NativeFuncPage(),
    LookFeelPage(),
    PerformancePage(),
    BFPage(),
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
        title: Text('Native Funktionalität'),
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
    } else if (_selectedItemIndex == 4) {
      return AppBar(
        title: Text('Barrierefreiheit'),
        backgroundColor: Colors.orange,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: pages.elementAt(_selectedItemIndex),
      drawer: Drawer(
        key: Key('drawerKey'),
        child: ListView(
          key: Key('drawerList'),
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
              title: Text('Native Funktionalität'),
              onTap: (){
                _onSelectItem(1);
              },
            ),
            ListTile(
              key: Key('LFDrawer'),
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
            ),
            ListTile(
              leading: Icon(Icons.warning),
              title: Text('Barrierefreiheit'),
              onTap: (){
                _onSelectItem(4);
              },
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
