import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:frontend/iemocional/EmoPage.dart';

class EmoCuestiPage extends StatefulWidget {
  @override
  _EmoCuestiPageState createState() => _EmoCuestiPageState();
}

class _EmoCuestiPageState extends State<EmoCuestiPage> {
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
  String q11 = "";
  String q12 = "";
  String q13 = "";
  String q14 = "";
  String q15 = "";
  String q16 = "";
  String q17 = "";
  String q18 = "";
  String q19 = "";
  String q20 = "";
  String q21 = "";
  String q22 = "";
  String q23 = "";
  String q24 = "";
  String q25 = "";
  String q26 = "";
  String q27 = "";
  String q28 = "";
  String q29 = "";
  String q30 = "";
  String q31 = "";
  String q32 = "";
  String q33 = "";
  String q34 = "";
  String q35 = "";
  String q36 = "";
  String q37 = "";
  String q38 = "";
  String q39 = "";
  String q40 = "";
  String q41 = "";
  String q42 = "";
  String q43 = "";
  String q44 = "";
  String q45 = "";
  String q46 = "";
  String q47 = "";
  String q48 = "";
  String q49 = "";
  String q50 = "";

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
  final ques11Controller = TextEditingController();
  final ques12Controller = TextEditingController();
  final ques13Controller = TextEditingController();
  final ques14Controller = TextEditingController();
  final ques15Controller = TextEditingController();
  final ques16Controller = TextEditingController();
  final ques17Controller = TextEditingController();
  final ques18Controller = TextEditingController();
  final ques19Controller = TextEditingController();
  final ques20Controller = TextEditingController();
  final ques21Controller = TextEditingController();
  final ques22Controller = TextEditingController();
  final ques23Controller = TextEditingController();
  final ques24Controller = TextEditingController();
  final ques25Controller = TextEditingController();
  final ques26Controller = TextEditingController();
  final ques27Controller = TextEditingController();
  final ques28Controller = TextEditingController();
  final ques29Controller = TextEditingController();
  final ques30Controller = TextEditingController();
  final ques31Controller = TextEditingController();
  final ques32Controller = TextEditingController();
  final ques33Controller = TextEditingController();
  final ques34Controller = TextEditingController();
  final ques35Controller = TextEditingController();
  final ques36Controller = TextEditingController();
  final ques37Controller = TextEditingController();
  final ques38Controller = TextEditingController();
  final ques39Controller = TextEditingController();
  final ques40Controller = TextEditingController();
  final ques41Controller = TextEditingController();
  final ques42Controller = TextEditingController();
  final ques43Controller = TextEditingController();
  final ques44Controller = TextEditingController();
  final ques45Controller = TextEditingController();
  final ques46Controller = TextEditingController();
  final ques47Controller = TextEditingController();
  final ques48Controller = TextEditingController();
  final ques49Controller = TextEditingController();
  final ques50Controller = TextEditingController();

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
    request.fields.addAll({'titulo': 'Comunicación Efectiva'});

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
        q11 = map["p11"];
        q12 = map["p12"];
        q13 = map["p13"];
        q14 = map["p14"];
        q15 = map["p15"];
        q16 = map["p16"];
        q17 = map["p17"];
        q18 = map["p18"];
        q19 = map["p19"];
        q20 = map["p20"];
        q21 = map["p21"];
        q22 = map["p22"];
        q23 = map["p23"];
        q24 = map["p24"];
        q25 = map["p25"];
        q26 = map["p26"];
        q27 = map["p27"];
        q28 = map["p28"];
        q29 = map["p29"];
        q30 = map["p30"];
        q31 = map["p31"];
        q32 = map["p32"];
        q33 = map["p33"];
        q34 = map["p34"];
        q35 = map["p35"];
        q36 = map["p36"];
        q37 = map["p37"];
        q38 = map["p38"];
        q39 = map["p39"];
        q40 = map["p40"];
        q41 = map["p41"];
        q42 = map["p42"];
        q43 = map["p43"];
        q44 = map["p44"];
        q45 = map["p45"];
        q46 = map["p46"];
        q47 = map["p47"];
        q48 = map["p48"];
        q49 = map["p49"];
        q50 = map["p50"];
      });
      //print(q1);
      //print(map["p1"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Test Inteligencia Emocional"),
          elevation: 0,
          backgroundColor: Colors.teal[700],
        ),
        body: Stack(
          children: <Widget>[
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.teal[700],
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
                                                                  : (_currentIndex +
                                                                              1) ==
                                                                          11
                                                                      ? "$q11"
                                                                      : (_currentIndex + 1) ==
                                                                              12
                                                                          ? "$q12"
                                                                          : (_currentIndex + 1) == 13
                                                                              ? "$q13"
                                                                              : (_currentIndex + 1) == 14
                                                                                  ? "$q14"
                                                                                  : (_currentIndex + 1) == 15
                                                                                      ? "$q15"
                                                                                      : (_currentIndex + 1) == 16
                                                                                          ? "$q16"
                                                                                          : (_currentIndex + 1) == 17
                                                                                              ? "$q17"
                                                                                              : (_currentIndex + 1) == 18
                                                                                                  ? "$q18"
                                                                                                  : (_currentIndex + 1) == 19
                                                                                                      ? "$q19"
                                                                                                      : (_currentIndex + 1) == 20
                                                                                                          ? "$q20"
                                                                                                          : (_currentIndex + 1) == 21
                                                                                                              ? "$q21"
                                                                                                              : (_currentIndex + 1) == 22
                                                                                                                  ? "$q22"
                                                                                                                  : (_currentIndex + 1) == 23
                                                                                                                      ? "$q23"
                                                                                                                      : (_currentIndex + 1) == 24
                                                                                                                          ? "$q24"
                                                                                                                          : (_currentIndex + 1) == 25
                                                                                                                              ? "$q25"
                                                                                                                              : (_currentIndex + 1) == 26
                                                                                                                                  ? "$q26"
                                                                                                                                  : (_currentIndex + 1) == 27
                                                                                                                                      ? "$q27"
                                                                                                                                      : (_currentIndex + 1) == 28
                                                                                                                                          ? "$q28"
                                                                                                                                          : (_currentIndex + 1) == 29
                                                                                                                                              ? "$q29"
                                                                                                                                              : (_currentIndex + 1) == 30
                                                                                                                                                  ? "$q30"
                                                                                                                                                  : (_currentIndex + 1) == 31
                                                                                                                                                      ? "$q31"
                                                                                                                                                      : (_currentIndex + 1) == 32
                                                                                                                                                          ? "$q32"
                                                                                                                                                          : (_currentIndex + 1) == 33
                                                                                                                                                              ? "$q33"
                                                                                                                                                              : (_currentIndex + 1) == 34
                                                                                                                                                                  ? "$q34"
                                                                                                                                                                  : (_currentIndex + 1) == 35
                                                                                                                                                                      ? "$q35"
                                                                                                                                                                      : (_currentIndex + 1) == 36
                                                                                                                                                                          ? "$q36"
                                                                                                                                                                          : (_currentIndex + 1) == 37
                                                                                                                                                                              ? "$q37"
                                                                                                                                                                              : (_currentIndex + 1) == 38
                                                                                                                                                                                  ? "$q38"
                                                                                                                                                                                  : (_currentIndex + 1) == 39
                                                                                                                                                                                      ? "$q39"
                                                                                                                                                                                      : (_currentIndex + 1) == 40
                                                                                                                                                                                          ? "$q40"
                                                                                                                                                                                          : (_currentIndex + 1) == 41
                                                                                                                                                                                              ? "$q41"
                                                                                                                                                                                              : (_currentIndex + 1) == 42
                                                                                                                                                                                                  ? "$q42"
                                                                                                                                                                                                  : (_currentIndex + 1) == 43
                                                                                                                                                                                                      ? "$q43"
                                                                                                                                                                                                      : (_currentIndex + 1) == 44
                                                                                                                                                                                                          ? "$q44"
                                                                                                                                                                                                          : (_currentIndex + 1) == 45
                                                                                                                                                                                                              ? "$q45"
                                                                                                                                                                                                              : (_currentIndex + 1) == 46
                                                                                                                                                                                                                  ? "$q46"
                                                                                                                                                                                                                  : (_currentIndex + 1) == 47
                                                                                                                                                                                                                      ? "$q47"
                                                                                                                                                                                                                      : (_currentIndex + 1) == 48
                                                                                                                                                                                                                          ? "$q48"
                                                                                                                                                                                                                          : (_currentIndex + 1) == 49
                                                                                                                                                                                                                              ? "$q49"
                                                                                                                                                                                                                              : (_currentIndex + 1) == 50
                                                                                                                                                                                                                                  ? "$q50"
                                                                                                                                                                                                                                  : "Error",
                          style: TextStyle(height: 1.5, fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                  ],
                ),
                SizedBox(height: 50.0),
                Card(
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Slider(
                      activeColor: Colors.teal[700],
                      inactiveColor: Colors.teal[100],
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
    if (_currentIndex < 49) {
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
          context, MaterialPageRoute(builder: (context) => EmoPage()));
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
      'https://megap115.herokuapp.com/retos/pec_realizado/',
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
    final request = await http
        .get('https://megap115.herokuapp.com/retos/pec_realizado/', headers: {
      'Authorization': 'TOKEN $token',
    });
    if (request.statusCode == 200) {
      print(request.body);
    }
    return token;
  }
}
