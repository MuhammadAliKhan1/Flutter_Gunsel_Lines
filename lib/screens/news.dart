import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/screens/Drawer/drawer.dart';

final Color gunselColor = Color(0xff035EA7);

class News extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
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
              Container(
                padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                height: 200.0,
                child: Carousel(
                  images: [frontNews, frontNews],
                  autoplay: true,
                  indicatorBgPadding: 10.0,
                  dotColor: Colors.blueAccent,
                  dotBgColor: Colors.transparent,
                  dotSize: 5.0,
                ),
              ),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, articleScreen);
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(left: 7.0, right: 7.0),
                          child: Image(
                            image: news,
                            height: 140.0,
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
                    Navigator.pushNamed(context, articleScreen);
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(left: 7.0, right: 7.0),
                          child:
                              Image(image: news, height: 120.0, width: 150.0)),
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
                    Navigator.pushNamed(context, articleScreen);
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(left: 7.0, right: 7.0),
                          child:
                              Image(image: news, height: 120.0, width: 150.0)),
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
                    Navigator.pushNamed(context, articleScreen);
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(left: 7.0, right: 7.0),
                          child:
                              Image(image: news, height: 120.0, width: 150.0)),
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
                    Navigator.pushNamed(context, articleScreen);
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(left: 7.0, right: 7.0),
                          child:
                              Image(image: news, height: 120.0, width: 150.0)),
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
