import 'package:flutter/material.dart';

class EmotionsPage extends StatelessWidget {
  Color backcolor = HexColor("#F4F1E9");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //padding: EdgeInsets.symmetric(vertical:30),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red[900], 
              Colors.red[800],
              Colors.red[400]
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: SizedBox(
                      child: Text("¿Cómo te sientes hoy?", style: TextStyle(color: Colors.white, fontSize: 40),)
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                padding: EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        FlatButton(
                          onPressed: null,
                          padding: EdgeInsets.all(5),
                          color: Colors.yellow,
                          child: Image.asset('assets/images/happy.png')
                        ),
                        Text('Feliz'),
                      ],
                    ),
                    Column(
                      children: [
                        FlatButton(
                          onPressed: null,
                          padding: EdgeInsets.all(5),
                          child: Image.asset('assets/images/sad.png')
                        ),
                        Text('Triste'),
                      ],
                    ),
                    /*
                    Column(
                      children: [
                        Icon(Icons.kitchen, color: Colors.green[500]),
                        Text('MEH'),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.kitchen, color: Colors.green[500]),
                        Text('ANGRY'),
                      ],
                    ),
                    */
                  ],
                ),
              ),
            )
          ],
        )
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