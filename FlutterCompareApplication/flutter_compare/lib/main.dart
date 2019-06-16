import 'package:flutter/material.dart';
import './nativefunc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        "/native": (BuildContext context) => NativeFuncPage(),
        "/start": (BuildContext context) => MyHomePage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Start'),
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Das ist die Implementierung der Beispielappliaktion in Flutter.',
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Image.network(
                'https://assets.t3n.sc/news/wp-content/uploads/2018/02/flutter-ui-framework-google.jpg?auto=format&h=348&ixlib=php-2.3.0&w=620'
              )
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Start'),
              onTap: () {
                //Navigator.of(context).maybePop();
                Navigator.of(context).pushNamed("/start");
              },
            ),
            ListTile(
              leading: Icon(Icons.add_a_photo),
              title: Text('Native Funktionalitäten'),
              onTap: (){
                //Navigator.of(context).maybePop();
                Navigator.of(context).pushNamed("/native");
              },
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
