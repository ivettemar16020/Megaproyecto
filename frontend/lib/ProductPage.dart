import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    String selectedImg;
    String selectTitle;
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    selectedImg = arguments['image'];
    selectTitle = arguments['title'];
    return Scaffold(
      backgroundColor: Color(0xfff8f8f8),
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
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height*0.43,
            width: MediaQuery.of(context).size.width,
            color: Color(0xffc7b8f5),
            child: Container(
              margin: EdgeInsets.only(right: 40, top: 20, bottom: 20),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/path.png'),
                  fit: BoxFit.contain
                )
              ),
            ),
          ),
          Column(
            children: <Widget>[
              SizedBox(height: 90,),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Text('$selectTitle', style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w700
                          ),),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              width: MediaQuery.of(context).size.width*0.7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Curso 3-10 Min', style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600
                                  ),),
                                  SizedBox(height: 10,),
                                  Text('La confianza en uno mismo es el primer secreto del éxito.', style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600
                                  ),),
                                  SizedBox(height: 10,),
                                  Container(
                                    width: MediaQuery.of(context).size.width*0.9,
                                    margin: EdgeInsets.only(right: 20),
                                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(40)),

                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(70),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/$selectedImg.png'),
                                    fit: BoxFit.contain
                                  )
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 5,),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  sessionWidget('Reto 1', true),
                                  //sessionWidget('Session 2', false),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  sessionWidget('Reto 2', false),
                                  //sessionWidget('Session 4', false),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  sessionWidget('Reto 3', false),
                                  //sessionWidget('Session 6', false),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Text('$selectTitle', style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700
                          ),),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                            boxShadow: [BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 15,
                              spreadRadius: 1
                            )]
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(50),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/$selectedImg.png')
                                  )
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Plan 2', style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700
                                    ),),
                                    Text('Sigue cultivandote a ti mismo', style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600
                                    ),)
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: (){},
                                icon: Icon(
                                  Icons.lock_outline,
                                  size: 30,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 30,)
                      ],
                    ),
                  ),
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
  Container sessionWidget(String title, bool activeOrNot)
  {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
        boxShadow: [BoxShadow(
          color: Colors.black.withOpacity(0.15),
          blurRadius: 15,
          spreadRadius: 1
        )]
      ),
      child: Row(
        children: <Widget>[
          Icon(
              (activeOrNot == true) ? Icons.play_circle_filled : Icons.play_circle_outline,
            color: Color(0xff817dc0),
            size: 50,
          ),
          SizedBox(width: 10,),
          Text('$title', style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600
          ),)
        ],
      ),
    );
  }
}