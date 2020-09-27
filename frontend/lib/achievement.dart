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
              padding:  EdgeInsets.only(left: 30.0, right: 30.0, top: 10 ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height*0.11  ,
                        width: MediaQuery.of(context).size.width*0.22, 
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/userblanco.png"))
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
                child: GridView.count(crossAxisCount: 2,
                  childAspectRatio: 0.85,
                  children: <Widget>[
                    Text("Aqui habrán logros", style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 1 ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
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