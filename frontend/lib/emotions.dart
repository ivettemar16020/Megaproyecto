import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/home.dart';

class EmotionsPage extends StatefulWidget {
  @override
  _EmotionsPage createState() => _EmotionsPage();
}

class _EmotionsPage extends State<EmotionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffF4F1E9),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height*0.30,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xfffD25148),
                  border: Border.all(
                     color: Color(0xfffD25148),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(50))
                ),
                child: Container(
                  margin: EdgeInsets.only(right: 40, top: 20, bottom: 20),
                  alignment: Alignment.centerLeft,
                ),
              )
            ],
          ),
          Column(
            children: <Widget>[
              SizedBox(height: 35,),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                child: Text("¿Cómo te sientes \nhoy?", style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color:Colors.white
                ),),
              ),
              SizedBox(height: 10,),
              Expanded(
                child: GridView.count(crossAxisCount: 2,
                  childAspectRatio: 0.85,
                  children: <Widget>[
                    categoryWidget('happy'),
                    categoryWidget('sad'),
                    categoryWidget('angry'),
                    categoryWidget('meh'),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
  Container categoryWidget(String img)
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
        onTap: (){
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => MyHomePage())
            );
          },
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/$img.png')
                  )
                ),
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
