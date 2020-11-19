import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:frontend/home.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AutoCuestiPage extends StatefulWidget {
  @override
  _AutoCuestiPageState createState() => _AutoCuestiPageState();
}

class _AutoCuestiPageState extends State<AutoCuestiPage> {
  @override
  void initState() {
    String q1, q2, q3, q4, q5, q6, q7, q8, q9, q10;
    putCuesAuto();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AUTOESTIMA',
      home: Scaffold(
        appBar: AppBar(
          title: Text('QUIZ'),
        ),
        body: Center(
          child: Text('Preguntas lmao'),
        ),
      ),
    );
  }

  putCuesAuto() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String token = prefs.getString('token');
    print('Que peces, $token');
    final request = await http
        .get('https://megap115.herokuapp.com/retos/auto_estima/', headers: {
      'Authorization': 'TOKEN $token',
    });
    if (request.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Map<String, dynamic> map = json.decode(request.body);
      //List<dynamic> data = map["dataKey"];
      //print(map["p1"]);
      return map;
    }
    return token;
  }
}
