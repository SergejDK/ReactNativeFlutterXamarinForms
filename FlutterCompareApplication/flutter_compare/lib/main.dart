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
            Image.network('data:image/png;base64,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'),
            Text(
              'Vergleich von Mobile App Frameworks zur Cross-Platform Entwicklung',
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
              title: Text('Native Funktionalität'),
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
