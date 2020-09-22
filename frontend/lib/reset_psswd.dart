import 'package:flutter/material.dart';

class UserResetPsswd extends StatefulWidget {
 @override
  _UserResetPsswdState createState() => _UserResetPsswdState();
}

class _UserResetPsswdState extends State<UserResetPsswd> {
  TextEditingController emailEditingContrller = TextEditingController();
  TextEditingController pswdEditingContrller = TextEditingController();
  TextEditingController repswdEditingContrller = TextEditingController();
  Color backcolor = HexColor("#F4F1E9");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: Icon(Icons.arrow_back_ios,
          color: Colors.black,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
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
                    'Restaurar contraseña',
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
                      onPressed: () => {},
                      textColor: Colors.white,
                      color: Colors.green,
                      height: 50,
                      child: Text("RESTAURAR"),
                    ),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.7),
                    side: BorderSide(color: Colors.green)
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SizedBox(
                      height: 150,
                      child: Image.asset('assets/images/passwd.png'),
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