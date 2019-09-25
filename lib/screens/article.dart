import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:html/parser.dart';

class ArticleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
      appBarIcon: backArrow,
      appBarIncluded: true,
      bodyWidget: Article(),
      appBarTitle: 'Article',
      appBarTitleIncluded: true,
      drawerIncluded: false,
      backgroundImage: whiteImage,
    );
  }
}

class Article extends StatefulWidget {
  String text;

  Article({Key key, this.text}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
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
    return Center(
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
    ]));
  }
}
