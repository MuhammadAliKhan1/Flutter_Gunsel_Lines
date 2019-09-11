import 'package:gunsel/data/constants.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GunselScaffold(
        appBarIncluded: true,
        bodyWidget: ProfileScreen(),
        appBarColor: gunselColor,
        appBarTitleIncluded: true,
        appBarTitle: 'Profile',
        drawerIncluded: true,
        backgroundImage: whiteImage,
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
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Container(
            child: Image(
              image: profileBG,
              fit: BoxFit.cover,
              width: double.infinity,
              height: ScreenUtil().setHeight(800),
            ),
          ),
          Align(
            alignment: Alignment.lerp(
                Alignment.bottomCenter, Alignment.topCenter, 0.4),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              height: ScreenUtil().setHeight(800),
              width: ScreenUtil().setWidth(400),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    height: ScreenUtil().setHeight(430),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                    ),
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                            height: ScreenUtil().setHeight(370),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      height: ScreenUtil().setWidth(50),
                                      width: ScreenUtil().setHeight(50),
                                      child: Image(
                                        image: editProfileIcon,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        height: ScreenUtil().setHeight(150),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Text(
                                              'Ethan Ozturk',
                                              style: TextStyle(
                                                fontSize:
                                                    ScreenUtil().setSp(30),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text('eozturk782@gmail.com'),
                                            Text('+036724123')
                                          ],
                                        ))
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Image(
                                          image: profileScreenLanguageIcon,
                                          height: ScreenUtil().setSp(50),
                                        ),
                                        Text('RU'),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Image(
                                          image: profileScreenLanguageIcon,
                                          height: ScreenUtil().setSp(50),
                                        ),
                                        Text('UA'),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Image(
                                          image: profileScreenLanguageIcon,
                                          height: ScreenUtil().setSp(50),
                                        ),
                                        Text('EN'),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ))),
                  ),
                  Container(
                    height: ScreenUtil().setHeight(370),
                    child: Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                          child: Image(
                            image: profileScreenPerson,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment(0, 2),
                                colors: [
                                  Colors.white.withOpacity(1),
                                  Colors.white.withOpacity(0.9),
                                  Colors.white.withOpacity(0.8),
                                  Colors.white.withOpacity(0.7),
                                  Colors.white.withOpacity(0.6),
                                  Colors.white.withOpacity(0.5),
                                  Colors.white.withOpacity(0.4),
                                  Colors.white.withOpacity(0.3),
                                  Colors.white.withOpacity(0.2),
                                  Colors.white.withOpacity(0.1),
                                  Colors.white.withOpacity(0.0),
                                ],
                                stops: [
                                  0.00,
                                  0.01,
                                  0.02,
                                  0.03,
                                  0.04,
                                  0.05,
                                  0.06,
                                  0.07,
                                  0.08,
                                  0.09,
                                  0.010,
                                ]),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.lerp(
                Alignment.topCenter, Alignment.bottomCenter, 0.04),
            child: ClipRRect(
                borderRadius: new BorderRadius.circular(50.0),
                child: Image(
                  image: profileHolder,
                  fit: BoxFit.cover,
                  height: ScreenUtil().setHeight(150),
                )),
          )
        ],
      ),
    );
  }
}
