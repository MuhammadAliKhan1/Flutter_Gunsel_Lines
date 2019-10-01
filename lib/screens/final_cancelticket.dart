import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';

import 'package:gunsel/data/sharedPreference.dart';

class FinalCancelTicket extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FinalCancelTicketState();
  }
}

class FinalCancelTicketState extends State<FinalCancelTicket> {
  SharePreferencelogin sh = SharePreferencelogin();
  String cancelTicket = "Cancel Ticket";
  @override
  void initState() {
    super.initState();
    finalCancellan();
  }

  void finalCancellan() async {
    int b;
    int a = await sh.getshared1();

    setState(() {
      b = a;

      if (b == 1) {
        cancelTicket = "Скасувати квиток";
      } else if (b == 2) {
        cancelTicket = "Cancel Ticket";
      } else if (b == 3) {
        cancelTicket = "Отменить билет";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
        appBarIcon: backArrow,
        appBarIncluded: true,
        appBarTitle: cancelTicket,
        appBarTitleIncluded: true,
        drawerIncluded: false,
        backgroundImage: scaffoldImg,
        bodyWidget: ListView(children: <Widget>[
          Container(
            height: 402.0,
            margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: darkBlue,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0))),
                height: 50.0,
                child: Center(
                    child: Text(
                  "Ticket 123-AB-1333-45",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      fontFamily: "Helvetica"),
                )),
              ),
              Container(
                color: Colors.white,
                height: 300.0,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 10.0),
                            child: Text(
                              "Bus type comfort+",
                              style: TextStyle(color: darkBlue),
                            )),
                        Padding(
                            padding: EdgeInsets.only(left: 80.0),
                            child: Text("Kiev",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontFamily: "SFProText")))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 200.0),
                            child: Text(
                              "00:10",
                              style: TextStyle(
                                  color: darkBlue,
                                  fontSize: 60.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Helvetica"),
                            ))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text("25",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 90.0))),
                        Padding(
                            padding: EdgeInsets.only(
                              left: 85.0,
                            ),
                            child: Text("DEPARTURE",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0)))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            "MAY 2018",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 100.0),
                          child: Text(
                            "Krakav",
                            style: TextStyle(
                                fontSize: 20.0, fontFamily: "SFProText"),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 10.0, bottom: 20.0),
                            child: Text(
                              "Seat No 4",
                              style: TextStyle(fontSize: 15.0),
                            )),
                        Padding(
                            padding: EdgeInsets.only(left: 120.0),
                            child: Text(
                              "15:40",
                              style: TextStyle(
                                  color: darkBlue,
                                  fontSize: 60.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Helvetica"),
                            ))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text("Ivonav Sahsa",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: darkBlue,
                                    fontWeight: FontWeight.bold))),
                        Padding(
                            padding: EdgeInsets.only(left: 90.0),
                            child: Text("ARRIVAL",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0))),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 50.0,
                width: 390,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(211, 211, 211, 8),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0))),
                child: Center(
                    child: Padding(
                        padding: EdgeInsets.only(left: 120.0),
                        child: Row(
                          children: <Widget>[
                            Text("448.6 ",
                                style: TextStyle(
                                    color: darkBlue,
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.bold)),
                            Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Text("UAH",
                                    style: TextStyle(
                                        color: darkBlue,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold)))
                          ],
                        ))),
              )
            ]),
          ),
          Container(
            height: 120.0,
            margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.yellow,
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 10.0),
                        child: Text(
                          "Canel fees:",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 70.0, top: 10.0),
                      child: Text("14.4",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0)),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 5.0, top: 15.0),
                        child: Text(
                          "UAH",
                          style: TextStyle(fontSize: 12.0, color: Colors.red),
                        )),
                    Padding(
                        padding: EdgeInsets.only(right: 10.0, top: 10.0),
                        child: Text(" %3", style: TextStyle(fontSize: 23.0)))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 2.0),
                        child: Text(
                          "Total cut:",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 90.0, top: 2.0),
                        child: Text(
                          "17",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 7.0),
                        child: Text(
                          "UAH",
                          style: TextStyle(color: Colors.red),
                        ))
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0))),
                  height: 50.0,
                  child: Row(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: 30.0, top: 5.0),
                          child: Text(
                            "Paid back:",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          )),
                      Padding(
                          padding: EdgeInsets.only(left: 80.0),
                          child: Text("448.6",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35.0,
                                  fontFamily: "Helvetica"))),
                      Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Text(" UAH",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  fontFamily: "Helvetica")))
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 380.0,
            height: 50.0,
            margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: RaisedButton(
              child: Text(
                "Cancel ticket",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontFamily: "SFProText",
                    fontWeight: FontWeight.w600),
              ),
              highlightColor: Colors.red,
              color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25.0),
                    topLeft: Radius.circular(25.0)),
              ),
              onPressed: () {
                setState(() {
                  // TODO: Implement Search button on pressed
                  debugPrint("Sreach button is pressed");
                });
              },
            ),
          ),
        ]));
  }
}
