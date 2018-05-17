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
  String _test = "0";
  double val1 = 0.0;
  double val2 = 0.0;
  String ope = "";

  // not sure to make 2d array in dart
  static List<String> keys1 = ['AC', '+/-', '%', '÷'];
  static List<String> keys2 = ['7', '8', '9', 'x'];
  static List<String> keys3 = ['4', '5', '6', '-'];
  static List<String> keys4 = ['1', '2', '3', '+'];
  static List<String> keys5 = ['0', '.', 'Del', '='];

  void _incrementCounter(String str) {
    setState(() {
      switch (str) {
        case 'AC':
          _test = '';
          val1 = 0.0;
          ope = '';
          break;
        case 'Del':
          if (_test.length > 0) _test = _test.substring(0, _test.length - 1);
          break;
        case 'x':
        case '-':
        case '+':
        case '÷':
          calc(_test, str);
          break;
        case '=':
          calc(_test, ope);
          _test = val1.toString().replaceFirst(('.0'), '');
          val1 = 0.0;
          break;
        default:
          _test += str;
      }
    });
  }

  void calc(strValue, strOperator) {
    if (val1 == 0.0) {
      val1 = double.parse(strValue);
    } else if (strOperator == '+') {
      val1 += double.parse(strValue);
    } else if (strOperator == 'x') {
      val1 *= double.parse(strValue);
    } else if (strOperator == '-') {
      val1 -= double.parse(strValue);
    } else if (strOperator == '÷') {
      val1 /= double.parse(strValue);
    }
    ope = strOperator;
    _test = '';
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
          new Row(children: <Widget>[
            new Container(
              margin: const EdgeInsets.symmetric(vertical: 60.0),
              child: new Text('$_test',
                  textAlign: TextAlign.right,
                  style: new TextStyle(fontSize: 40.0)),
            ),
          ]),
          this.getRow(keys1),
          this.getRow(keys2),
          this.getRow(keys3),
          this.getRow(keys4),
          this.getRow(keys5)
        ]));
  }
}

// import 'package:flutter/material.dart';

// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Flutter Demo',
//       theme: new ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: new MyHomePage(title: 'Calc'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   String _test = "";
//   int _last = 0;

//   // not sure to make 2d array in dart
//   static List<String> keys1 = ['AC', '+/-', '%', '÷'];
//   static List<String> keys2 = ['7', '8', '9', 'x'];
//   static List<String> keys3 = ['4', '5', '6', '-'];
//   static List<String> keys4 = ['1', '2', '3', '+'];
//   static List<String> keys5 = ['0', '.', '=', ''];
//   // Map<String, double> values = {'+': 0.0, '-': 0.0, 'x': 0.0, '/': 0.0};
//   String values = '';

//   void _incrementCounter(String number) {
//     setState(() {
//       // _test += number;

//       if (number == 'c') {
//         _test = '';
//         _last = 0;
//         values = '';

//         // values.forEach((key, value) => values[key] = 0.0);
//         // values = [];
//         return;
//       }

//       // if (number == '+') {
//       //   calc(number);
//       //
//       // }

//       // if (_test.subs.contains(new RegExp(r'[\+\-\x\/=]'))) {

//       // }
//       // _test = '';
//       // print(values.length);

//       values += number;
//       _test += number;
//       print(values);
//       if (values.indexOf(new RegExp(r'[0-9]+[\x]+[0-9]+')) > -1) {
//         int a = values.indexOf(new RegExp(r'[0-9]+[\x]'));
//         print(a);
//         int b = values.indexOf(new RegExp(r'[\x][0-9]+'));
//         print(b);
//         return;
//       }

//       print('adfkajslkffffff');
//       // int a = values.indexOf('x');
//       // String d = values.substring(a);
//       // int g = d.indexOf(new RegExp(r'[^0-9]'));
//       // print(a);
//       // print(g);
//       // if ()

//       // List<String> vs = values.split(new RegExp(r'[\+\-]+'));
//       // List<String> vs2 = values.split(new RegExp(r'[0-9]*'));

