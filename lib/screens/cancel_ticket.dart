import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';

class CancelTicketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GunselScaffold(
      appBarIcon: backArrow,
      appBarIncluded: true,
      bodyWidget: CancelTicket(),
      appBarTitle: 'Cancel Ticket',
      appBarTitleIncluded: true,
      drawerIncluded: false,
      backgroundImage: scaffoldImg,
    );
  }
}

class CancelTicket extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CancelTicketState();
  }
}

class CancelTicketState extends State<CancelTicket> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
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
                padding: EdgeInsets.only(right: 10.0, left: 10.0, top: 10.0),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0),
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
                padding: EdgeInsets.only(right: 10.0, left: 10.0, top: 10.0),
                child: TextFormField(
                  style: TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.center,
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
                  style: TextStyle(
                      color: gunselColor,
                      fontSize: 25.0,
                      fontFamily: "Helvetica"),
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
    ]);
  }
}
