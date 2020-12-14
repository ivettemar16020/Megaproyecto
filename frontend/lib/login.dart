import 'package:flutter/material.dart';
import 'package:frontend/register.dart';
import 'package:frontend/reset_psswd.dart';
import 'package:frontend/emotions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:frontend/user.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  TextEditingController nameEditingContrller = TextEditingController();
  TextEditingController pswdEditingContrller = TextEditingController();
  Color backcolor = HexColor("#F4F1E9");

  Future<Token> _futureToken;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: backcolor,
            padding: EdgeInsets.all(24),
            child: Center(
              child: Column(
                children: <Widget>[
                  Center(
                    child: SizedBox(
                      width: 70,
                      height: 70,
                      child: Image.asset('assets/images/usernaranja.png'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Login',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 40,
                  ),
                  TextField(
                    autofocus: false,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    controller: nameEditingContrller,
                    decoration: InputDecoration(
                        labelText: "Username",
                        hintText: "Username",
                        filled: true,
                        fillColor: Colors.white,
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.7)),
                            borderSide: BorderSide(
                                width: 1,
                                color: Colors.green,
                                style: BorderStyle.solid))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    autofocus: false,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    controller: pswdEditingContrller,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Contraseña",
                        hintText: "Contraseña",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.7)),
                            borderSide: BorderSide(
                                width: 1,
                                color: Colors.green,
                                style: BorderStyle.solid))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonTheme(
                    //elevation: 4,
                    //color: Colors.green,
                    minWidth: double.infinity,
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          _futureToken = getToken(nameEditingContrller.text,
                              pswdEditingContrller.text);
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EmotionsPage()));
                      },
                      textColor: Colors.white,
                      color: Colors.deepOrangeAccent,
                      height: 50,
                      child: Text("INICIAR SESIÓN"),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.7),
                        side: BorderSide(color: Colors.deepOrangeAccent)),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserRegister()));
                    },
                    child: Text("¿No tienes cuenta?",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.normal)),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserResetPsswd()));
                    },
                    child: Text("¿Olvidaste tu contraseña?",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.normal)),
                  ),
                  Center(
                    child: SizedBox(
                      height: 195,
                      child: Image.asset('assets/images/login.png'),
                    ),
                  )
                ],
              ),
            ),
          ),
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

Future<Token> getToken(String username, String password) async {
  final Map<dynamic, dynamic> tokenParams = {
    'username': username,
    'password': password,
  };

  final http.Response response = await http.post(
    'https://megap115.herokuapp.com/retos-token-auth/',
    headers: <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: tokenParams,
  );
  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    response.body;
    Map<String, dynamic> token = jsonDecode(response.body);
    print("new $token");

    addStringToSF(token['token']);

    //print('Token, ${token['token']}!');
    //print(response.body);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Error al obtener el usuario');
  }
}

addStringToSF(token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print('AHORA AQUI, ${token}');
  prefs.reload();
  prefs.setString('token', token);
}
