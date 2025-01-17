import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:frontend/autoestima/AutoCuesti.dart';
import 'package:frontend/home.dart';

class IntroAuto extends StatefulWidget {
  @override
  _IntroAutoState createState() => _IntroAutoState();
}

class _IntroAutoState extends State<IntroAuto> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "AUTOESTIMA",
        styleTitle: TextStyle(
            color: Colors.tealAccent[700],
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: "Este módulo se enfoca en cómo mejorar tu autoestima.",
        styleDescription: TextStyle(
            color: Colors.tealAccent[700],
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/images/autoestima.png",
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      new Slide(
        title: "CUESTIONARIO",
        styleTitle: TextStyle(
            color: Colors.tealAccent[700],
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "A continuación se te presentará un QUIZ que nos ayudará a identificar tus niveles de autoestima. Recuerda que no hay respuestas incorrectas, tomate tu tiempo y ¡relájate!",
        styleDescription: TextStyle(
            color: Colors.tealAccent[700],
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/images/autoestima.png",
        backgroundColor: Colors.white,
      ),
    );
  }

  void onDonePress() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AutoCuestiPage()));
  }

  void onSkipPress() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Colors.tealAccent[800],
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Colors.tealAccent[800],
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.undo,
      color: Colors.tealAccent[800],
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
      colorSkipBtn: Colors.tealAccent[300],
      highlightColorSkipBtn: Colors.tealAccent[300],

      // Next, Done button
      onDonePress: this.onDonePress,
      renderNextBtn: this.renderNextBtn(),
      renderDoneBtn: this.renderDoneBtn(),
      colorDoneBtn: Colors.tealAccent[300],
      highlightColorDoneBtn: Colors.tealAccent[400],

      // Dot indicator
      colorDot: Colors.tealAccent[100],
      colorActiveDot: Colors.tealAccent[200],
      sizeDot: 13.0,
    );
  }
}
