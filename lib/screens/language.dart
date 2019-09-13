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
                leading: Image.asset("assets/ukraine.png"),
                title: Text("YkpaïHcbka",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontFamily: "MyriadPro")),
                trailing: Image(image: uncheckedBox, height: 25.0)),
            ListTile(
                leading: Image.asset("assets/england.png"),
                title: Text("English",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontFamily: "MyriadPro")),
                trailing: Image(
                  image: uncheckedBox,
                  height: 25.0,
                )),
            ListTile(
                leading: Image.asset("assets/poland.png"),
                title: Text("Pyccknn",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontFamily: "MyriadPro")),
                trailing: Image(
                  image: uncheckedBox,
                  height: 25.0,
                ))
          ]),
        )
      ],
    );
  }
}
