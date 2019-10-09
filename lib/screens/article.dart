import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:html/parser.dart';
import 'package:gunsel/data/sharedPreference.dart';

class ArticleScreen extends StatefulWidget {
  String text, title, imageURL;
  ArticleScreen({Key key, this.text, this.title, this.imageURL})
      : super(key: key);

  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  SharePreferencelogin sh = SharePreferencelogin();
  String searchTicket = "Article";

  void searchTicketlan() async {
    int b;
    int a = await sh.getshared1();

    setState(() {
      b = a;

      if (b == 1) {
        searchTicket = "Стаття";
      } else if (b == 2) {
        searchTicket = "Article";
      } else if (b == 3) {
        searchTicket = "Статья";
      }
    });
  }

  @override
  void initState() {
    super.initState();
    searchTicketlan();
  }

  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
      appBarColor: gunselColor,
      appBarIcon: backArrow,
      appBarIncluded: true,
      bodyWidget: Article(
        text: this.widget.text,
        title: this.widget.title,
        imageURL: this.widget.imageURL,
      ),
      appBarTitle: searchTicket,
      appBarTitleIncluded: true,
      drawerIncluded: true,
      backgroundImage: whiteImage,
    );
  }
}

class Article extends StatefulWidget {
  String text, title, imageURL;

  Article({Key key, this.text, this.title, this.imageURL}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ArticleState(this.text, this.title, this.imageURL);
  }
}

class ArticleState extends State<Article> {
  String texts;
  String httexts;
  String contentTitle;
  String imageURL;

  ArticleState(this.texts, this.contentTitle, this.imageURL);

  @override
  void initState() {
    print("Hellosdsdsdsd:" + texts);
    httexts = _parseHtmlString(texts);
    print(contentTitle);
    contentTitle = _parseHtmlString(contentTitle);

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
                contentTitle,
                style: TextStyle(
                    color: darkBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: _ten * 2,
                    fontFamily: "MyriadPro"),
              )),

          //Article image
          Container(
            child: Image.network(imageURL),
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
