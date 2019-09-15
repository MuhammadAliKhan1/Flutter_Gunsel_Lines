import 'package:gunsel/data/constants.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GunselScaffold(
        appBarIcon: menuIcon,
        appBarIncluded: true,
        appBarColor: gunselColor,
        appBarTitleIncluded: true,
        appBarTitle: 'Profile',
        drawerIncluded: true,
        backgroundImage: profileScreenBackground,
        bodyWidget: SingleChildScrollView(
          child: ProfileScreen(),
          padding: EdgeInsets.only(top: 30.0),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: FittedBox(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: MediaQuery.of(context).size.height / 1.3,
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height / 1.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                Radius.circular(10),
              )),
              child: Image(
                image: person,
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width / 1.2 - 46,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(15),
                      height: 95,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog();
                                });
                          },
                          child: Image(
                            image: editProfileIcon,
                            height: 25,
                          ),
                        ),
                      ),
                    ),
                    Center(
                        child: Text(
                      'Erhan Ozturk',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Helvetica"),
                    )),
                    SizedBox(
                      height: 3,
                    ),
                    Center(
                      child: Text(
                        'eozturk782@gmail.com',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Helvetica",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Center(
                      child: Text(
                        '+380677331606',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Helvetica",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Image(
                                  image: profileScreenLanguageIcon,
                                  height: 35,
                                ),
                                Text('RU',
                                    style: TextStyle(fontFamily: "Helvetica")),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Image(
                                  image: profileScreenLanguageIcon,
                                  height: 35,
                                ),
                                Text('UA',
                                    style: TextStyle(fontFamily: "Helvetica")),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Image(
                                  image: profileScreenLanguageIcon,
                                  height: 35,
                                ),
                                Text('EN',
                                    style: TextStyle(fontFamily: "Helvetica")),
                              ],
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Align(
                alignment: Alignment.topCenter,
                child: Image(
                  image: profileHolder,
                  height: 80,
                )),
          ],
        ),
      ),
    ));
  }
}

/*
class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: ScreenUtil().setWidth(700),
      height: 550,
      child: Stack(
        children: <Widget>[
          Center(
            child: Image(
              image: personImage,
            ),
          ),
          Align(
            alignment:
                Alignment.lerp(Alignment.topCenter, Alignment.center, 0.01),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(70),
              ),
              child: Image(
                image: profileHolder,
                height: ScreenUtil(
                  allowFontScaling: true,
                ).setSp(130),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: ScreenUtil().setSp(50)),
            height: 60,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Image(
                image: editProfileIcon,
                height: ScreenUtil().setSp(40),
              ),
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(210),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Erhan Ozturk',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(40),
                    fontWeight: FontWeight.bold,
                    fontFamily: "Helvetica"),
              ),
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(235),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'eozturk782@gmail.com',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(20),
                  fontFamily: "Helvetica",
                ),
              ),
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(265),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                '+380677331606',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(20),
                  fontFamily: "Helvetica",
                ),
              ),
            ),
          ),
          SizedBox(
              height: ScreenUtil().setHeight(380),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Image(
                            image: profileScreenLanguageIcon,
                            height:
                                ScreenUtil(allowFontScaling: true).setSp(50),
                          ),
                          Text('RU', style: TextStyle(fontFamily: "Helvetica")),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Image(
                            image: profileScreenLanguageIcon,
                            height:
                                ScreenUtil(allowFontScaling: true).setSp(50),
                          ),
                          Text('UA', style: TextStyle(fontFamily: "Helvetica")),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Image(
                            image: profileScreenLanguageIcon,
                            height:
                                ScreenUtil(allowFontScaling: true).setSp(50),
                          ),
                          Text('EN', style: TextStyle(fontFamily: "Helvetica")),
                        ],
                      ),
                    ],
                  )
                ],
              ))
        ],
      ),
    ));
  }
}
 */
