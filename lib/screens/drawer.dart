import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final Color gunselColor = Color(0xff035EA7);

class SideDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SideDrawerState();
  }
}

class SideDrawerState extends State<SideDrawer> {
  Widget loginSVG = SvgPicture.asset(
    'assets/logout.svg',
    color: Colors.white,
    height: 20,
    width: 20,
  );

  @override
  Widget build(BuildContext context) {
    InkWell(
        onTap: () {
          Navigator.pushNamed(context, "LoginScreen");
        },
        child: loginSVG);
    final Stack withAccount = Stack(
      children: <Widget>[
        Container(
          height: 350.0,
          decoration: BoxDecoration(),
          child: Image.asset(
            "images/DrawerBG.jpg",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10.0, right: 20.0, left: 10.0),
              child: SizedBox(
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: loginSVG,
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Icon(
                        Icons.person_pin,
                        color: Colors.white,
                        size: 80.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Erhan Ozturk",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "khanali198361@gmail.com",
                          style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: Icon(
                              Icons.person_outline,
                              size: 25.0,
                              color: gunselColor,
                            ),
                            title: Text(
                              "My Profile",
                              style:
                                  TextStyle(color: gunselColor, fontSize: 18.0),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, "ProfileScreen");
                            },
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.pushNamed(context, 'OneWayScreen');
                            },
                            leading: Icon(
                              //TODO: Set to ticket SVG (See Documentation)
                              Icons.add_circle_outline,
                              size: 25.0,
                              color: gunselColor,
                            ),
                            title: Text(
                              "Buy Ticket",
                              style:
                                  TextStyle(color: gunselColor, fontSize: 18.0),
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              //TODO: Set to cancel ticket SVG (See Documentation)
                              Icons.cancel,
                              size: 25.0,
                              color: gunselColor,
                            ),
                            title: Text(
                              "Cancel Ticket",
                              style:
                                  TextStyle(color: gunselColor, fontSize: 18.0),
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                  context, "CancelTicketScreen");
                            },
                          ),
                          ListTile(
                            //TODO: Ontap to History of travel screen
                            onTap: () {},
                            leading: Icon(
                              Icons.timer,
                              size: 25.0,
                              color: gunselColor,
                            ),
                            title: Text(
                              "History of travels",
                              style:
                                  TextStyle(color: gunselColor, fontSize: 18.0),
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.pushNamed(context, "NewsScreen");
                            },
                            leading: Icon(
                              //TODO: News icon (see documentation)
                              Icons.info_outline,
                              size: 25.0,
                              color: gunselColor,
                            ),
                            title: Text(
                              "News",
                              style:
                                  TextStyle(color: gunselColor, fontSize: 18.0),
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, "AboutCompanyScreen");
                            },
                            leading: Icon(
                              //TODO: set to briefcase SVG (See documentation)
                              Icons.card_travel,
                              size: 25.0,
                              color: gunselColor,
                            ),
                            title: Text(
                              "About Company",
                              style:
                                  TextStyle(color: gunselColor, fontSize: 18.0),
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.pushNamed(context, "LoginScreen");
                            },
                            leading: Icon(
                              //TODO: set to briefcase SVG (See documentation)
                              Icons.account_box,
                              size: 25.0,
                              color: gunselColor,
                            ),
                            title: Text(
                              "Login",
                              style:
                                  TextStyle(color: gunselColor, fontSize: 18.0),
                            ),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.only(top: 50.0, left: 40.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          child: ButtonTheme(
                              buttonColor: Colors.yellow,
                              minWidth: 150.0,
                              child: RaisedButton(
                                padding: EdgeInsets.only(),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0),
                                )),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        margin: EdgeInsets.only(
                                            left: 20.0, right: 20.0),
                                        child: Icon(
                                          Icons.phone_in_talk,
                                          color: gunselColor,
                                        )),
                                    Text(
                                      "0 800 25 25 10",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: gunselColor,
                                      ),
                                    ),
                                  ],
                                ),
                                elevation: 3.0,
                                onPressed: () {},
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
    final Stack withoutAccount = Stack(
      children: <Widget>[
        Container(
          height: 150.0,
          child: Image.asset(
            "images/DrawerBG.jpg",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10.0, right: 20.0, left: 10.0),
              child: SizedBox(
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: loginSVG,
                    ),
                    Padding(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            //TODO: Set to Search travel screen One way according to documentation
                            onTap: () {
                              Navigator.pushNamed(context, 'RoundWayScreen');
                            },
                            leading: Icon(
                              //TODO: Set to ticket SVG (See Documentation)
                              Icons.add_circle_outline,
                              size: 25.0,
                              color: gunselColor,
                            ),
                            title: Text(
                              "Buy Ticket",
                              style:
                                  TextStyle(color: gunselColor, fontSize: 18.0),
                            ),
                          ),
                          ListTile(
                            //TODO: Ontap to Cancel Ticket screen
                            leading: Icon(
                              //TODO: Set to cancel ticket SVG (See Documentation)
                              Icons.cancel,
                              size: 25.0,
                              color: gunselColor,
                            ),
                            title: Text(
                              "Cancel Ticket",
                              style:
                                  TextStyle(color: gunselColor, fontSize: 18.0),
                            ),
                          ),
                          ListTile(
                            //TODO: Ontap to news screen
                            onTap: () {},
                            leading: Icon(
                              //TODO: set to news icon (see documentation)
                              Icons.info,
                              size: 25.0,
                              color: gunselColor,
                            ),
                            title: Text(
                              "News",
                              style:
                                  TextStyle(color: gunselColor, fontSize: 18.0),
                            ),
                          ),
                          ListTile(
                            //TODO: On tap language screen
                            onTap: () {},
                            leading: Icon(
                              //TODO: set to globe icon (see documentation)
                              Icons.cloud_circle,
                              size: 25.0,
                              color: gunselColor,
                            ),
                            title: Text(
                              "Language",
                              style:
                                  TextStyle(color: gunselColor, fontSize: 18.0),
                            ),
                          ),
                          ListTile(
                            //TODO: Set ontap to about company screen
                            onTap: () {},
                            leading: Icon(
                              //TODO: set to briefcase SVG (See documentation)
                              Icons.card_travel,
                              size: 25.0,
                              color: gunselColor,
                            ),
                            title: Text(
                              "About Company",
                              style:
                                  TextStyle(color: gunselColor, fontSize: 18.0),
                            ),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.only(top: 50.0, left: 40.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          child: ButtonTheme(
                              buttonColor: Colors.yellow,
                              minWidth: 150.0,
                              child: RaisedButton(
                                padding: EdgeInsets.only(),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0),
                                )),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        margin: EdgeInsets.only(
                                            left: 20.0, right: 20.0),
                                        child: Icon(
                                          Icons.phone_in_talk,
                                          color: gunselColor,
                                        )),
                                    Text(
                                      "0 800 25 25 10",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: gunselColor,
                                      ),
                                    ),
                                  ],
                                ),
                                elevation: 3.0,
                                onPressed: () {},
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
    return Drawer(
      child: withAccount,
    );
  }
}
