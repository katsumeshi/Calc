import 'package:flutter/material.dart';

void main() => runApp(new CalcApp());

class CalcApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Calc',
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
  PageState createState() => new PageState();
}

class PageState extends State<MyHomePage> {
  String display = "";
  double val = 0.0;
  String currentOpe = "";
  String lastOpe = "";
  static const int kMaxLength = 10;

  // not sure to make 2d array in dart
  static List<String> keys1 = ['AC', '+/-', '%', '÷'];
  static List<String> keys2 = ['7', '8', '9', 'x'];
  static List<String> keys3 = ['4', '5', '6', '-'];
  static List<String> keys4 = ['1', '2', '3', '+'];
  static List<String> keys5 = ['0', '.', 'Del', '='];

  void handleInput(String input) {
    switch (input) {
      case 'AC':
        display = '';
        val = 0.0;
        currentOpe = '';
        lastOpe = '';
        break;
      case 'Del':
        if (display.length > 0)
          display = display.substring(0, display.length - 1);
        break;
      case 'x':
      case '-':
      case '+':
      case '÷':
        currentOpe = input;
        break;
      case '+/-':
        double a = double.parse(display) * -1;
        display = a.toString().replaceFirst(('.0'), '');
        break;
      case '=':
        calc(display, lastOpe);
        display = val.toString().replaceFirst(('.0'), '');
        val = 0.0;
        break;
      case '.':
        if (display.indexOf('.') == -1) {
          display += input;
        }
        break;
      default:
        if (currentOpe != '') {
          calc(display, currentOpe);
        }
        if (display.length < kMaxLength) {
          display += input;
        }
        break;
    }
    if (display.length >= kMaxLength) {
      display = display.substring(0, kMaxLength);
    }
    setState(() {
      display;
    });
  }

  void calc(strValue, strOperator) {
    if (val == 0.0) {
      val = double.parse(strValue);
    } else if (strOperator == '+') {
      val += double.parse(strValue);
    } else if (strOperator == 'x') {
      val *= double.parse(strValue);
    } else if (strOperator == '-') {
      val -= double.parse(strValue);
    } else if (strOperator == '÷') {
      val /= double.parse(strValue);
    }
    currentOpe = '';
    lastOpe = strOperator;
    display = '';
  }

  Row getRow(List<String> keys) {
    return new Row(
        children: keys.map((String input) {
      return new Expanded(
          child: new FlatButton(
              color: Colors.black.withOpacity(0.1),
              onPressed: () {
                this.handleInput(input);
              },
              child: new Container(
                margin: const EdgeInsets.symmetric(vertical: 37.5),
                child: new Text(input, style: new TextStyle(fontSize: 20.0)),
              )));
    }).toList());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new Column(children: <Widget>[
          new Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            new Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: new Text('$display', style: new TextStyle(fontSize: 53.0)),
            )
          ]),
          this.getRow(keys1),
          this.getRow(keys2),
          this.getRow(keys3),
          this.getRow(keys4),
          this.getRow(keys5)
        ]));
  }
}
