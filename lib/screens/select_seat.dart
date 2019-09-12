import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/screens/details.dart';

class SelectSeat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
      appBarIncluded: true,
      backgroundImage: scaffoldImg,
      bodyWidget: SelectSeatScreen(),
      appBarTitle: 'Select Seat',
      appBarTitleIncluded: true,
      drawerIncluded: false,
    );
  }
}

class SelectSeatScreen extends StatefulWidget {
  @override
  _SelectSeatScreenState createState() => _SelectSeatScreenState();
}

class _SelectSeatScreenState extends State<SelectSeatScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Image(
          image: wizardOne,
        )
      ],
    );
  }
}

class Ticket extends StatefulWidget {
  @override
  _TicketState createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
/* class SelectSeat extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SelectSeatState();
  }
}

class SelectSeatState extends State<SelectSeat> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/BG.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          height: double.infinity,
          width: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text("Select Seat"),
            elevation: 0.0,
            centerTitle: true,
          ),
          body: Screen(),
        )
      ],
    );
  }
}

class Screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScreenState();
  }
}

class ScreenState extends State<Screen> {
  var red = Color(0xffFF0000);
  var green = Color(0xff07D603);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            Center(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          "Your seat",
                          style: TextStyle(color: Colors.yellow),
                        ),
                        Text(
                          "Details",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Purchase Details",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Purchase",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: <Widget>[
                        Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset("images/1.png"),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            ListTile(
              contentPadding:
                  EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
              title: Text(
                "Bus Info:",
                style: TextStyle(color: Colors.white),
              ),
              trailing: Image.asset("images/bus.png"),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 20.0,
              padding: EdgeInsets.only(
                left: 10.0,
                right: 5.0,
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100.0,
                    height: 20.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          width: 20.0,
                          height: 20.0,
                          color: red,
                        ),
                        Text(
                          "Occupied",
                          style: TextStyle(fontSize: 14.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 100.0,
                    height: 20.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: 20.0,
                          height: 20.0,
                          color: Colors.white,
                        ),
                        Text(
                          "Free",
                          style: TextStyle(fontSize: 14.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 100.0,
                    height: 20.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          width: 20.0,
                          height: 20.0,
                          color: green,
                        ),
                        Text(
                          "Selected",
                          style: TextStyle(fontSize: 14.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            getSeatRow(1, 2, 3, 4),
            getSeatRow(5, 6, 7, 8),
            getSeatRow(9, 10, 11, 12),
            getSeatRow(13, 14, 15, 16),
            getSeatRow(17, 18, 19, 20),
            getSeatRow(21, 22, 23, 24),
            getSeatRow(25, 26, 27, 28),
            getSeatRow(29, 30, 31, 32),
          ],
        ),
        Padding(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ButtonTheme(
              minWidth: MediaQuery.of(context).size.width - 50,
              child: RaisedButton(
                child: Text(
                  "Search",
                  textScaleFactor: 1.5,
                ),
                highlightColor: Colors.yellow,
                color: Colors.yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0)),
                ),
                onPressed: () {
                  setState(
                    () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Detail()));
                    },
                  );
                },
              ),
            ),
          ),
          padding: EdgeInsets.only(top: 50.0),
        ),
      ],
    );
  }

  getSeat(n) {
    return Stack(
      children: <Widget>[
        Container(
          width: 40.0,
          height: 50.0,
          child: Image.asset(
            "images/seat.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          alignment: Alignment.topCenter,
          width: 40.0,
          height: 40.0,
          child: Center(
            child: Text(
              "$n",
              style: TextStyle(fontSize: 25.0),
            ),
          ),
        )
      ],
    );
  }

  getSeatRow(n1, n2, n3, n4) {
    return Padding(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            width: 30.0,
          ),
          getSeat(n1),
          SizedBox(
            width: 10.0,
          ),
          getSeat(n2),
          SizedBox(
            width: 100.0,
          ),
          getSeat(n3),
          SizedBox(
            width: 10.0,
          ),
          getSeat(n4),
          SizedBox(
            width: 50.0,
          ),
        ],
      ),
      padding: EdgeInsets.only(top: 20.0),
    );
  }
}

class Seat extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return null;
  }
}
 */
