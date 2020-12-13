import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:frontend/home.dart';
import 'package:frontend/achievement.dart';
import 'package:frontend/statistics.dart';
import 'package:frontend/help.dart';

import 'package:frontend/autoestima/AutoOneretos.dart';

class RetoTwoPage extends StatefulWidget {
  @override
  _RetoTwoPageState createState() => _RetoTwoPageState();
}

class _RetoTwoPageState extends State<RetoTwoPage> {
  List<bool> isSelected = [];
  List<String> selectedLetters = [];
  Map<GlobalKey, String> lettersMap;

  Offset initialTappedPosition = Offset(0, 0);
  Offset initialPosition = Offset(0, 0);
  Offset finalPosition;

  int intialSquare;
  int crossAxisCount = 4;
  int index = -1;
  bool isTapped = false;

  String selectedWord = '';

  double width = 50;
  double height = 50;
  Size size;

  List<String> letters = [
    'p',
    'e',
    's',
    'p',
    'u',
    'n',
    's',
    'a',
    'n',
    'l',
    'e',
    'a',
    't',
    'r',
    'b',
    'u',
    'u',
    'r',
    'b',
    'z',
    'a',
    'z',
    'r',
    'b',
    'l',
    'l',
    'z',
    'r',
    'l',
    'z',
    'b',
    'z'
  ];
  @override
  void initState() {
    super.initState();
    lettersMap =
        Map.fromIterable(letters, key: (i) => GlobalKey(), value: (i) => i[0]);
    isSelected = List.generate(letters.length, (e) => false);
  }

  _determineWord() {
    double differnce;
    int numberOfSquares;

    if ((finalPosition.dx - initialPosition.dx) > 20) {
      print('right');

      //moved right
      differnce = finalPosition.dx - initialPosition.dx;
      numberOfSquares = (differnce / size.width).ceil();
      for (int i = intialSquare + 1;
          i < (intialSquare + numberOfSquares);
          i++) {
        isSelected[i] = true;
      }
      for (int i = 0; i < isSelected.length; i++) {
        if (isSelected[i]) {
          selectedWord += letters[i];
        }
      }
      print(selectedWord);
    } else if ((initialPosition.dx - finalPosition.dx) > 20) {
      print('left');

      // moved left
      differnce = finalPosition.dx + initialPosition.dx;
      numberOfSquares = (differnce / size.width).ceil();
      for (int i = intialSquare - 1;
          i >= (intialSquare - numberOfSquares + 1);
          i--) {
        isSelected[i] = true;
      }
      for (int i = 0; i < isSelected.length; i++) {
        if (isSelected[i]) {
          selectedWord += letters[i];
        }
      }
      print(selectedWord);
    } else if ((finalPosition.dy - initialPosition.dy) > 20) {
      //moved up when moving up/down number of squares numberOfSquares is also number of rows

      differnce = finalPosition.dy - initialPosition.dy;
      numberOfSquares = (differnce / size.height).ceil();

      for (int i = intialSquare + crossAxisCount;
          i < (intialSquare + (numberOfSquares * crossAxisCount));
          i += 4) {
        isSelected[i] = true;
      }
      for (int i = 0; i < isSelected.length; i++) {
        if (isSelected[i]) {
          selectedWord += letters[i];
        }
      }

      print(selectedWord);
    } else if ((initialPosition.dy - finalPosition.dy) > 20) {
      //moved down
      differnce = initialPosition.dy - finalPosition.dy;
      numberOfSquares = (differnce / size.height).ceil();

      for (int i = intialSquare - crossAxisCount;
          i > (intialSquare - (numberOfSquares * crossAxisCount));
          i -= 4) {
        isSelected[i] = true;
        print('$i');
      }
      for (int i = isSelected.length - 1; i >= 0; i--) {
        if (isSelected[i]) {
          selectedWord += letters[i];
        }
      }
      print(selectedWord);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f8f8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: [
              Text('Encuentra una de tus cualidades',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ))
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: GestureDetector(
                child: GridView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: 2,
                  ),
                  children: <Widget>[
                    for (int i = 0; i != lettersMap.length; ++i)
                      Listener(
                        child: Container(
                          key: lettersMap.keys.toList()[i],
                          child: Text(
                            lettersMap.values.toList()[i],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.deepOrangeAccent,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        onPointerDown: (PointerDownEvent event) {
                          final RenderBox renderBox = lettersMap.keys
                              .toList()[i]
                              .currentContext
                              .findRenderObject();
                          size = renderBox.size;
                          setState(() {
                            isSelected[i] = true;
                            intialSquare = i;
                          });
                        },
                      ),
                  ],
                ),
                onTapDown: (TapDownDetails details) {
                  setState(() {
                    initialPosition = Offset(
                      details.globalPosition.dx - 25,
                      details.globalPosition.dy - 25,
                    );
                    initialTappedPosition = Offset(
                      details.globalPosition.dx - 25,
                      details.globalPosition.dy - 25,
                    );
                    isTapped = true;
                  });
                },
                onVerticalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    if (details.delta.dy < 0) {
                      initialTappedPosition = Offset(initialTappedPosition.dx,
                          initialTappedPosition.dy + details.delta.dy);
                      height -= details.delta.dy;
                    } else {
                      height += details.delta.dy;
                    }
                    finalPosition = Offset(
                      details.globalPosition.dx - 25,
                      details.globalPosition.dy - 25,
                    );
                  });
                },
                onHorizontalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    if (details.delta.dx < 0) {
                      initialTappedPosition = Offset(
                        initialTappedPosition.dx + details.delta.dx,
                        initialTappedPosition.dy,
                      );
                      width -= details.delta.dx;
                    } else {
                      width += details.delta.dx;
                    }

                    finalPosition = Offset(
                      details.globalPosition.dx - 25,
                      details.globalPosition.dy - 25,
                    );
                  });
                },
                onHorizontalDragEnd: (DragEndDetails details) {
                  _determineWord();
                },
                onVerticalDragEnd: (DragEndDetails details) {
                  _determineWord();
                },
              ),
            ),
          ),
          Positioned(
            top: initialTappedPosition.dy,
            left: initialTappedPosition.dx,
            child: Container(
              height: height,
              width: width,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(
                    color: isTapped ? Colors.blue : Colors.transparent,
                    width: 3.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
