import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:frontend/comunicacion/ComuCuesti.dart';
import 'package:frontend/home.dart';

class IntroComu extends StatefulWidget {
  @override
  _IntroComuState createState() => _IntroComuState();
}

class _IntroComuState extends State<IntroComu> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "COMUNICACIÓN EFECTIVA",
        styleTitle: TextStyle(
            color: Colors.amberAccent[700],
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Este módulo se enfoca en ayudarte a comunicarte con los demás de forma efectiva.",
        styleDescription: TextStyle(
            color: Colors.amberAccent[700],
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/images/comunicacion.png",
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      new Slide(
        title: "CUESTIONARIO",
        styleTitle: TextStyle(
            color: Colors.amberAccent[700],
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "A continuación se te presentará un QUIZ que nos ayudará a identificar tu forma de comunicarte con los demás. Recuerda que no hay respuestas incorrectas, tomate tu tiempo y ¡relájate!",
        styleDescription: TextStyle(
            color: Colors.amberAccent[700],
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/images/comunicacion.png",
        backgroundColor: Colors.white,
      ),
    );
  }

  void onDonePress() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ComuCuestiPage()));
  }

  void onSkipPress() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Colors.amberAccent[800],
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Colors.amberAccent[800],
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.undo,
      color: Colors.amberAccent[800],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      onSkipPress: this.onSkipPress,
      colorSkipBtn: Colors.amberAccent[300],
      highlightColorSkipBtn: Colors.amberAccent[300],

      // Next, Done button
      onDonePress: this.onDonePress,
      renderNextBtn: this.renderNextBtn(),
      renderDoneBtn: this.renderDoneBtn(),
      colorDoneBtn: Colors.amberAccent[300],
      highlightColorDoneBtn: Colors.amberAccent[400],

      // Dot indicator
      colorDot: Colors.amberAccent[100],
      colorActiveDot: Colors.amberAccent[200],
      sizeDot: 13.0,
    );
  }
}
