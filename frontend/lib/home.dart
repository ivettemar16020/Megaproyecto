import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color backcolor = HexColor("#F4F1E9");
  String name = '';
  String email = '';
  @override
  void initState() {
    /*
    getStringValuesSF().then((value){
      print('Retrieved information from token');
    });
    super.initState();
    */
    getStringValuesSF();
    setName().then((value){
      setState(() {
      name = value;
      });
    });

    setEmail().then((value){
      setState(() {
      email = value;
      });
    });

    super.initState();
  }

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
                          Text(name, style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 1 ),
                          Row(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SizedBox(width: 2 ),
                                Text(email, style: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 16,
                                ),),
                              ],
                            ),
                          ]),
                        ],
                      )
                    ]
                  ),
                  SizedBox(height: 8  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                       Column(
                        children: <Widget>[
                          Text("0", style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),),
                          Text("Puntos", style: TextStyle(
                            color: Colors.white70,
                            fontSize: 8,
                          ),),
                        ],
                      ),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white60),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("EDITAR PERFIL", style: TextStyle(
                            color: Colors.white60,
                            fontSize: 8,
                          ),),
                        ),
                      )
                    ]
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: <Widget>[
              SizedBox(height: 100,),
              Expanded(
                child: GridView.count(crossAxisCount: 2,
                  childAspectRatio: 0.85,
                  children: <Widget>[
                    categoryWidget('img1', "Autoestima"),
                    categoryWidget('img2', "Inteligencia Emocional"),
                    categoryWidget('img3', "Comunicación Efectiva"),
                    categoryWidget('img4', "¿Cómo decir que no?"),
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
                        FaIcon(FontAwesomeIcons.home)
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        FaIcon(FontAwesomeIcons.medal, color: Colors.orange,),
                        
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        FaIcon(FontAwesomeIcons.chartBar, color: Colors.orange,),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        FaIcon(FontAwesomeIcons.question, color: Colors.orange,),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
  Container categoryWidget(String img, String title)
  {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
      width: MediaQuery.of(context).size.width*0.3,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: [BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 20,
          spreadRadius: 1,
          offset: Offset(0,10),
        )]
      ),
      child: InkWell(
        onTap: (){openProductPage('$img', '$title');},
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
  void openProductPage(String img, String title)
  {
    Navigator.pushNamed(context, '/productPage', arguments: {'image':'$img', 'title':'$title'});
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

getStringValuesSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String token = prefs.getString('token');
  print('Que peces, $token');
  final request = await http.get('https://megap115.herokuapp.com/retos/user/', headers: {
  'Authorization': 'TOKEN $token',
  });
  if (request.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<dynamic> list = jsonDecode(request.body) as List;
    String name = list[0]['username'];
    String email = list[0]['email'];
    print(name + email);
    addValuesToSF(name, email);
    return list;

    //String userToJson(TheUser data) => json.encode(data.toJson());

  }
  return token;
}

addValuesToSF(name, email) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('name', name);
  prefs.setString('email', email);
}

setName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String name = prefs.getString('name');
  return name;
}

setEmail() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String email = prefs.getString('email');
  return email;
}