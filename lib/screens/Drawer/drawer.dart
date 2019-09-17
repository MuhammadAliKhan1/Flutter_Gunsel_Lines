import 'package:gunsel/data/constants.dart';

import 'package:gunsel/screens/Drawer/menu_row.dart';
import 'package:url_launcher/url_launcher.dart';

bool accountIncluded = false;

class SideDrawer extends StatelessWidget {
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
              Image(
                image: profileHolder,
                height: ScreenUtil().setHeight(130),
              ),
              Spacer(
                flex: 1,
              ),
              InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        oneWayScreen, (Route<dynamic> route) => false);
                    Navigator.pushNamed(context, loginScreen);
                  },
                  child: Image(
                    image: drawerLogoutImg,
                    height: ScreenUtil().setHeight(40),
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "Erhan Ozturk",
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
              "ozturk123@gunsel.com",
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
            Navigator.of(context).pushNamedAndRemoveUntil(
                oneWayScreen, (Route<dynamic> route) => false);
            Navigator.pushNamed(context, loginScreen);
          },
          child: Image(
            image: drawerLogoutImg,
            height: ScreenUtil().setHeight(40),
          )),
    );
  }

  getWithAccountList(context) {
    return Flexible(
        child: ListView(
      children: <Widget>[
        MenuRow(
          title: 'My Profile',
          pngImage: profileIcon,
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                oneWayScreen, (Route<dynamic> route) => false);
            Navigator.pushNamed(context, profileScreen);
          },
          pngImageAllow: true,
        ),
        MenuRow(
          title: 'Buy Ticket',
          pngImageAllow: true,
          pngImage: buyIcon,
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                oneWayScreen, (Route<dynamic> route) => false);
          },
        ),
        MenuRow(
          title: 'Cancel Ticket',
          pngImageAllow: true,
          pngImage: cancelIcon,
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                oneWayScreen, (Route<dynamic> route) => false);
            Navigator.pushNamed(context, cancelTicketScreen);
          },
        ),
        MenuRow(
          title: 'History of travels',
          pngImageAllow: true,
          pngImage: historyOfTravelIcon,
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                oneWayScreen, (Route<dynamic> route) => false);
            Navigator.pushNamed(context, historyScreen);
          },
        ),
        MenuRow(
          title: 'News',
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
          title: 'About Gunsel Lines',
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
          title: 'Buy Ticket',
          pngImageAllow: true,
          pngImage: buyIcon,
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                oneWayScreen, (Route<dynamic> route) => false);
          },
        ),
        MenuRow(
          title: 'Cancel Ticket',
          pngImageAllow: true,
          pngImage: cancelIcon,
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                oneWayScreen, (Route<dynamic> route) => false);
            Navigator.pushNamed(context, cancelTicketScreen);
          },
        ),
        MenuRow(
          title: 'News',
          pngImageAllow: true,
          pngImage: newsIcon,
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                oneWayScreen, (Route<dynamic> route) => false);
            Navigator.pushNamed(context, newsScreen);
          },
        ),
        MenuRow(
          title: 'Language',
          pngImageAllow: true,
          pngImage: languageIcon,
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                oneWayScreen, (Route<dynamic> route) => false);
            Navigator.pushNamed(context, languageScreen);
          },
        ),
        MenuRow(
          title: 'About Gunsel Lines',
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
}
