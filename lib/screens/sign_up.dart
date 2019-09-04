import 'package:flutter/material.dart';
import 'package:gunsel/screens/Drawer/drawer.dart';

final Color gunselColor = Color(0xff035EA7);

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpState();
  }
}

class SignUpState extends State<SignUp> {
  static var _countries = ["Pak", "USA", "Germany"];

  int value;
  @override
  void initState() {
    super.initState();
    this.value = 0;
  }

  bool switchValue = false;

  void switchButton(bool value) {
    setState(() {
      switchValue = value;
    });
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
            title: Text("Registration"),
            elevation: 0.0,
            centerTitle: true,
          ),
          body: Column(children: <Widget>[
            Container(
                height: 460.0,
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
                        //TODO: Name textfield
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Please enter location";
                          }
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),

                  //Surname
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
                            hintText: "Surename",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          flex: 5,
                          child: Container(
                              margin: EdgeInsets.only(
                                  top: 10.0, left: 10.0, right: 10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.white),
                              child: ListTile(
                                title: DropdownButton(
                                  items: _countries
                                      .map((String dropDownStringItem) {
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(dropDownStringItem),
                                    );
                                  }).toList(),
                                  value: "USA",
                                  onChanged: (valueSelectedByUser) {
                                    setState(() {
                                      debugPrint(
                                          "User selected $valueSelectedByUser");
                                    });
                                  },
                                ),
                              ))),
                      Expanded(
                          flex: 5,
                          child: Container(
                              //color: Colors.white,
                              //width: 150.0,
                              margin: EdgeInsets.only(top: 10.0, right: 10.0),
                              //padding: EdgeInsets.only(top: 10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.white),
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
                                    hintText: "Number",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0))),
                              ))),
                    ],
                  ),

                  //Email
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
                            hintText: "Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),

                  //Password
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
                            hintText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),

                  //Re-password
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
                            hintText: "Re-password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
                  Row(
                    children: <Widget>[
                      Switch(
                        value: switchValue,
                        onChanged: (bool value) {
                          switchButton(switchValue);
                        },
                      ),
                      Text(
                        "I read and agree with this agreement",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ])),
            Container(
              width: 340.0,
              margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: RaisedButton(
                child: Text(
                  "Sign Up",
                  textScaleFactor: 1.5,
                  style: TextStyle(color: gunselColor),
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
                    // TODO: Implement Search button on pressed
                    debugPrint("Sign Up button is pressed");
                  });
                },
              ),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "LoginScreen");
                },
                child: Text(
                  "Back to login",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ))
            //
          ]),
        )
      ],
    );
  }
}
