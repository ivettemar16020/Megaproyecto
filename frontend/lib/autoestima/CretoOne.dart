import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:frontend/home.dart';
import 'package:frontend/achievement.dart';
import 'package:frontend/statistics.dart';
import 'package:frontend/help.dart';

import 'package:frontend/autoestima/AutoThreeretos.dart';

class CRetoOnePage extends StatefulWidget {
  @override
  _CRetoOnePageState createState() => _CRetoOnePageState();
}

class _CRetoOnePageState extends State<CRetoOnePage> {
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
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
            padding: const EdgeInsets.all(30.0),
            child: Column(children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Text('Piensa bien de ti',
                        style: TextStyle(
                            height: 1.5,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              SizedBox(height: 50.0),
              Text(
                  "Muchas veces, por pensar mal de nosotros mismos dejamos pasar oportunidades que nos podrían traer alegrías y nuevas experiencias. Nuestros pensamientos y lo que nos decimos a nosotros mismos nos detienen y asustan, y muchas veces, estos pensamientos no son verdad"),
              Card(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  Text(
                      "Tal y como dicen, ‘el que no arriesga no gana’, así que piensa en estos escenarios y escribe el peor escenario posible y el mejor escenario posible"),
                  SizedBox(height: 15.0),
                  Text("Peor escenario posible:"),
                  TextField(
                    controller: myController1,
                  ),
                  SizedBox(height: 15.0),
                  Text("Mejor escenario posible:"),
                  TextField(
                    controller: myController2,
                  ),
                  SizedBox(height: 15.0),
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
                          ? TextStyle(fontSize: 30.0)
                          : null,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AutoThreeRetosPage()));
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
