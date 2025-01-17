import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:frontend/iemocional/EmoCuesti.dart';
import 'package:frontend/home.dart';

class IntroEmo extends StatefulWidget {
  @override
  _IntroEmoState createState() => _IntroEmoState();
}

class _IntroEmoState extends State<IntroEmo> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "INTELIGENCIA EMOCIONAL",
        styleTitle: TextStyle(
            color: Colors.teal[700],
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Este módulo se enfoca en cómo mejorar tu inteligencia emocional.",
        styleDescription: TextStyle(
            color: Colors.teal[700],
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/images/inteligenciaemocional.png",
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      new Slide(
        title: "CUESTIONARIO",
        styleTitle: TextStyle(
            color: Colors.teal[700],
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "A continuación se te presentará un QUIZ que nos ayudará a identificar como manejas tus emociones. Recuerda que no hay respuestas incorrectas, tomate tu tiempo y ¡relájate!",
        styleDescription: TextStyle(
            color: Colors.teal[700],
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/images/inteligenciaemocional.png",
        backgroundColor: Colors.white,
      ),
    );
  }

  void onDonePress() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EmoCuestiPage()));
  }

  void onSkipPress() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Colors.teal[800],
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Colors.teal[800],
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.undo,
      color: Colors.teal[800],
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
      colorSkipBtn: Colors.teal[300],
      highlightColorSkipBtn: Colors.teal[300],

      // Next, Done button
      onDonePress: this.onDonePress,
      renderNextBtn: this.renderNextBtn(),
      renderDoneBtn: this.renderDoneBtn(),
      colorDoneBtn: Colors.teal[300],
      highlightColorDoneBtn: Colors.teal[400],

      // Dot indicator
      colorDot: Colors.teal[100],
      colorActiveDot: Colors.teal[200],
      sizeDot: 13.0,
    );
  }
}
