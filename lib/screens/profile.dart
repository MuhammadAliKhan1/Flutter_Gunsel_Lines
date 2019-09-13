import 'package:gunsel/data/constants.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GunselScaffold(
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
