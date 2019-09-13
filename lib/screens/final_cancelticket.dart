import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';

final Color gunselColor = Color(0xff035EA7);

class FinalCancelTicket extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FinalCancelTicketState();
  }
}

class FinalCancelTicketState extends State<FinalCancelTicket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: gunselColor,
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          leading: GestureDetector(
            child: Image(image: backArrow),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: gunselColor,
          centerTitle: true,
          title: Text("Cancel Ticket",
              style: TextStyle(fontFamily: "SFProText", fontSize: 22.0)),
          elevation: 0.0,
        ),
        body: ListView(children: <Widget>[
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
                            padding: EdgeInsets.only(
                              left: 10.0,
                            ),
                            child: Text(
                              "Bus type comfort+",
                              style: TextStyle(color: darkBlue),
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                              left: 80.0,
                            ),
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
                            padding: EdgeInsets.only(
                              left: 10.0,
                            ),
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
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text("Seat No 4")),
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
                                    fontSize: 17.0,
                                    color: darkBlue,
                                    fontWeight: FontWeight.bold))),
                        Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text("ARRIVAL",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 50.0,
                width: 390,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0))),
                child: Center(
                    child: Text("448.6 UAH",
                        style: TextStyle(
                            color: darkBlue,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold))),
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
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Canel fees:",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 30.0,
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 85.0),
                        child: Text(
                          "14.4 UAH %3",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Total Cut:",
                          style: TextStyle(color: Colors.red, fontSize: 30.0),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 120.0),
                        child: Text(
                          "17 UAH",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
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
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            "Paid back:",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.only(left: 80.0),
                          child: Text("448.6 UAH",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                              )))
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
                style: TextStyle(color: Colors.white, fontSize: 30.0),
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
