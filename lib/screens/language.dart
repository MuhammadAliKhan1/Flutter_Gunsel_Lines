import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:gunsel/data/sharedPreference.dart';

final Color gunselColor = Color(0xff035EA7);

class LanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
      appBarIcon: menuIcon,
      appBarIncluded: true,
      bodyWidget: Language(),
      appBarTitle: "Language",
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
  String lan1 = "Українська", lan2 = "English", lan3 = "Pусский";
  SharePreferencelogin sh = SharePreferencelogin();
  bool checkBox1 = false;
  bool checkBox2 = true;
  bool checkBox3 = false;

  String pathOfchecked = "assets/checked.png";
  String path1 = "assets/unchecked.png";
  String path2 = "assets/checked.png";
  String path3 = "assets/unchecked.png";

  @override
  void initState() {
    checkedStart();
    super.initState();
  }

  void checkedStart() async {
    int checkshared = await sh.getshared1();
    print(checkshared);
    if (checkshared == 1) {
      checked1();
    } else if (checkshared == 2) {
      checked2();
    } else if (checkshared == 3) {
      checked3();
    }
  }

  void checked1() {
    setState(() {
      if (checkBox1 == true) {
        path1 = "assets/checked.png";
        path2 = "assets/unchecked.png";
        path3 = "assets/unchecked.png";
        checkBox1 = true;
        checkBox2 = false;
        checkBox3 = false;
        sh.setshared1(1);
        // chLanguage();
        // print(sh.getshared1().toString());

      } else {
        path1 = "assets/checked.png";
        path2 = "assets/unchecked.png";
        path3 = "assets/unchecked.png";
        checkBox1 = true;
        checkBox2 = false;
        checkBox3 = false;
        sh.setshared1(1);
        //chLanguage();
        //print(sh.getshared1().toString());

      }
    });
  }

  void checked2() {
    setState(() {
      if (checkBox2 == true) {
        path2 = "assets/checked.png";
        path1 = "assets/unchecked.png";
        path3 = "assets/unchecked.png";
        checkBox2 = true;
        checkBox1 = false;
        checkBox3 = false;
        sh.setshared1(2);
        //chLanguage();

      } else {
        path2 = "assets/checked.png";
        path1 = "assets/unchecked.png";
        path3 = "assets/unchecked.png";
        checkBox2 = true;
        checkBox1 = false;
        checkBox3 = false;
        sh.setshared1(2);

        //chLanguage();

      }
    });
  }

  void checked3() {
    setState(() {
      if (checkBox3 == true) {
        path3 = "assets/checked.png";
        path1 = "assets/unchecked.png";
        path2 = "assets/unchecked.png";
        checkBox3 = true;
        checkBox1 = false;
        checkBox2 = false;
        sh.setshared1(3);

        //chLanguage();
        // print(sh.getshared1().toString());
      } else {
        path3 = "assets/checked.png";
        path1 = "assets/unchecked.png";
        path2 = "assets/unchecked.png";
        checkBox3 = true;
        checkBox1 = false;
        checkBox2 = false;
        sh.setshared1(3);

        //chLanguage();
        //print(sh.getshared1().toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      ListTile(
          leading: Image.asset(
            "assets/ukraine.png",
            height: 25.0,
          ),
          title: Text(lan1,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontFamily: "MyriadPro")),
          trailing: GestureDetector(
              onTap: () {
                checked1();
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
          title: Text(lan2,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontFamily: "MyriadPro")),
          trailing: GestureDetector(
              onTap: () {
                checked2();
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
          title: Text(lan3,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontFamily: "MyriadPro")),
          trailing: GestureDetector(
              onTap: () {
                checked3();
              },
              child: Image.asset(
                path3,
                height: 25.0,
              )))
    ]);
  }
}
