import 'package:flutter/material.dart';
import 'package:gunsel/screens/drawer.dart';

final Color gunselColor = Color(0xff035EA7);

class CancelTicket extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CancelTicketState();
  }
}

class CancelTicketState extends State<CancelTicket> {
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
    this.value = 0;
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
                            hintText: "Secure Code",
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
                        textScaleFactor: 1.5,
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
                          Navigator.pushNamed(
                              context, 'FinalCancelTicketScreen');
                          debugPrint("Sreach button is pressed");
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
