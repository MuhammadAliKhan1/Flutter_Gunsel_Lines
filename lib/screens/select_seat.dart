import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/screens/details.dart';
import 'package:gunsel/widgets/button.dart';

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
    return Stack(
      children: <Widget>[
        ListView(
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Image(
                          image: wizardOne,
                          height: ScreenUtil().setHeight(55),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: Ticket(),
              ),
              ListTile(
                contentPadding:
                    EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                title: Text(
                  "Bus Info:",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Image(
                  image: bus,
                ),
              ),
              Row(
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
              getSeatRow(1, 2, 3, 4),
              getSeatRow(5, 6, 7, 8),
              getSeatRow(9, 10, 11, 12),
              getSeatRow(13, 14, 15, 16),
              getSeatRow(17, 18, 19, 20),
              getSeatRow(21, 22, 23, 24),
              getSeatRow(25, 26, 27, 28),
              getSeatRow(29, 30, 31, 32),
              SizedBox(
                height: 80,
              )
            ]),
        Align(
          alignment: Alignment.bottomCenter,
          child: GunselButton(
            whenPressed: () {
              Navigator.pushNamed(context, detailScreen);
            },
            btnWidth: 500,
            btnText: 'Search',
            btnTextFontSize: 40,
          ),
        )
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

class Ticket extends StatefulWidget {
  @override
  _TicketState createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Stack(
        children: <Widget>[
          Image(
            image: smallTicket,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              child: Center(
                child: Text(
                  'i',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil(allowFontScaling: true).setSp(35),
                  ),
                ),
              ),
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                  color: darkBlue.withOpacity(0.92),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(8),
                  )),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 60,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '13',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    '08 2019',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              SizedBox(
                width: 38,
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    color: Colors.grey,
                    height: 100,
                    width: 1,
                  )
                ],
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Column(children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 90),
                          child: Text(
                            'Kyiv',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Text(
                          '23:00',
                          style: TextStyle(
                              color: darkBlue,
                              fontSize: 40,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'DEPARTURE',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ]),
                      SizedBox(
                        height: 50,
                        width: 25,
                      ),
                      Column(children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 70),
                          child: Text(
                            'Odessa',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Text(
                          '06:20',
                          style: TextStyle(
                              color: darkBlue,
                              fontSize: 40,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'ARRIVAL',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ]),
                    ],
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
