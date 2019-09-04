import 'package:gunsel/data/constants.dart';
import 'package:gunsel/screens/Drawer/account_container.dart';
import 'package:gunsel/screens/Drawer/drawer_list.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.2,
      child: Drawer(
        elevation: 0.0,
        child: ListView(
          children: <Widget>[
            DrawerAccount(),
            DrawerList(),
            SizedBox(
              height: 20.0,
            ),
            Align(
              alignment:
                  Alignment.lerp(Alignment.centerLeft, Alignment.center, 0.6),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.4,
                height: MediaQuery.of(context).size.height / 15,
                child: ButtonTheme(
                  buttonColor: Colors.yellow,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.lerp(
                              Alignment.centerLeft, Alignment.centerRight, 0.0),
                          child: Icon(
                            Icons.phone_in_talk,
                            size: MediaQuery.of(context).size.height / 25,
                            color: gunselColor,
                          ),
                        ),
                        Align(
                            child: Text(
                          "0 800 30 30 10",
                          style: TextStyle(
                            color: gunselColor,
                            fontSize: MediaQuery.of(context).size.height / 30,
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
