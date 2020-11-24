import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:frontend/home.dart';
import 'package:frontend/achievement.dart';
import 'package:frontend/statistics.dart';
import 'package:frontend/help.dart';

import 'package:frontend/autoestima/AutoOneretos.dart';

class RetoThreePage extends StatefulWidget {
  @override
  _RetoThreePageState createState() => _RetoThreePageState();
}

class _RetoThreePageState extends State<RetoThreePage> {
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
                  SizedBox(width: 50.0),
                  Expanded(
                    child: Text('Cualidad: Adaptabilidad',
                        style: TextStyle(
                            height: 4,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              Text(
                "¿Por qué crees que esta cualidad es importante? \n¿Por qué las personas tienen esta cualidad?",
              ),
              Container(
                height: 200,
                child: Card(
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    SizedBox(height: 15.0),
                    TextField(
                      controller: myController1,
                      maxLines: 8,
                      decoration:
                          InputDecoration.collapsed(hintText: "¿Qué opinas?"),
                    ),
                  ]),
                ),
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
                          ? TextStyle(fontSize: 30.0)
                          : null,
                    ),
                    onPressed: () {
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
}
