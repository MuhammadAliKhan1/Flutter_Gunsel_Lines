import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/screens/Drawer/drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
              Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                  child: Image.asset(
                    "images/front.webp",
                  )),
              CarouselSlider(
                height: 400.0,
                items: [1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(color: Colors.amber),
                          child: Text(
                            'text $i',
                            style: TextStyle(fontSize: 16.0),
                          ));
                    },
                  );
                }).toList(),
              ),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, articleScreen);
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
                    Navigator.pushNamed(context, articleScreen);
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
                    Navigator.pushNamed(context, articleScreen);
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
                    Navigator.pushNamed(context, articleScreen);
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
                    Navigator.pushNamed(context, articleScreen);
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
