import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:frontend/home.dart';
import 'package:frontend/achievement.dart';
import 'package:frontend/statistics.dart';
import 'package:frontend/help.dart';

import 'package:frontend/autoestima/AutoTworetos.dart';

class BRetoOnePage extends StatefulWidget {
  @override
  _BRetoOnePageState createState() => _BRetoOnePageState();
}

class _BRetoOnePageState extends State<BRetoOnePage> {
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
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(width: 40.0),
                  Expanded(
                    child: Text('Reconoce tus pensamientos',
                        style: TextStyle(
                            height: 1.5,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              SizedBox(height: 50.0),
              Text('Tus pensamientos',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
              SizedBox(height: 25.0),
              Card(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  Text(
                      "Todos tenemos pensamientos que nos hacen sentir mal y por ellos no reconocemos nuestros logros o no nos dejan progresar",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      )),
                  SizedBox(height: 25.0),
                  Text(
                      "Esta es una técnica para poder dejar esos pensamientos atrás",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      )),
                  SizedBox(height: 25.0),
                  Text(
                      "Escribe tus malos pensamientos, tus pensamientos negativos",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                  TextField(
                    controller: myController1,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: '¿Qué piensas?',
                    ),
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
                      "Enviar pensamientos",
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
