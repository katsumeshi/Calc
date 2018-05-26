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
  String display = '0';
  double total = 0.0;
  double val = 0.0;
  String currentOpe = '';
  String lastOpe = '';
  String lastInput = '';
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
        display = '0';
        val = 0.0;
        total = 0.0;
        currentOpe = '';
        lastOpe = '';
        lastInput = '';
        break;
      case 'Del':
        if (display.length > 0)
          display = display.substring(0, display.length - 1);
        break;
      case '%':
        if (display.length > 0) {
          double value = double.parse(display) / 100;
          display = value.toString().replaceFirst((new RegExp(r'.0$')), '');
        }
        break;
      case 'x':
      case '-':
      case '+':
      case '÷':
        currentOpe = input;
        if (preventMultipleOperatorInput()) break;
        if (lastOpe == '') {
          total = double.parse(display);
          lastOpe = input;
        } else {
          val = double.parse(display);
          calc(currentOpe);
          display = total.toString().replaceFirst(('.0'), '');
        }
        break;
      case '+/-':
        if (display == '0') break;
        double value = double.parse(display) * -1;
        display = value.toString().replaceFirst(('.0'), '');
        break;
      case '=':
        if (preventMultipleOperatorInput() || currentOpe == '') break;
        val = double.parse(display);
        calc(currentOpe);
        display = total.toString().replaceFirst(('.0'), '');
        break;
      case '.':
        if (display.indexOf('.') == -1) {
          display += input;
        }
        break;
      default:
        if (lastInput.contains(new RegExp(r'[-\+÷x]'))) {
          display = '';
        }
        if (display.length < kMaxLength) {
          if (display == '0') display = '';
          display += input;
        }
        break;
    }
    if (display.length >= kMaxLength) {
      display = display.substring(0, kMaxLength);
    }
    lastInput = input;
    setState(() {
      display;
    });
  }

  bool preventMultipleOperatorInput() {
    return lastInput.contains(new RegExp(r'[-\+÷x]'));
  }

  void calc(strOperator) {
    if (strOperator == '+') {
      total += val;
    } else if (strOperator == 'x') {
      total *= val;
    } else if (strOperator == '-') {
      total -= val;
    } else if (strOperator == '÷') {
      total /= val;
    }
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
