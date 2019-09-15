import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/screens/Drawer/drawer.dart';

final Color gunselColor = Color(0xff035EA7);

class Language extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LanguageState();
  }
}

class LanguageState extends State<Language> {
  bool checkBox1 = true;
  bool checkBox2 = false;
  bool checkBox3 = false;

  String pathOfchecked = "assets/checked.png";
  String path1 = "assets/checked.png";
  String path2 = "assets/unchecked.png";
  String path3 = "assets/unchecked.png";

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
          key: _scaffoldKey,
          resizeToAvoidBottomPadding: false,
          drawer: SideDrawer(),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: GestureDetector(
                child: Image(
                  image: menuIcon,
                ),
                onTap: () {
                  _scaffoldKey.currentState.openDrawer();
                }),
            backgroundColor: Colors.transparent,
            title: Text("Languages",
                style: TextStyle(fontFamily: "SFProText", fontSize: 22.0)),
            elevation: 0.0,
            centerTitle: true,
          ),
          body: ListView(children: <Widget>[
            ListTile(
                leading: Image.asset(
                  "assets/ukraine_flag.png",
                  height: 25.0,
                ),
                title: Text("YkpaïHcbka",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontFamily: "MyriadPro")),
                trailing: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (checkBox1 == true) {
                          path1 = "assets/checked.png";
                          path2 = "assets/unchecked.png";
                          path3 = "assets/unchecked.png";
                          checkBox1 = true;
                          checkBox2 = false;
                          checkBox3 = false;
                        } else {
                          path1 = "assets/checked.png";
                          path2 = "assets/unchecked.png";
                          path3 = "assets/unchecked.png";
                          checkBox1 = true;
                          checkBox2 = false;
                          checkBox3 = false;
                        }
                      });
                    },
                    child: Image.asset(
                      path1,
                      height: 25.0,
                    ))),
            ListTile(
                leading: Image.asset(
                  "assets/england.png",
                  height: 25.0,
                ),
                title: Text("English",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontFamily: "MyriadPro")),
                trailing: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (checkBox2 == true) {
                          path2 = "assets/checked.png";
                          path1 = "assets/unchecked.png";
                          path3 = "assets/unchecked.png";
                          checkBox2 = true;
                          checkBox1 = false;
                          checkBox3 = false;
                        } else {
                          path2 = "assets/checked.png";
                          path1 = "assets/unchecked.png";
                          path3 = "assets/unchecked.png";
                          checkBox2 = true;
                          checkBox1 = false;
                          checkBox3 = false;
                        }
                      });
                    },
                    child: Image.asset(
                      path2,
                      height: 25.0,
                    ))),
            ListTile(
                leading: Image.asset(
                  "assets/russia.png",
                  height: 25.0,
                ),
                title: Text("Pyccknn",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontFamily: "MyriadPro")),
                trailing: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (checkBox1 == true) {
                          path3 = "assets/checked.png";
                          path1 = "assets/unchecked.png";
                          path2 = "assets/unchecked.png";
                          checkBox3 = true;
                          checkBox1 = false;
                          checkBox2 = false;
                        } else {
                          path3 = "assets/checked.png";
                          path1 = "assets/unchecked.png";
                          path2 = "assets/unchecked.png";
                          checkBox3 = true;
                          checkBox1 = false;
                          checkBox2 = false;
                        }
                      });
                    },
                    child: Image.asset(
                      path3,
                      height: 25.0,
                    )))
          ]),
        )
      ],
    );
  }
}
