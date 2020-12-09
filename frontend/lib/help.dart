import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:frontend/home.dart';
import 'package:frontend/statistics.dart';
import 'package:frontend/achievement.dart';

class HelpPage extends StatefulWidget {
  @override
  _HelpPage createState() => _HelpPage();
}

class _HelpPage extends State<HelpPage> {
  Color backcolor = HexColor("#F4F1E9");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backcolor,
        body: Stack(
          children: <Widget>[
            Container(
                color: Colors.deepOrangeAccent,
                height: MediaQuery.of(context).size.height * 0.20,
                child: Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 10),
                    child: Column(children: <Widget>[
                      Row(children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height * 0.11,
                          width: MediaQuery.of(context).size.width * 0.22,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/images/faq.png"))),
                        ),
                        SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Ayuda",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 1),
                          ],
                        )
                      ]),
                      SizedBox(height: 8),
                    ]))),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 110,
                ),
                Expanded(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(Icons.check),
                          title: Text(
                              'Empieza tu camino en una vida más asertiva'),
                          subtitle: Text('¿No sabes por dónde empezar?'),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(Icons.check),
                          title: Text('Selecciona un módulo'),
                          subtitle: Text(
                              'Puedes escoger entre autoestima, inteligencia emocional, comunicación efectiva y ¿cómo decir que no?'),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(Icons.check),
                          title: Text('Realiza el test'),
                          subtitle: Text(
                              'Cada uno de los módulos contiene un test introductorio que te servirá como diagnóstico en el área seleccionada'),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(Icons.check),
                          title: Text('¡Diviertete conociéndote!'),
                          subtitle: Text(
                              'Realiza los retos dentro de cada plan para autodescubrirte y mejorar tu asertividad'),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          IconButton(
                            icon: FaIcon(FontAwesomeIcons.home,
                                color: Colors.orange),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage()));
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          IconButton(
                            icon: FaIcon(FontAwesomeIcons.medal,
                                color: Colors.orange),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AchievementPage()));
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          IconButton(
                            icon: FaIcon(FontAwesomeIcons.chartBar,
                                color: Colors.orange),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StatisticsPage()));
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          IconButton(
                            icon: FaIcon(FontAwesomeIcons.question,
                                color: Colors.orange),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HelpPage()));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
