import 'package:gunsel/data/constants.dart';
import 'package:gunsel/screens/Drawer/account_container.dart';
import 'package:gunsel/screens/Drawer/drawer_list.dart';
import 'package:url_launcher/url_launcher.dart';

bool accountIncluded = false;

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.2,
      child: Drawer(
        elevation: 0.0,
        child: ListView(
          children: <Widget>[
            DrawerAccount(
              accountIncluded: accountIncluded,
            ),
            DrawerList(
              accountIncluded: accountIncluded,
            ),
            SizedBox(
              height: 10.0,
            ),
            Align(
              alignment:
                  Alignment.lerp(Alignment.centerLeft, Alignment.center, 0.8),
              child: Container(
                width: ScreenUtil().setWidth(400),
                height: 30.0,
                child: ButtonTheme(
                  buttonColor: Colors.yellow,
                  padding: EdgeInsets.only(left: ScreenUtil().setSp(25)),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                    ),
                    onPressed: () {launch('tel:${0800303010}');},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.lerp(
                              Alignment.centerLeft, Alignment.centerRight, 0.0),
                          child: Icon(
                            Icons.phone_in_talk,
                            size: ScreenUtil().setSp(30),
                            color: gunselColor,
                          ),
                        ),
                        Align(
                            child: Text(
                          "0 800 30 30 10",
                          style: TextStyle(
                            color: gunselColor,
                            fontSize: ScreenUtil().setSp(30),
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
