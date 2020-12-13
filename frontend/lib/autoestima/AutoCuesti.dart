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

  String currentCuestion = "";

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
      'Authorization': 'TOKEN $token',
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
                              ? currentCuestion = "$q1"
                              : (_currentIndex + 1) == 2
                                  ? currentCuestion = "$q2"
                                  : (_currentIndex + 1) == 3
                                      ? currentCuestion = "$q3"
                                      : (_currentIndex + 1) == 4
                                          ? currentCuestion = "$q4"
                                          : (_currentIndex + 1) == 5
                                              ? currentCuestion = "$q5"
                                              : (_currentIndex + 1) == 6
                                                  ? currentCuestion = "$q6"
                                                  : (_currentIndex + 1) == 7
                                                      ? currentCuestion = "$q7"
                                                      : (_currentIndex + 1) == 8
                                                          ? currentCuestion =
                                                              "$q8"
                                                          : (_currentIndex +
                                                                      1) ==
                                                                  9
                                                              ? currentCuestion =
                                                                  "$q9"
                                                              : (_currentIndex +
                                                                          1) ==
                                                                      10
                                                                  ? currentCuestion =
                                                                      "$q10"
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
      //'r${_currentIndex + 1}': _currentSliderValue.toInt()
      'respuesta': '${_currentSliderValue.toInt()}',
      'pregunta': '${currentCuestion}'
    };
    print(myCurttentAnsw);
    if (_currentIndex < 9) {
      setState(() {
        _currentIndex++;
        _flag = "q$_currentIndex";
        //answers.add(myCurttentAnsw);
        postAnswers(myCurttentAnsw);
      });
    } else {
      print(jsonEncode(answers));
      getAnswers();
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

  postAnswers(answs) async {
    print(answs);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String token = prefs.getString('token');
    final request = await http.post(
      'https://megap115.herokuapp.com/retos/respuestas/',
      headers: {
        'Authorization': 'TOKEN $token',
      },
      body: answs,
    );
    print(request.body);
    print(request.statusCode);
    if (request.statusCode == 201) {
      print(request.body);
    }
    return token;
  }

  getAnswers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String token = prefs.getString('token');

    var headers = {
      'Authorization': 'TOKEN  $token',
    };
    var request = http.MultipartRequest(
        'GET', Uri.parse('https://megap115.herokuapp.com/retos/respuestas/'));
    request.fields.addAll({'titulo_cuestionario': 'Autoestima'});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    final respStr = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      print(respStr);
    }
    return token;
  }
}
