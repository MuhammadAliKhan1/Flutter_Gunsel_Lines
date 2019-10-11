import 'package:gunsel/data/constants.dart';
import 'package:gunsel/screens/Drawer/menu_row.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:gunsel/data/sharedPreference.dart';
import 'dart:io';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  SharePreferencelogin sh = SharePreferencelogin();
  String myProfile = "My Profile",
      buyTicket = "Buy Ticket",
      cancelTicket = "Cancel Ticket",
      news = "News",
      language = "Language",
      company = "About Gunsel Lines",
      history = "History of travels";

  bool accountIncluded = true;
  String checkprofileImage = "";
  bool checkImage = false;

  String profileImage = "",
      profilefirstName = "",
      profileEmail = "",
      profileLastName = "";

  @override
  void initState() {
    super.initState();
    drawerlan();
    changeDrawer();

    //accountIncluded = true;
  }

  void drawerlan() async {
    int b;
    int a = await sh.getshared1();

    setState(() {
      b = a;

      if (b == 1) {
        myProfile = "Мій профіль";
        buyTicket = "Купуйте квиток";
        cancelTicket = "Скасувати квиток";
        news = "Новини";
        language = "Мова";
        company = "Про гюнзельні лінії";
        history = "Історія подорожей";
      } else if (b == 2) {
        myProfile = "My Profile";
        buyTicket = "Buy Ticket";
        cancelTicket = "Cancel Ticket";
        news = "News";
        language = "Language";
        company = "About Gunsel Lines";
        history = "History of travels";
      } else if (b == 3) {
        myProfile = "Мой профайл";
        buyTicket = "Купить билет";
        cancelTicket = "Отменить билет";
        news = "Новости";
        language = "язык";
        company = "О Gunsel Линии";
        history = "История путешествий";
      }
    });
  }

  SharePreferencelogin shpref = SharePreferencelogin();

  Future<String> changeDrawer() async {
    String category = await shpref.getloginCategory();

    if (category == "custom" ||
        category == "facebook" ||
        category == "google") {
      accountIncluded = true;
      drawerProfile();
    } else {
      accountIncluded = false;
    }

    //print("Category is"+category);
  }

  Future<String> drawerProfile() async {
    profilefirstName = await shpref.getfirstname();
    profileLastName = await shpref.getlastname();
    profileEmail = await shpref.getemail();

    checkprofileImage = await shpref.getmobileImage();

    if (checkprofileImage == "") {
      profileImage = await shpref.getpicture();
      checkImage = true;
    } else if (checkprofileImage != "") {
      profileImage = checkprofileImage;
      checkImage = false;
    }
  }

  final facebookLogin = FacebookLogin();
  final googleSignin = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: double.infinity,
      child: Stack(
        children: <Widget>[
          Image(
            image: accountIncluded ? drawerAccountImg : drawerNoAccountImg,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15.0),
                height: MediaQuery.of(context).size.height /
                    (accountIncluded ? 2.8 : 4.5),
                child: (accountIncluded
                    ? getAccount(context)
                    : getWihoutAccount(context)),
              ),
              (accountIncluded
                  ? getWithAccountList(context)
                  : getWithOutAccountList(context)),
            ],
          )
        ],
      ),
    );
  }

  getAccount(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Spacer(
                flex: 1,
              ),
              SizedBox(
                width: 30,
              ),
              checkImage
                  ? Container(
                      height: 80.0,
                      width: 80.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(profileImage),
                        ),
                      ),
                    )
                  : Container(
                      height: 80.0,
                      width: 80.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: FileImage(
                              File(profileImage),
                            ),
                          ))),
              Spacer(
                flex: 1,
              ),
              InkWell(
                  onTap: () {
                    _logout();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        oneWayScreen, (Route<dynamic> route) => false);
                    Navigator.pushNamed(context, loginScreen);
                  },
                  child: Image(
                    image: drawerLogoutImg,
                    height: ScreenUtil().setHeight(35),
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "$profilefirstName" + " " + "$profileLastName",
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(
                  40,
                ),
                fontFamily: 'MyriadPro',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Center(
            child: Text(
              profileEmail,
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(
                  30,
                ),
                fontFamily: 'MyriadPro',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  getWihoutAccount(context) {
    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
          onTap: () {
            _logout();
            Navigator.of(context).pushNamedAndRemoveUntil(
                oneWayScreen, (Route<dynamic> route) => false);
            Navigator.pushNamed(context, loginScreen);
          },
          child: Image(
            image: drawerLogoutImg,
            height: ScreenUtil().setHeight(35),
          )),
    );
  }

  getWithAccountList(context) {
    return Flexible(
        child: ListView(
      children: <Widget>[
        MenuRow(
          title: myProfile,
          pngImage: profileIcon,
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                oneWayScreen, (Route<dynamic> route) => false);
            Navigator.pushNamed(context, profileScreen);
          },
          pngImageAllow: true,
        ),
        MenuRow(
          title: buyTicket,
          pngImageAllow: true,
          pngImage: buyIcon,
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                oneWayScreen, (Route<dynamic> route) => false);
          },
        ),
        MenuRow(
          title: cancelTicket,
          pngImageAllow: true,
          pngImage: cancelIcon,
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                oneWayScreen, (Route<dynamic> route) => false);
            Navigator.pushNamed(context, cancelTicketScreen);
          },
        ),
        MenuRow(
          title: history,
          pngImageAllow: true,
          pngImage: historyOfTravelIcon,
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                oneWayScreen, (Route<dynamic> route) => false);
            Navigator.pushNamed(context, historyScreen);
          },
        ),
        MenuRow(
          title: news,
          icon: Icons.new_releases,
          pngImageAllow: true,
          pngImage: newsIcon,
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                oneWayScreen, (Route<dynamic> route) => false);
            Navigator.pushNamed(context, newsScreen);
          },
        ),
        MenuRow(
          title: company,
          pngImageAllow: true,
          pngImage: aboutCompanyIcon,
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                oneWayScreen, (Route<dynamic> route) => false);
            Navigator.pushNamed(context, aboutCompanyScreen);
          },
        ),
        Align(
          alignment:
              Alignment.lerp(Alignment.centerLeft, Alignment.center, 0.8),
          child: Container(
            width: ScreenUtil().setWidth(450),
            height: 40.0,
            child: ButtonTheme(
              buttonColor: Colors.yellow,
              padding: EdgeInsets.only(left: ScreenUtil().setSp(25)),
              child: RaisedButton(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                ),
                onPressed: () {
                  launch('tel:${0800303010}');
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.lerp(
                          Alignment.centerLeft, Alignment.centerRight, 0.0),
                      child: Image(
                        image: telephone,
                        height: 25.0,
                      ),
                    ),
                    Align(
                        child: Text(
                      "0 800 30 30 10",
                      style: TextStyle(
                        color: gunselColor,
                        fontSize: ScreenUtil().setSp(40),
                        fontWeight: FontWeight.w600,
                        fontFamily: "Helvetica",
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }

  getWithOutAccountList(context) {
    return Flexible(
        child: ListView(
      children: <Widget>[
        MenuRow(
          title: buyTicket,
          pngImageAllow: true,
          pngImage: buyIcon,
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                oneWayScreen, (Route<dynamic> route) => false);
          },
        ),
        MenuRow(
          title: cancelTicket,
          pngImageAllow: true,
          pngImage: cancelIcon,
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                oneWayScreen, (Route<dynamic> route) => false);
            Navigator.pushNamed(context, cancelTicketScreen);
          },
        ),
        MenuRow(
          title: news,
          pngImageAllow: true,
          pngImage: newsIcon,
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                oneWayScreen, (Route<dynamic> route) => false);
            Navigator.pushNamed(context, newsScreen);
          },
        ),
        MenuRow(
          title: language,
          pngImageAllow: true,
          pngImage: languageIcon,
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                oneWayScreen, (Route<dynamic> route) => false);
            Navigator.pushNamed(context, languageScreen);
          },
        ),
        MenuRow(
          title: company,
          pngImageAllow: true,
          pngImage: aboutCompanyIcon,
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                oneWayScreen, (Route<dynamic> route) => false);
            Navigator.pushNamed(context, aboutCompanyScreen);
          },
        ),
        Align(
          alignment:
              Alignment.lerp(Alignment.centerLeft, Alignment.center, 0.8),
          child: Container(
            width: ScreenUtil().setWidth(450),
            height: 40.0,
            child: ButtonTheme(
              buttonColor: Colors.yellow,
              padding: EdgeInsets.only(left: ScreenUtil().setSp(25)),
              child: RaisedButton(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                ),
                onPressed: () {
                  launch('tel:${0800303010}');
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.lerp(
                          Alignment.centerLeft, Alignment.centerRight, 0.0),
                      child: Image(
                        image: telephone,
                        height: 25.0,
                      ),
                    ),
                    Align(
                        child: Text(
                      "0 800 30 30 10",
                      style: TextStyle(
                        color: gunselColor,
                        fontSize: ScreenUtil().setSp(40),
                        fontWeight: FontWeight.w600,
                        fontFamily: "Helvetica",
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }

  _logout() {
    SharePreferencelogin shPref = SharePreferencelogin();
    shPref.setshared("", "", "", "", "", "", "", "");
    shPref.setmobileImage("");
    facebookLogin.logOut();
    googleSignin.signOut();

    TokenGetter token = TokenGetter();
    token.getToken();
  }
}
