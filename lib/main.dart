import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Calc'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _test = "";

  // tricky to make 2d array in dart
  static List<String> keys1 = ['7', '8', '9', '/'];
  static List<String> keys2 = ['4', '5', '6', 'x'];
  static List<String> keys3 = ['1', '2', '3', '-'];
  static List<String> keys4 = ['0', '.', '+/-', '='];

  void _incrementCounter(String number) {
    setState(() {
      _test += number;
    });
  }

  Row getRow(List<String> keys) {
    return new Row(
        children: keys.map((String number) {
      return new Expanded(
          child: new FlatButton(
              color: Colors.black.withOpacity(0.1),
              onPressed: () {
                this._incrementCounter(number);
              },
              child: new Container(
                margin: const EdgeInsets.symmetric(vertical: 30.0),
                child: new Text(number, style: new TextStyle(fontSize: 20.0)),
              )));
    }).toList());
  }

  @override
  Widget build(BuildContext context) {
    Expanded result = new Expanded(flex: 1, child: new Text('$_test'));

    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new Column(children: <Widget>[
          result,
          this.getRow(keys1),
          this.getRow(keys2),
          this.getRow(keys3),
          this.getRow(keys4)
        ]));
  }
}
