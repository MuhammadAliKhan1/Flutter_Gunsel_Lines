import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:html/parser.dart';
import 'news.dart';

class Article extends StatefulWidget {
  String text;

  Article({Key key, @required this.text}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ArticleState(this.text);
  }
}

class ArticleState extends State<Article> {
  String texts;
  String httexts;
  ArticleState(this.texts);

  @override
  void initState() {
    print("Hellosdsdsdsd:" + texts);
    httexts = _parseHtmlString(texts);

    // TODO: implement initState
    super.initState();
  }

  String _parseHtmlString(String htmlString) {
    var document = parse(htmlString);
    String parsedString = parse(document.body.text).documentElement.text;
    return parsedString;
  }

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
              Navigator.pop(context);
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
                        text: httexts + "",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "MyriadPro",
                            fontSize: _ten + 5)),
                  ]))),
            ],
          )
        ])));
  }
}