//       // if (vs.length > ) {
//       //   for (int i = 0; i < vs2.length; i++) {
//       //     if (vs2[i] == 'x') {
//       //       int v1 = int.parse(vs[i - 1]);
//       //       int v2 = int.parse(vs[i + 1]);
//       //       print(v1 * v2);
//       //     }
//       //   }
//       // }
//       // vs2.forEach((value) {
//       //   if (value != '') {
//       //     if (value == 'x') {
//       //     }
//       //   }
//       // }}

//       print(values);
//       // print(vs2);

//       // int sum = 0
//       // List<String> vs2 = values.split(new RegExp(r"[\+]"));
//       // List<String> vs = values.split(new RegExp(r"[x]"));
//       // vs.forEach((value) {
//       //   print(value);
//       //   if (value.indexOf(new RegExp(r'^[0-9]+$')) >= 0) {
//       //     int v = int.parse(value);
//       //     if (sum == 0)
//       //       sum = v;
//       //     else
//       //       sum *= v;
//       //   }
//       // });
//       // print(sum);
//       // values.forEach((v) => _test += v);
//       // print(_test);
//       if (number.contains(new RegExp(r'[\+\-\x\/=]'))) {
//         // calc(number);
//         // if (number == '=') {
//         //   // print(_test.substring(_last + 1));
//         //   double sum = 0.0;
//         //   values.forEach((key, value) => sum += value);
//         //   print('value:' + values['x'].toString());
//         //   print(sum);
//         //   _test = _test + sum.toString().replaceFirst(('.0'), '');
//         // }

//         // print('------------------');
//         // _last = _test.lastIndexOf(number) + 1;
//         // print(_last);
//       }
//     });
//   }

//   // void calc(operater) {
//   //   // double value = double.parse(_test.substring(_last, _test.length - 1));

//   //   switch (operater) {
//   //     case '+':
//   //       values[operater] += value;

//   //       break;
//   //     case '-':
//   //       values[operater] -= value;
//   //       break;
//   //     case 'x':
//   //       if (values[operater] == 0.0)
//   //         values[operater] = value;
//   //       else
//   //         values[operater] *= value;
//   //       break;
//   //     case '/':
//   //       if (values[operater] == 0.0)
//   //         values[operater] = value;
//   //       else
//   //         values[operater] /= value;

//   //       break;
//   //     case '=':
//   //       // print(_test);
//   //       calc(_test.substring(_last - 1, _last));
//   //       break;
//   //     default:
//   //       print("can't find operator");
//   //       break;
//   //   }
//   // }

//   Row getRow(List<String> keys) {
//     return new Row(
//         children: keys.map((String number) {
//       return new Expanded(
//           child: new FlatButton(
//               color: Colors.black.withOpacity(0.1),
//               onPressed: () {
//                 this._incrementCounter(number);
//               },
//               child: new Container(
//                 margin: const EdgeInsets.symmetric(vertical: 30.0),
//                 child: new Text(number, style: new TextStyle(fontSize: 20.0)),
//               )));
//     }).toList());
//   }

//   // new Expanded(
//   //     flex: 1,
//   //     child: new ListView(children: <Widget>[
//   //       new Container(
//   //           // margin: const EdgeInsets.only(top: 20.0),
//   //           alignment: Alignment.centerLeft,
//   //           decoration: const BoxDecoration(
//   //             border: const Border(
//   //               bottom: const BorderSide(
//   //                   width: 2.0, color: const Color(0xFF33000000)),
//   //             ),
//   //           ),
//   //           child: new Container(
//   //               margin: const EdgeInsets.symmetric(vertical: 10.0),
//   //               child: new Text('$_test',
//   //                   style: new TextStyle(fontSize: 15.0))))
//   //     ])),

//   @override
//   Widget build(BuildContext context) {
//     Expanded result = new Expanded(flex: 1, child: new Text('$_test'));
//     // values.add('');

//     return new Scaffold(
//         appBar: new AppBar(
//           title: new Text(widget.title),
//         ),
//         body: new Column(children: <Widget>[
//           new Row(children: <Widget>[
//             new Container(
//               margin: const EdgeInsets.symmetric(vertical: 70.0),
//               child: new Text("aieufa", style: new TextStyle(fontSize: 20.0)),
//             ),
//           ]),
//           this.getRow(keys1),
//           this.getRow(keys2),
//           this.getRow(keys3),
//           this.getRow(keys4),
//           this.getRow(keys5)
//         ]));
//   }
// }
