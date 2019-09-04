import 'package:gunsel/data/constants.dart';
import 'menu_row.dart';

class DrawerAccount extends StatefulWidget {
  @override
  _DrawerAccountState createState() => _DrawerAccountState();
}

class _DrawerAccountState extends State<DrawerAccount> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.0,
      child: DrawerHeader(
        margin: EdgeInsets.all(0.0),
        padding: EdgeInsets.all(0.0),
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image(
                image: drawerAccountHeaderImg,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment:
                  Alignment.lerp(Alignment.topCenter, Alignment.center, 0.1),
              child: Icon(
                Icons.person_pin,
                size: MediaQuery.of(context).size.height / 7,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.0),
              child: Align(
                alignment:
                    Alignment.lerp(Alignment.topRight, Alignment.topLeft, 0.07),
                child: Image(
                  image: drawerlogoutImg,
                  height: MediaQuery.of(context).size.height / 30,
                  width: MediaQuery.of(context).size.height / 30,
                  color: Colors.white,
                ),
              ),
            ),
            Align(
              alignment:
                  Alignment.lerp(Alignment.topCenter, Alignment.center, 0.8),
              child: Text(
                "Ethan Ozturk",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height / 35),
              ),
            ),
            Align(
              alignment:
                  Alignment.lerp(Alignment.topCenter, Alignment.center, 1.0),
              child: Text(
                "khanali198361@gmail.com",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height / 45),
              ),
            ),
            Align(
              alignment:
                  Alignment.lerp(Alignment.topCenter, Alignment.center, 1.9),
              child: MenuRow(
                title: 'My Profile',
                icon: Icons.person_outline,
                routeTo: profileScreen,
              ),
            )
          ],
        ),
      ),
    );
  }
}
