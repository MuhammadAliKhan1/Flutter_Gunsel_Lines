import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/screens/Drawer/drawer.dart';

final Color gunselColor = Color(0xff035EA7);

class AboutCompany extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AboutCompanyState();
  }
}

class AboutCompanyState extends State<AboutCompany> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomPadding: false,
        drawer: SideDrawer(),
        appBar: AppBar(
          leading: GestureDetector(
              child: Image(
                image: menuIcon,
              ),
              onTap: () {
                _scaffoldKey.currentState.openDrawer();
              }),
          backgroundColor: gunselColor,
          centerTitle: true,
          title: Text("About Gunsel Lines",
              style: TextStyle(fontFamily: "SFProText", fontSize: 22.0)),
          elevation: 0.0,
        ),
        body: Center(
            child: ListView(children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 10.0),
                  child: Text(
                    "About Gunsel",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        fontFamily: "Helvetica"),
                  )),
              Container(
                child: Image(
                  image: aboutImage,
                ),
                padding: EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text:
                          "Brother set had private his letters observe outward resolve. Shutters ye marriage to throwing we as.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontFamily: "Helvetica")),
                  TextSpan(
                      text:
                          "Few hills tears are weeks saw. Partiality insensible celebrated is in. Am offended as wandered thoughts",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontFamily: "Helvetica")),
                  TextSpan(
                      text:
                          "greatest an friendly. Evening covered in he exposed fertile to. Horses seeing at played plenty nature to expect we.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontFamily: "Helvetica")),
                  TextSpan(
                      text:
                          "Her old collecting she considered discovered. So at parties he warrant oh staying. Square new horses and put better end.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontFamily: "Helvetica")),
                  TextSpan(
                      text:
                          "Her old collecting she considered discovered. So at parties he warrant oh staying. Square new horses and put better end.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontFamily: "Helvetica")),
                  TextSpan(
                      text:
                          "Her old collecting she considered discovered. So at parties he warrant oh staying. Square new horses and put better end.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontFamily: "Helvetica")),
                  TextSpan(
                      text:
                          "Her old collecting she considered discovered. So at parties he warrant oh staying. Square new horses and put better end.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontFamily: "Helvetica")),
                  TextSpan(
                      text:
                          "Her old collecting she considered discovered. So at parties he warrant oh staying. Square new horses and put better end.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontFamily: "Helvetica")),
                  TextSpan(
                      text:
                          "Brother set had private his letters observe outward resolve. Shutters ye marriage to throwing we as.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontFamily: "Helvetica")),
                  TextSpan(
                      text:
                          "Brother set had private his letters observe outward resolve. Shutters ye marriage to throwing we as.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontFamily: "Helvetica")),
                  TextSpan(
                      text:
                          "Brother set had private his letters observe outward resolve. Shutters ye marriage to throwing we as.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontFamily: "Helvetica")),
                  TextSpan(
                      text:
                          "Brother set had private his letters observe outward resolve. Shutters ye marriage to throwing we as.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontFamily: "Helvetica")),
                  TextSpan(
                      text:
                          "Brother set had private his letters observe outward resolve. Shutters ye marriage to throwing we as.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontFamily: "Helvetica")),
                  TextSpan(
                      text:
                          "Brother set had private his letters observe outward resolve. Shutters ye marriage to throwing we as.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontFamily: "Helvetica")),
                  TextSpan(
                      text:
                          "Brother set had private his letters observe outward resolve. Shutters ye marriage to throwing we as.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontFamily: "Helvetica")),
                ])),
              ),
              Container(
                height: 15.0,
                width: double.infinity,
                color: gunselColor,
                child: Text(
                  "Version 2.0.6",
                  textAlign: TextAlign.center,
                ),
              )
            ],
          )
        ])));
  }
}
