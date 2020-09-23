import 'package:flutter/material.dart';
import 'package:frontend/create_user_db.dart';
import 'package:frontend/user.dart';
import 'package:frontend/login.dart';

class UserRegister extends StatefulWidget {
 @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final TextEditingController nameEditingContrller = TextEditingController();
  final TextEditingController emailEditingContrller = TextEditingController();
  final TextEditingController pswdEditingContrller = TextEditingController();
  final TextEditingController repswdEditingContrller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  var passKey = GlobalKey<FormFieldState>();

  Color backcolor = HexColor("#F4F1E9");

  Future<User> _futureUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
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
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: backcolor,
            padding: EdgeInsets.all(30),
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
                      child: Image.asset('assets/images/usernaranja.png'),
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
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          autofocus: false,
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          controller: nameEditingContrller,
                          decoration: InputDecoration(
                            labelText: "Username",
                            hintText: "Ej. Anita22",
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
                                color: Colors.deepOrangeAccent,
                                style: BorderStyle.solid))
                          ),
                          validator: (String value) {
                            if (value.trim().isEmpty) {
                              return 'Este campo es obligatorio';
                            }
                          },
                        ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        autofocus: false,
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress,
                        controller: emailEditingContrller,
                        decoration: InputDecoration(
                            labelText: "Email",
                            hintText: "Ej. correo@uvg.edu.gt",
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
                                    color: Colors.deepOrangeAccent,
                                    style: BorderStyle.solid))),
                         validator: (String value) {
                            if (value.trim().isEmpty) {
                              return 'Este campo es obligatorio';
                            }
                          },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        key: passKey,
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
                                    color: Colors.deepOrangeAccent,
                                    style: BorderStyle.solid))),
                        validator: (password) {
                          var result = password.length < 4
                              ? "Contraseña muy corta"
                              : null;
                          return result;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        autofocus: false,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        controller: repswdEditingContrller,
                        validator: (value){
                          if (value != passKey.currentState.value) {
                            return 'Las contraseñas no coinciden';
                          } else {
                            return null;
                          }
                        },
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
                                    color: Colors.deepOrangeAccent,
                                    style: BorderStyle.solid))),
                      ),
                    ],)
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
                        _submit();
                        setState(() {
                          _futureUser = createUser(nameEditingContrller.text, emailEditingContrller.text, pswdEditingContrller.text);
                        });
                        Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => UserLogin())
                      );
                      },
                      textColor: Colors.white,
                      color: Colors.deepOrangeAccent,
                      height: 50,
                      child: Text("CREAR CUENTA"),
                    ),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.7),
                    side: BorderSide(color: Colors.deepOrangeAccent)
                    ),
                  ),
                /*
                 Center(
                    child: SizedBox(
                      height: 350,
                      child: Image.asset('assets/images/regis.png'),
                    ),
                  )*/
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
  void _submit() {
    _formKey.currentState.validate();
    print('Form submitted');
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