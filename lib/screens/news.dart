import 'package:flutter/material.dart';
import 'package:gunsel/screens/Drawer/drawer.dart';

final Color gunselColor = Color(0xff035EA7);

class News extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewsState();
  }
}

class NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideDrawer(),
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: gunselColor,
          centerTitle: true,
          title: Text("News"),
          elevation: 0.0,
        ),
        body: Center(
            child: ListView(children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                  child: Image.asset(
                    "images/front.webp",
                  )),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "ArticleScreen");
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Image.asset(
                            "images/news1.webp",
                            height: 150.0,
                            width: 150.0,
                          )),
                      Flexible(
                        child: RichText(
                            text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text:
                                  "Esteem spirit temper too say adieus who direct esteem.",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                              text:
                                  "It esteems luckily mr or picture placing drawing no. Apartments frequently or motionless on reasonable projecting expression.",
                              style: TextStyle(color: Colors.black))
                        ])),
                      )
                    ],
                  )),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "ArticleScreen");
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Image.asset(
                            "images/news1.webp",
                            height: 150.0,
                            width: 150.0,
                          )),
                      Flexible(
                        child: RichText(
                            text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text:
                                  "Esteem spirit temper too say adieus who direct esteem.",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                              text:
                                  "It esteems luckily mr or picture placing drawing no. Apartments frequently or motionless on reasonable projecting expression.",
                              style: TextStyle(color: Colors.black))
                        ])),
                      )
                    ],
                  )),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "ArticleScreen");
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Image.asset(
                            "images/news1.webp",
                            height: 150.0,
                            width: 150.0,
                          )),
                      Flexible(
                        child: RichText(
                            text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text:
                                  "Esteem spirit temper too say adieus who direct esteem.",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                              text:
                                  "It esteems luckily mr or picture placing drawing no. Apartments frequently or motionless on reasonable projecting expression.",
                              style: TextStyle(color: Colors.black))
                        ])),
                      )
                    ],
                  )),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "ArticleScreen");
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Image.asset(
                            "images/news1.webp",
                            height: 150.0,
                            width: 150.0,
                          )),
                      Flexible(
                        child: RichText(
                            text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text:
                                  "Esteem spirit temper too say adieus who direct esteem.",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                              text:
                                  "It esteems luckily mr or picture placing drawing no. Apartments frequently or motionless on reasonable projecting expression.",
                              style: TextStyle(color: Colors.black))
                        ])),
                      )
                    ],
                  )),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "ArticleScreen");
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Image.asset(
                            "images/news1.webp",
                            height: 150.0,
                            width: 150.0,
                          )),
                      Flexible(
                        child: RichText(
                            text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text:
                                  "Esteem spirit temper too say adieus who direct esteem.",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                              text:
                                  "It esteems luckily mr or picture placing drawing no. Apartments frequently or motionless on reasonable projecting expression.",
                              style: TextStyle(color: Colors.black))
                        ])),
                      )
                    ],
                  )),
            ],
          )
        ])));
  }
}
