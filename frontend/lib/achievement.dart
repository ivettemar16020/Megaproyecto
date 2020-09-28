import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:frontend/home.dart';
import 'package:frontend/statistics.dart';
import 'package:frontend/help.dart';

class AchievementPage extends StatefulWidget {
  @override
  _AchievementPage createState() => _AchievementPage();
}

class _AchievementPage extends State<AchievementPage> {
  Color backcolor = HexColor("#F4F1E9");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backcolor,
      body: Stack(
        children: <Widget>[
           Container(
            color: Colors.deepOrangeAccent,
            height: MediaQuery.of(context).size.height*0.20 ,
            child: Padding(
              padding:  EdgeInsets.only(left: 30.0, right: 30.0, top: 20 ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height*0.11  ,
                        width: MediaQuery.of(context).size.width*0.22, 
                        decoration: BoxDecoration(
                          //color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage("assets/images/copa2.png"))
                        ),
                      ),
                      SizedBox(width: 5 ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Logros", style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                          ),
                          Text("conseguidos", style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 1 ),
                        ],
                      )
                    ]
                  ),
                  SizedBox(height: 8  ),
                ]
              )
            )
          ),
          Column(
            children: <Widget>[
              SizedBox(height: 110,),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Card(
                       child: new Column(
                        children: <Widget>[
                          new Column (children: <Widget>[
                            new IconButton(icon: FaIcon(FontAwesomeIcons.medal, color: Colors.orange)),
                            new Container (child: new Text("QUIZ"), color: Colors.yellow[200],),
                            new Container(height: 15.0,),
                            new Text("¡Has finalizado el primer test de asertividad!"),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                new Container(width: 10.0,),
                                new IconButton(icon: FaIcon(FontAwesomeIcons.arrowCircleRight, color: Colors.orange), onPressed: () {}),
                              ],
                            ),
                          ],),
                        ],
                      ),
                    ),
                    Card(
                       child: new Column(
                        children: <Widget>[
                          new Column (children: <Widget>[
                            new IconButton(icon: FaIcon(FontAwesomeIcons.starOfLife, color: Colors.orange)),
                            new Container (child: new Text("NUEVA RACHA"), color: Colors.yellow[200],),
                            new Container(height: 15.0,),
                            new Text("Racha de 2 días"),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                new Container(width: 10.0,),
                                new IconButton(icon: FaIcon(FontAwesomeIcons.arrowCircleRight, color: Colors.orange), onPressed: () {}),
                              ],
                            ),
                          ],),
                        ],
                      ),
                    ),
                    Card(
                       child: new Column(
                        children: <Widget>[
                          new Column (children: <Widget>[
                            new IconButton(icon: FaIcon(FontAwesomeIcons.star, color: Colors.orange)),
                            new Container (child: new Text("MÓDULOS"), color: Colors.yellow[200],),
                            new Container(height: 15.0,),
                            new Text("¡Has decidido realizar tu primer módulo!"),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                new Container(width: 10.0,),
                                new IconButton(icon: FaIcon(FontAwesomeIcons.arrowCircleRight, color: Colors.orange), onPressed: () {}),
                              ],
                            ),
                          ],),
                        ],
                      ),
                    ),
                  ],
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
                          icon:FaIcon(FontAwesomeIcons.home, color: Colors.orange),
                          onPressed: (){
                            Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => MyHomePage())
                            );
                          },
                        ),
                      ],
                      
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                          icon:FaIcon(FontAwesomeIcons.medal, color: Colors.orange),
                          onPressed: (){
                            Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => AchievementPage())
                            );
                          },
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                          icon:FaIcon(FontAwesomeIcons.chartBar, color: Colors.orange),
                          onPressed: (){
                            Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => StatisticsPage())
                            );
                          },
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                          icon:FaIcon(FontAwesomeIcons.question, color: Colors.orange),
                          onPressed: (){
                            Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => HelpPage())
                            );
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
      )
    );
  }

  Container logrosWidget(String img, String title)
  {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
      width: MediaQuery.of(context).size.width*0.3,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: [BoxShadow(
          color: Colors.yellow[800].withOpacity(0.4),
          blurRadius: 6,
          spreadRadius: 0.4,
          offset: Offset(0.5,10),
        )]
      ),
      child: InkWell(
        //{openProductPage('$img', '$title');},
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/$img.png'),
                    fit: BoxFit.contain
                  )
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(20),
              child: Text('$title', style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
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