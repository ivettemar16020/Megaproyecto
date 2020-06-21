import 'package:flutter/material.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  TextEditingController emailEditingContrller = TextEditingController();
  TextEditingController pswdEditingContrller = TextEditingController();
  Color backcolor = HexColor("#F4F1E9");

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
                    height: 60,
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
                    'Login',
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
                    height: 30,
                  ),
                  TextField(
                    autofocus: false,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    controller: pswdEditingContrller,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Password",
                        hintText: "Password",
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
                    height: 50,
                  ),
                  ButtonTheme(
                    //elevation: 4,
                    //color: Colors.green,
                    minWidth: double.infinity,
                    child: MaterialButton(
                      onPressed: () => {},
                      textColor: Colors.white,
                      color: Colors.green,
                      height: 50,
                      child: Text("LOGIN"),
                    ),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.7),
                    side: BorderSide(color: Colors.green)
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 250,
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