import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:frontend/autoestima/AutoPage.dart';

class AutoCuestiPage extends StatefulWidget {
  @override
  _AutoCuestiPageState createState() => _AutoCuestiPageState();
}

class _AutoCuestiPageState extends State<AutoCuestiPage> {
  int _currentIndex = 0;
  double _currentSliderValue = 1;
  String _flag = "";

  String q1 = "";
  String q2 = "";
  String q3 = "";
  String q4 = "";
  String q5 = "";
  String q6 = "";
  String q7 = "";
  String q8 = "";
  String q9 = "";
  String q10 = "";

  List<Map<dynamic, dynamic>> answers = [];

  final ques1Controller = TextEditingController();
  final ques2Controller = TextEditingController();
  final ques3Controller = TextEditingController();
  final ques4Controller = TextEditingController();
  final ques5Controller = TextEditingController();
  final ques6Controller = TextEditingController();
  final ques7Controller = TextEditingController();
  final ques8Controller = TextEditingController();
  final ques9Controller = TextEditingController();
  final ques10Controller = TextEditingController();

  final Map<int, dynamic> _answer = {};

  void initState() {
    _getCuesAuto();
  }

  void _getCuesAuto() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String token = prefs.getString('token');
    print('Que peces, $token');

    var headers = {
      'Authorization': 'TOKEN 2d1ae508ec333f6efdd5beb291b1f9f45d2829bd',
    };
    var request = http.MultipartRequest(
        'GET', Uri.parse('https://megap115.herokuapp.com/retos/preguntas/'));
    request.fields.addAll({'titulo': 'Autoestima'});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    final respStr = await response.stream.bytesToString();

    print('---- status code: ${response.statusCode}');
    print('---- info: ${respStr}');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Map<String, dynamic> map = json.decode(respStr);
      setState(() {
        q1 = map["p1"];
        q2 = map["p2"];
        q3 = map["p3"];
        q4 = map["p4"];
        q5 = map["p5"];
        q6 = map["p6"];
        q7 = map["p7"];
        q8 = map["p8"];
        q9 = map["p9"];
        q10 = map["p10"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text("QUIZ AUTOESTIMA"),
          elevation: 0,
          backgroundColor: Colors.tealAccent[700],
        ),
        body: Stack(
          children: <Widget>[
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.tealAccent[700],
                ),
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white70,
                      child: Text("${_currentIndex + 1}"),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Text(
                          (_currentIndex + 1) == 1
                              ? "$q1"
                              : (_currentIndex + 1) == 2
                                  ? "$q2"
                                  : (_currentIndex + 1) == 3
                                      ? "$q3"
                                      : (_currentIndex + 1) == 4
                                          ? "$q4"
                                          : (_currentIndex + 1) == 5
                                              ? "$q5"
                                              : (_currentIndex + 1) == 6
                                                  ? "$q6"
                                                  : (_currentIndex + 1) == 7
                                                      ? "$q7"
                                                      : (_currentIndex + 1) == 8
                                                          ? "$q8"
                                                          : (_currentIndex +
                                                                      1) ==
                                                                  9
                                                              ? "$q9"
                                                              : (_currentIndex +
                                                                          1) ==
                                                                      10
                                                                  ? "$q10"
                                                                  : "Error",
                          style: TextStyle(
                              height: 1.5,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                SizedBox(height: 50.0),
                Card(
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Slider(
                      activeColor: Colors.tealAccent[700],
                      inactiveColor: Colors.tealAccent[100],
                      value: _currentSliderValue,
                      min: 1,
                      max: 4,
                      divisions: 3,
                      label: _currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                        });
                      },
                    ),
                    Text(
                        (_currentSliderValue) == 1
                            ? "1: Muy de acuerdo"
                            : (_currentSliderValue) == 2
                                ? "2: De acuerdo"
                                : (_currentSliderValue) == 3
                                    ? "3: En desacuerdo"
                                    : (_currentSliderValue) == 4
                                        ? "4: Muy en desacuerdo"
                                        : "Error",
                        style: TextStyle(
                            height: 1.5,
                            fontSize: 14,
                            fontWeight: FontWeight.normal))
                  ]),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: RaisedButton(
                      padding: MediaQuery.of(context).size.width > 800
                          ? const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 64.0)
                          : null,
                      child: Text(
                        _currentIndex == (10 - 1)
                            ? "Enviar respuestas"
                            : "Siguiente",
                        style: MediaQuery.of(context).size.width > 800
                            ? TextStyle(fontSize: 30.0)
                            : null,
                      ),
                      onPressed: _nextSubmit,
                    ),
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }

  void _nextSubmit() {
    Map<dynamic, dynamic> myCurttentAnsw = {
      'r${_currentIndex + 1}': _currentSliderValue.toInt()
    };
    print(myCurttentAnsw);
    if (_currentIndex < 9) {
      setState(() {
        _currentIndex++;
        _flag = "q$_currentIndex";
        answers.add(myCurttentAnsw);
      });
      //putAnswers(myCurttentAnsw);
    } else {
      print(jsonEncode(answers));
      putAnswers(answers);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AutoPage()));
    }
  }

  Future<bool> _onWillPop() async {
    return showDialog<bool>(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Text(
                "¿Seguro que deseas salir? Todo tu progreso se perderá si te retiras del quiz."),
            title: Text("Warning!"),
            actions: <Widget>[
              FlatButton(
                child: Text("Sí"),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
              FlatButton(
                child: Text("No"),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
            ],
          );
        });
  }

  putAnswers(answs) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String token = prefs.getString('token');

    print('Que peces, $token');
    final request = await http.put(
      'https://megap115.herokuapp.com/retos/auto_estima_realizado/',
      headers: {
        'Authorization': 'TOKEN $token',
      },
      body: jsonEncode(answs),
    );
    if (request.statusCode == 200) {
      print(request.body);
    }
    return token;
  }

  getAnswers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String token = prefs.getString('token');

    print('Que peces, $token');
    final request = await http.get(
        'https://megap115.herokuapp.com/retos/auto_estima_realizado/',
        headers: {
          'Authorization': 'TOKEN $token',
        });
    if (request.statusCode == 200) {
      print(request.body);
    }
    return token;
  }
}
