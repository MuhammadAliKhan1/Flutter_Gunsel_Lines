import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';

class AboutCompanyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GunselScaffold(
      appBarIcon: menuIcon,
      appBarIncluded: true,
      bodyWidget: AboutCompany(),
      appBarTitle: 'About Gunsel Lines',
      appBarTitleIncluded: true,
      drawerIncluded: true,
      backgroundImage: whiteImage,
      appBarColor: gunselColor,
    );
  }
}

class AboutCompany extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AboutCompanyState();
  }
}

class AboutCompanyState extends State<AboutCompany> {
  @override
  Widget build(BuildContext context) {
    return Center(
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
                      "<<Gunsel Group>> company was formed in 1997, by starting its first transportation of passengers.\n\n",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontFamily: "Helvetica")),
              TextSpan(
                  text:
                      "Due to high professionalism of the team of the team and modern technical equipment the company soon diversified its activities by adding express- delivery of the email all over Ukraine.\n\n",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontFamily: "Helvetica")),
              TextSpan(
                  text:
                      "Late in 2015 the company got the license of \"Ukrainian Aviation Service\" for excercising international transits, and it began business with \"Turkish Airline Inc.\" that has largest covering in the world.\n\n",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontFamily: "Helvetica")),
              TextSpan(
                  text:
                      "As a result we deliver the cargo to every destination in the world at reasonable tariffs and with high-quality service\n\n",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontFamily: "Helvetica")),
              TextSpan(
                  text:
                      "A year later <<Gunsel Group>> comes to the world market of passenger transportation. In 2016 the first route \"KIEV - WARSAW\" started on regular basis.\n\n",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontFamily: "Helvetica")),
              TextSpan(
                  text:
                      "Having reached best results the <<Gunsel Group>> continues to expand routes map to perform transportation to other European countries\n\n",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontFamily: "Helvetica")),
              TextSpan(
                  text:
                      "We have been a leading company in road transportation for over 20 years.\n\n",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontFamily: "Helvetica")),
              TextSpan(
                  text:
                      "Professionalism, high quolity, performance responsibility, high level comfort and service in the main policy for <<Gunsel Group>> staff\n\n",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
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
    ]));
  }
}
