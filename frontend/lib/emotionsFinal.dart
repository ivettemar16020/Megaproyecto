import 'package:flutter/material.dart';
import 'package:frontend/login.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class EmotionsFinalePage extends StatefulWidget {
  @override
  _EmotionsFinalePage createState() => _EmotionsFinalePage();
}

class _EmotionsFinalePage extends State<EmotionsFinalePage> {
  Color backcolor = HexColor("#F4F1E9");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: 35,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  margin: EdgeInsets.only(right: 40, top: 20, bottom: 20),
                  alignment: Alignment.centerLeft,
                ),
              )
            ],
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 32,
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10.0),
                decoration: myBoxDecoration(),
                child: Text(
                  "¿Cómo te sientes \nahora?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  children: <Widget>[
                    categoryWidget('alegre'),
                    categoryWidget('sad'),
                    categoryWidget('angry'),
                    categoryWidget('shocked'),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      color: Colors.deepOrangeAccent,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          color: Colors.deepOrangeAccent.withOpacity(0.3),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 6), // changes position of shadow
        ),
      ],
    );
  }

  Container categoryWidget(String img) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          boxShadow: [
            BoxShadow(
              color: Colors.deepOrangeAccent.withOpacity(0.8),
              blurRadius: 20,
              spreadRadius: 1,
              offset: Offset(0, 10),
            )
          ]),
      child: InkWell(
        onTap: () {
          print(img);
          putEmotions(img);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => UserLogin()));
        },
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/$img.png'))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  putEmotions(emotion) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String token = prefs.getString('token');
    print("este es el token de emociones $token");
    final Map<dynamic, dynamic> emo = {
      'emocion_final': emotion,
    };

    print('Que peces, $token');
    final request = await http.post(
      'https://megap115.herokuapp.com/retos/historial_emociones/',
      headers: {
        'Authorization': 'TOKEN $token',
      },
      body: emo,
    );
    print("emotions status code --> ${request.statusCode}");
    if (request.statusCode == 200) {
      print(request.body);
    }
    return token;
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
