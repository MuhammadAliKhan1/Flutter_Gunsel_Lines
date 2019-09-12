import 'package:gunsel/data/constants.dart';

class DrawerAccount extends StatefulWidget {
  final bool accountIncluded;
  DrawerAccount({Key key, @required this.accountIncluded}) : super(key: key);
  @override
  _DrawerAccountState createState() => _DrawerAccountState();
}

class _DrawerAccountState extends State<DrawerAccount> {
  @override
  Widget build(BuildContext context) {
    return (widget.accountIncluded
        ? withAccount(context)
        : withoutAccount(context));
  }

  Widget withAccount(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().setHeight(400),
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              child: Image(
                image: drawerAccountHeaderImg,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment:
                  Alignment.lerp(Alignment.topCenter, Alignment.center, 0.2),
              child: Image(
                image: userImg,
                height: ScreenUtil().setHeight(100),
                color: Colors.black,
              ),
            ),
            Align(
              alignment:
                  Alignment.lerp(Alignment.topCenter, Alignment.center, 0.8),
              child: Text(
                "Erhan Ozturk",
                style: TextStyle(
                    color: Colors.white, fontSize: ScreenUtil().setSp(35)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setSp(50)),
              child: Align(
                alignment:
                    Alignment.lerp(Alignment.topRight, Alignment.topLeft, 0.07),
                child: Image(
                  image: drawerLogoutImg,
                  height: ScreenUtil().setSp(30),
                  color: Colors.white,
                ),
              ),
            ),
            Align(
              alignment:
                  Alignment.lerp(Alignment.topCenter, Alignment.center, 1.05),
              child: Text(
                "khanali198361@gmail.com",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget withoutAccount(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().setHeight(200),
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              child: Image(
                image: drawerAccountHeaderImg,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setSp(50)),
              child: Align(
                alignment:
                    Alignment.lerp(Alignment.topRight, Alignment.topLeft, 0.07),
                child: InkWell(
                    child: InkWell(
                      onTap: () =>
                          Navigator.pushReplacementNamed(context, loginScreen),
                      child: Image(
                        image: drawerLogoutImg,
                        height: ScreenUtil().setSp(30),
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, loginScreen);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
