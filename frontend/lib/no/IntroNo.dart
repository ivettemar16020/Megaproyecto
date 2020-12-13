import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:frontend/no/NoCuesti.dart';
import 'package:frontend/home.dart';

class IntroNo extends StatefulWidget {
  @override
  _IntroNoState createState() => _IntroNoState();
}

class _IntroNoState extends State<IntroNo> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "¿Cómo decir que no?",
        styleTitle: TextStyle(
            color: Colors.redAccent[100],
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Este módulo se enfoca en identificar qué tan bueno eres para decir que no cuando corresponde.",
        styleDescription: TextStyle(
            color: Colors.redAccent[100],
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/images/no.png",
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      new Slide(
        title: "CUESTIONARIO",
        styleTitle: TextStyle(
            color: Colors.redAccent[100],
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "A continuación se te presentará un QUIZ correspondiente al módulo de ¿cómo decir que no?. Recuerda que no hay respuestas incorrectas, tomate tu tiempo y ¡relájate!",
        styleDescription: TextStyle(
            color: Colors.redAccent[100],
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/images/no.png",
        backgroundColor: Colors.white,
      ),
    );
  }

  void onDonePress() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NoCuestiPage()));
  }

  void onSkipPress() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Colors.redAccent[800],
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Colors.redAccent[800],
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.undo,
      color: Colors.redAccent[800],
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
      colorSkipBtn: Colors.redAccent[300],
      highlightColorSkipBtn: Colors.redAccent[300],

      // Next, Done button
      onDonePress: this.onDonePress,
      renderNextBtn: this.renderNextBtn(),
      renderDoneBtn: this.renderDoneBtn(),
      colorDoneBtn: Colors.redAccent[300],
      highlightColorDoneBtn: Colors.redAccent[400],

      // Dot indicator
      colorDot: Colors.redAccent[100],
      colorActiveDot: Colors.redAccent[200],
      sizeDot: 13.0,
    );
  }
}
