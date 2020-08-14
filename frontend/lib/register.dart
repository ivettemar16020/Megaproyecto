import 'package:flutter/material.dart';
import 'package:frontend/create_user_db.dart';
import 'package:frontend/user.dart';

class UserRegister extends StatefulWidget {
 @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final TextEditingController nameEditingContrller = TextEditingController();
  final TextEditingController emailEditingContrller = TextEditingController();
  final TextEditingController pswdEditingContrller = TextEditingController();
  final TextEditingController repswdEditingContrller = TextEditingController();
  Color backcolor = HexColor("#F4F1E9");

  Future<User> _futureUser;

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
                  SizedBox(
                    height: 8,
                  ),
                  Center(
                    child: SizedBox(
                      width: 70,
                      height: 70,
                      child: Image.asset('assets/images/user.png'),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Registro',
                    style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600)
                    ),
                  SizedBox(
                    height: 40,
                  ),
                  TextField(
                    autofocus: false,
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    controller: nameEditingContrller,
                    decoration: InputDecoration(
                        labelText: "Nombre",
                        hintText: "Nombre",
                        filled: true,
                        fillColor: Colors.white,
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25.7)),
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
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailEditingContrller,
                    decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Email",
                        filled: true,
                        fillColor: Colors.white,
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25.7)),
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
                            borderRadius: BorderRadius.all(Radius.circular(25.7)),
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
                    controller: repswdEditingContrller,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Confirmar contraseña",
                        hintText: "Confirma tu contraseña",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25.7)),
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
                          _futureUser = createUser(nameEditingContrller.text, emailEditingContrller.text, pswdEditingContrller.text);
                        });
                      },
                      textColor: Colors.white,
                      color: Colors.green,
                      height: 50,
                      child: Text("CREAR CUENTA"),
                    ),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.7),
                    side: BorderSide(color: Colors.green)
                    ),
                  ),
                 Center(
                    child: SizedBox(
                      height: 350,
                      child: Image.asset('assets/images/regis.png'),
                    ),
                  )
                ],
              )
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