import 'package:flutter/material.dart';
import './drawer.dart';

final Color gunselColor = Color(0xff035EA7);

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProfileState();
  }
}

class ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: gunselColor,
        drawer: SideDrawer(),
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: gunselColor,
          centerTitle: true,
          title: Text("Profile"),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 70.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      "images/WP.png",
                    ),
                  ),
                ),
                Positioned(
                  left: 120.0,
                  top: 20.0,
                  child: CircleAvatar(
                    radius: 60.0,
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/150'),
                  ),
                ),
                Positioned(
                  top: 140.0,
                  left: 110.0,
                  child: Text(
                    "Erhan Ozturk",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  top: 165.0,
                  left: 110.0,
                  child: Text(
                    "erhan786@gmail.com",
                  ),
                ),
                Positioned(
                  top: 185.0,
                  left: 130.0,
                  child: Text(
                    "+03133175222",
                  ),
                ),
                Positioned(
                  top: 200.0,
                  left: 20.0,
                  child: Icon(
                    Icons.language,
                    size: 40.0,
                  ),
                ),
                Positioned(
                  top: 200.0,
                  left: 160.0,
                  child: Icon(
                    Icons.language,
                    size: 40.0,
                  ),
                ),
                Positioned(
                  top: 200.0,
                  left: 300.0,
                  child: Icon(
                    Icons.language,
                    size: 40.0,
                  ),
                ),
                Positioned(
                  right: 10.0,
                  top: 60.0,
                  left: 300.0,
                  child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                backgroundColor: gunselColor,
                                title: Text(
                                  "Edit Profile Information",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(top: 50.0),
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              "First Name                    ",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10.0),
                                            ),
                                            Text(
                                              "Last Name",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10.0),
                                            ),
                                          ],
                                        )),
                                    TextFormField(
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return "Please enter your first name";
                                        }
                                      },
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                      ),
                                    ),
                                    TextFormField(
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return "Please enter your first name";
                                        }
                                      },
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                      ),
                                    ),
                                    TextFormField(
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return "Please enter your first name";
                                        }
                                      },
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(top: 30.0),
                                        child: RaisedButton(
                                          child: Text(
                                            "Save Changes",
                                            textScaleFactor: 1.5,
                                            style:
                                                TextStyle(color: gunselColor),
                                          ),
                                          highlightColor: Colors.yellow,
                                          color: Colors.yellow,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(10.0),
                                                topLeft: Radius.circular(10.0)),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              //TODO: Send mail button
                                              debugPrint(
                                                  "Send button is pressed");
                                            });
                                          },
                                        ))
                                  ],
                                ));
                          });
                    },
                  ),
                )
              ],
            )
          ],
        )));
  }
}
