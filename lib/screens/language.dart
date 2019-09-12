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
            backgroundColor: Colors.transparent,
            title: Text("Languages"),
            elevation: 0.0,
            centerTitle: true,
          ),
          body: ListView(children: <Widget>[
            ListTile(
              title: Row(children: <Widget>[
                Image.asset("assets/ukraine.png"),
                Text("    ykpaïHcbka                           ",
                    style: TextStyle(color: Colors.white, fontSize: 20.0)),
                Image(image: uncheckedBox)
              ]),
            ),
            ListTile(
              title: Row(children: <Widget>[
                Image.asset("assets/czech.png"),
                Text("    English                                   ",
                    style: TextStyle(color: Colors.white, fontSize: 20.0)),
                Image(image: uncheckedBox)
              ]),
            ),
            ListTile(
              title: Row(children: <Widget>[
                Image.asset("assets/poland.png"),
                Text("    pyccknn                                 ",
                    style: TextStyle(color: Colors.white, fontSize: 20.0)),
                Image(image: uncheckedBox)
              ]),
            )
          ]),
        )
      ],
    );
  }
}
