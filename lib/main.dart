import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Calc'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _test = "";

  // not sure to make 2d array in dart
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
                margin: const EdgeInsets.symmetric(vertical: 25.0),
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
          new Expanded(
              flex: 1,
              child: new ListView(children: <Widget>[
                new Container(
                    // margin: const EdgeInsets.only(top: 20.0),
                    alignment: Alignment.centerLeft,
                    decoration: const BoxDecoration(
                      border: const Border(
                        bottom: const BorderSide(
                            width: 2.0, color: const Color(0xFF33000000)),
                      ),
                    ),
                    child: new Container(
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        child: new Text('$_test',
                            style: new TextStyle(fontSize: 15.0))))
              ])),
          this.getRow(keys1),
          this.getRow(keys2),
          this.getRow(keys3),
          this.getRow(keys4)
        ]));
  }
}
