
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color backcolor = HexColor("#F4F1E9");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backcolor,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height*0.28,
                width: MediaQuery.of(context).size.width,
                color: Colors.deepOrangeAccent,
                child: Container(
                  margin: EdgeInsets.only(right: 30, top: 20, bottom: 20, left: 10),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/path.png'),
                      fit: BoxFit.contain
                    )
                  ),
                ),
              )
            ],
          ),
          Column(
            children: <Widget>[
              SizedBox(height: 10,),
              /*
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    'assets/images/user.png', width: 60.0, height: 60.0,
                  ),
                ],
              ),*/
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(30),
                child: Text("Hola \nJose", style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color:Colors.white
                ),),
              ),
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