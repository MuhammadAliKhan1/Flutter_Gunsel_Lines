import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/screens/Drawer/drawer.dart';

final Color gunselColor = Color(0xff035EA7);

class CancelTicket extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CancelTicketState();
  }
}

class CancelTicketState extends State<CancelTicket> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: scaffoldImg,
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
            leading: GestureDetector(
              child: Image(image: backArrow),
              onTap: () {
                Navigator.pushNamed(context, oneWayScreen);
              },
            ),
            backgroundColor: Colors.transparent,
            title: Text("Cancel Ticket"),
            elevation: 0.0,
            centerTitle: true,
          ),
          body: Column(children: <Widget>[
            Container(
                height: 200.0,
                margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListView(children: <Widget>[
                  //Name
                  Padding(
                      padding:
                          EdgeInsets.only(right: 10.0, left: 10.0, top: 10.0),
                      child: TextFormField(
                        //TODO: Secure Code textfield
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Please enter location";
                          }
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Secure code",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),

                  //Ticket number
                  Padding(
                      padding:
                          EdgeInsets.only(right: 10.0, left: 10.0, top: 10.0),
                      child: TextFormField(
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Please enter location";
                          }
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Ticket number",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
                  Container(
                    width: 340.0,
                    margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                    child: RaisedButton(
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: gunselColor, fontSize: 25.0),
                      ),
                      highlightColor: Colors.yellow,
                      color: Colors.yellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0)),
                      ),
                      onPressed: () {
                        setState(() {
                          Navigator.pushNamed(context, finalCancelTicketScreen);
                          debugPrint("Cancel button is pressed");
                        });
                      },
                    ),
                  ),
                ])),
          ]),
        )
      ],
    );
  }
}
