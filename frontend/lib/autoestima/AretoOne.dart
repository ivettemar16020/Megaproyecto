import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:frontend/home.dart';
import 'package:frontend/achievement.dart';
import 'package:frontend/statistics.dart';
import 'package:frontend/help.dart';

import 'package:frontend/autoestima/AutoOneretos.dart';

class RetoOnePage extends StatefulWidget {
  @override
  _RetoOnePageState createState() => _RetoOnePageState();
}

class _RetoOnePageState extends State<RetoOnePage> {
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  final myController4 = TextEditingController();
  final myController5 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f8f8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width,
            color: Color(0xffc7b8f5),
            child: Container(
              margin: EdgeInsets.only(right: 40, top: 20, bottom: 20),
              alignment: Alignment.centerLeft,
            ),
          ),
          SizedBox(width: 40.0),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white70,
                    child: Text("1"),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Text(
                        'Reconoce tu propio valor y en lo que eres bueno',
                        style: TextStyle(
                            height: 1.5,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              SizedBox(height: 50.0),
              Text("Escribe 5 cualidades que te identifiquen",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurpleAccent,
                  )),
              Card(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  SizedBox(height: 15.0),
                  TextField(
                    controller: myController1,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Ingresa una característica',
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextField(
                    controller: myController2,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Ingresa una característica',
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextField(
                    controller: myController3,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Ingresa una característica',
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextField(
                    controller: myController4,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Ingresa una característica',
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextField(
                    controller: myController5,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Ingresa una característica',
                    ),
                  ),
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
                      "Enviar respuestas",
                      style: MediaQuery.of(context).size.width > 800
                          ? TextStyle(
                              fontSize: 30.0, color: Colors.deepPurpleAccent)
                          : null,
                    ),
                    onPressed: () {
                      Map<dynamic, dynamic> myCurttentAnsw = {
                        //'r${_currentIndex + 1}': _currentSliderValue.toInt()
                        'name': '5 cualidades',
                        'respuesta':
                            '${myController1.text}, ${myController2.text}, ${myController3.text}, ${myController4.text}, ${myController5.text}'
                      };
                      print(myCurttentAnsw);
                      postAnswers(myCurttentAnsw);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AutoOneRetosPage()));
                    },
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }

  postAnswers(answs) async {
    print(answs);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String token = prefs.getString('token');
    final request = await http.post(
      'https://megap115.herokuapp.com/retos/reto_finalizado/',
      headers: {
        'Authorization': 'TOKEN $token',
      },
      body: answs,
    );
    print(request.body);
    if (request.statusCode == 201) {
      print(request.body);
    }
    return token;
  }
}
