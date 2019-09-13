import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';

class Article extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ArticleState();
  }
}

class ArticleState extends State<Article> {
  final Color gunselColor = Color(0xff035EA7);

  //Variable for paading or margin etc
  final double _ten = 10.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          leading: GestureDetector(
            child: Image.asset("assets/backArrow_2.png"),
            onTap: () {
              Navigator.pushNamed(context, newsScreen);
            },
          ),
          backgroundColor: gunselColor,
          centerTitle: true,
          title: Text("Article",
              style: TextStyle(fontFamily: "SFProText", fontSize: 22.0)),
          elevation: 0.0,
        ),
        body: Center(
            child: ListView(children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Heading of the article
              Padding(
                  padding: EdgeInsets.only(top: _ten, left: _ten),
                  child: Text(
                    "Brother set had private his letters",
                    style: TextStyle(
                        color: darkBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: _ten * 2,
                        fontFamily: "MyriadPro"),
                  )),

              //Article image
              Container(
                child: Image.asset("images/front.webp"),
                padding: EdgeInsets.all(_ten),
              ),

              //Article text
              Padding(
                  padding: EdgeInsets.only(left: _ten, right: _ten),
                  child: RichText(
                      text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text:
                            "Brother set had private his letters observe outward resolve. Shutters ye marriage to throwing we as.",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "MyriadPro",
                            fontSize: _ten + 5)),
                    TextSpan(
                        text:
                            "Few hills tears are weeks saw. Partiality insensible celebrated is in. Am offended as wandered thoughts",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: _ten + 5,
                            fontFamily: "MyriadPro")),
                    TextSpan(
                        text:
                            "greatest an friendly. Evening covered in he exposed fertile to. Horses seeing at played plenty nature to expect we.",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: _ten + 5,
                            fontFamily: "MyriadPro")),
                    TextSpan(
                        text:
                            "Her old collecting she considered discovered. So at parties he warrant oh staying. Square new horses and put better end.",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: _ten + 5,
                            fontFamily: "MyriadPro")),
                    TextSpan(
                        text:
                            "Her old collecting she considered discovered. So at parties he warrant oh staying. Square new horses and put better end.",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: _ten + 5,
                            fontFamily: "MyriadPro")),
                    TextSpan(
                        text:
                            "Her old collecting she considered discovered. So at parties he warrant oh staying. Square new horses and put better end.",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: _ten + 5,
                            fontFamily: "MyriadPro")),
                    TextSpan(
                        text:
                            "Her old collecting she considered discovered. So at parties he warrant oh staying. Square new horses and put better end.",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: _ten + 5,
                            fontFamily: "MyriadPro")),
                    TextSpan(
                        text:
                            "Her old collecting she considered discovered. So at parties he warrant oh staying. Square new horses and put better end.",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: _ten + 5,
                            fontFamily: "MyriadPro")),
                    TextSpan(
                        text:
                            "Brother set had private his letters observe outward resolve. Shutters ye marriage to throwing we as.",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: _ten + 5,
                            fontFamily: "MyriadPro")),
                    TextSpan(
                        text:
                            "Brother set had private his letters observe outward resolve. Shutters ye marriage to throwing we as.",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: _ten + 5,
                            fontFamily: "MyriadPro")),
                    TextSpan(
                        text:
                            "Brother set had private his letters observe outward resolve. Shutters ye marriage to throwing we as.",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: _ten + 5,
                            fontFamily: "MyriadPro")),
                    TextSpan(
                        text:
                            "Brother set had private his letters observe outward resolve. Shutters ye marriage to throwing we as.",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: _ten + 5,
                            fontFamily: "MyriadPro")),
                    TextSpan(
                        text:
                            "Brother set had private his letters observe outward resolve. Shutters ye marriage to throwing we as.",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: _ten + 5,
                            fontFamily: "MyriadPro")),
                    TextSpan(
                        text:
                            "Brother set had private his letters observe outward resolve. Shutters ye marriage to throwing we as.",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: _ten + 5,
                            fontFamily: "MyriadPro")),
                    TextSpan(
                        text:
                            "Brother set had private his letters observe outward resolve. Shutters ye marriage to throwing we as.",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: _ten + 5,
                            fontFamily: "MyriadPro")),
                  ]))),
            ],
          )
        ])));
  }
}
