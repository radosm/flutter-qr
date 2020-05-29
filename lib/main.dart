import 'package:flutter/material.dart';
import 'dart:html' as html; // importing the HTML proxying library and named it as html
import 'dart:js' as js; // importing the Javascript proxying library and named it as js

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter for Web Demo - Part 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Give it a route that load when app is running
      home: MyHomePage(
        title: MyHomePage.homeTitle,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  static String homeTitle = 'Home Page';
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _mensaje;
  

  @override
  void initState(){
    _mensaje='sin título todavía';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    html.window.onMessage.listen( (e) => setState(() {_mensaje=e.data;}));
    return Scaffold( 
      appBar: AppBar(
        title: Text(_mensaje),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.greenAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('*** Presione la camara para escanear ***'),
            Text('El código escaneado aparecerá en el título ...'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        onPressed: (){
          js.context.callMethod("scan");
        },
      ),
    );
  }
}