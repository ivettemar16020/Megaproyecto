import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:frontend/home.dart';
import 'package:frontend/achievement.dart';
import 'package:frontend/statistics.dart';
import 'package:frontend/help.dart';

import 'package:frontend/autoestima/AutoTworetos.dart';

class BRetoThreePage extends StatefulWidget {
  @override
  _BRetoThreePageState createState() => _BRetoThreePageState();
}

class _BRetoThreePageState extends State<BRetoThreePage> {
  final myController1 = TextEditingController();
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
                    child: Text('Reto 3',
                        style: TextStyle(
                            height: 4,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                "Esta es una técnica para crear un sobresalto, de esta forma el pensamiento ya no está presente en la mente. Puedes practicar esto en este módulo o realizarlo tú mismo. También puedes, en vez de sonar una alarma, aplaudir, gritar, saltar, algo que te saque de ese pensamiento y concentrarte en algo agradable.",
              ),
              Container(
                  height: 300,
                  child: Card(
                    child: Image.asset(
                      'assets/images/smilee.jpg',
                      fit: BoxFit.cover,
                    ),
                  )),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    padding: MediaQuery.of(context).size.width > 800
                        ? const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 64.0)
                        : null,
                    child: Text(
                      "Continuar",
                      style: MediaQuery.of(context).size.width > 800
                          ? TextStyle(fontSize: 30.0)
                          : null,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AutoTwoRetosPage()));
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
