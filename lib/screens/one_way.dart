import 'package:flutter/material.dart';
import 'package:gunsel/screens/drawer.dart';

final Color gunselColor = Color(0xff035EA7);

class OneWay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OneWayState();
  }
}

class OneWayState extends State<OneWay> {
  //For Calendar
  String _value = "";
  Future _selectDate() async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2019),
      lastDate: new DateTime(2050),
    );
    if (picked != null) setState(() => _value = picked.toString());
  }

  //For number counter
  int value;
  @override
  void initState() {
    super.initState();
    this.value = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/BG.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          height: double.infinity,
          width: double.infinity,
        ),
        Scaffold(
          resizeToAvoidBottomPadding: false,
          drawer: SideDrawer(),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text("Search Ticket"),
            elevation: 0.0,
            centerTitle: true,
          ),
          body: Column(children: <Widget>[
            Container(
                height: 380.0,
                width: 400.0,
                margin: EdgeInsets.only(
                    right: 10.0, left: 10.0, bottom: 10.0, top: 10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.white),
                    color: Colors.transparent),
                child: ListView(children: <Widget>[
                  Row(children: <Widget>[
                    //One way button
                    Padding(
                        padding: EdgeInsets.only(left: 80.0),
                        child: RaisedButton(
                          child: Text(
                            "ONE WAY",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          color: Colors.yellow,
                          highlightColor: Colors.yellow,
                          onPressed: () {
                            debugPrint("ONE WAY is pressed");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OneWay()));
                          },
                        )),

                    //Round way text
                    Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: GestureDetector(
                          child: Text(
                            "ROUND WAY",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            debugPrint("ROUND TRIP is pressed");
                            Navigator.pushNamed(context, 'RoundWayScreen');
                          },
                        ))
                  ]),

                  //Departure city textfield
                  Padding(
                      padding:
                          EdgeInsets.only(right: 10.0, left: 10.0, top: 10.0),
                      child: TextFormField(
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Please enter departure city";
                          }
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: Icon(Icons.location_on),
                            hintText: "Enter departure city",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),

                  //Arrival city textfield
                  Padding(
                      padding:
                          EdgeInsets.only(right: 10.0, left: 10.0, top: 10.0),
                      child: TextFormField(
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Please enter arrival city";
                          }
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: Icon(Icons.location_on),
                            hintText: "Enter arrival city",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),

                  //Calendar
                  Padding(
                      padding:
                          EdgeInsets.only(right: 10.0, left: 10.0, top: 10.0),
                      child: InkWell(
                          onTap: () {
                            _selectDate();
                          },
                          child: IgnorePointer(
                              child: TextFormField(
                            //validator: validateDob,
                            validator: (String _value) {
                              debugPrint("$_value");
                            },
                            keyboardType: TextInputType.datetime,
                            //controller: ,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                prefixIcon: Icon(Icons.date_range),
                                hintText: "08/09/2019",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                          )))),

                  //Number of passenger text
                  Padding(
                      padding:
                          EdgeInsets.only(left: 28.0, right: 10.0, top: 10.0),
                      child: Row(children: <Widget>[
                        Text(
                          "Number Of Passenger:",
                          textScaleFactor: 1.2,
                          style: TextStyle(color: Colors.white),
                        ),
                        Container(width: 5.0),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.white,
                            ),
                            child: Row(children: <Widget>[
                              //Plus icon
                              IconButton(
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    this.value++;
                                  });
                                },
                              ),

                              //Number
                              Text(
                                this.value.toString(),
                                style: TextStyle(color: Colors.black),
                              ),

                              //Minus icon
                              IconButton(
                                icon: Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    this.value--;
                                  });
                                },
                              ),
                            ])),
                      ])),
                  Row(
                    children: <Widget>[
                      //Change station button
                      Expanded(
                          child: Container(
                        margin:
                            EdgeInsets.only(right: 10.0, left: 10.0, top: 10.0),
                        child: RaisedButton(
                          child: Text("Change Station",
                              textScaleFactor: 1.1,
                              style: TextStyle(
                                color: gunselColor,
                              )),
                          highlightColor: Colors.yellow,
                          color: Colors.yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10.0),
                                topLeft: Radius.circular(10.0)),
                          ),
                          onPressed: () {
                            setState(() {
                              //TODO: Navigator of change station
                              //Navigator.pushNamed(context, "SearchTicketScreen");
                              debugPrint("Change Station button is pressed");
                            });
                          },
                        ),
                      )),

                      //Search button
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.only(right: 10.0, top: 10.0),
                        child: RaisedButton(
                          child: Text("Search",
                              textScaleFactor: 1.1,
                              style: TextStyle(
                                color: gunselColor,
                              )),
                          highlightColor: Colors.yellow,
                          color: Colors.yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10.0),
                                topLeft: Radius.circular(10.0)),
                          ),
                          onPressed: () {
                            setState(() {
                              Navigator.pushNamed(
                                  context, "SearchTicketScreen");
                              debugPrint("Sreach button is pressed");
                            });
                          },
                        ),
                      )),
                    ],
                  )
                ])),
          ]),
        )
      ],
    );
  }
}
