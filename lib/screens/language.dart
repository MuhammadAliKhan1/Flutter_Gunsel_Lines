import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:flutter/cupertino.dart';

final Color gunselColor = Color(0xff035EA7);

class LanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
      appBarIcon: menuIcon,
      appBarIncluded: true,
      bodyWidget: Language(),
      appBarTitle: 'Languages',
      appBarTitleIncluded: true,
      drawerIncluded: true,
      appBarColor: gunselColor,
      backgroundImage: scaffoldImg,
    );
  }
}

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

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      ListTile(
          leading: Image.asset(
            "assets/ukraine.png",
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
    ]);
  }
}
