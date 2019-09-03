import 'package:flutter/material.dart';

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
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: gunselColor,
          centerTitle: true,
          title: Text("Cancel Ticket"),
        ),
        body: Column(children: <Widget>[
          Container(
            height: 402.0,
            margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0))),

                //width: 338.0,
                height: 50.0,
                child: Center(
                    child: Text(
                  "Ticket 123-AB-1333-45",
                  style: TextStyle(color: Colors.white),
                  textScaleFactor: 1.5,
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
                              style: TextStyle(color: Colors.blue),
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                              left: 80.0,
                            ),
                            child: Text("Kiev",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20.0)))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 200.0),
                            child: Text(
                              "00:10",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.bold),
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
                            child: Text("Departure",
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
                            style: TextStyle(fontSize: 15.0),
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
                                  color: Colors.blue,
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text("Ivonav Sahsa",
                                style: TextStyle(
                                    color: Colors.blue,
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
                color: Colors.grey,
                height: 50.0,
                width: 390,
                child: Center(
                    child: Text("448.6 UAH",
                        textScaleFactor: 1.5,
                        style: TextStyle(color: Colors.blue))),
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
                    Text(
                      "Canel fees:",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 30.0,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 85.0),
                        child: Text(
                          "14.4 UAH %3",
                          textScaleFactor: 1.2,
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
                  color: Colors.orange,
                  height: 49.0,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Paid back:",
                        style: TextStyle(color: Colors.white, fontSize: 30.0),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 120.0),
                          child: Text(
                            "448.6 UAH",
                            textScaleFactor: 1.2,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 380.0,
            margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: RaisedButton(
              child: Text(
                "Cancel",
                textScaleFactor: 1.5,
                style: TextStyle(color: Colors.white),
              ),
              highlightColor: Colors.red,
              color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0)),
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
