import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
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

class SelectSeatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(
          padding: EdgeInsets.all(5.0),
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Your seat",
                        style: TextStyle(
                            color: Colors.yellow,
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.w600)),
                    Text(
                      "Details",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Purchase Details",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Purchase",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                FittedBox(
                  alignment: Alignment.center,
                  child: Image(
                    height: 30,
                    width: 310,
                    image: wizardOne,
                  ),
                ),
                SelectSeatTicket(),
                ListTile(
                  contentPadding: EdgeInsets.all(20),
                  title: Text(
                    'Bus Info:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Helvetica',
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  trailing: FittedBox(
                    child: Image(
                      image: bus,
                      width: 120,
                      height: 50,
                    ),
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
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                                fontFamily: 'MyriadPro'),
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
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                                fontFamily: 'MyriadPro'),
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
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                                fontFamily: 'MyriadPro'),
                          ),
                        ],
                      ),
                    ),
                  ],
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
          ],
        ),
        Align(
          child: GunselButton(
            btnWidth: 500,
            btnText: 'Search',
            btnTextFontSize: 40,
            whenPressed: () {
              Navigator.pushNamed(context, detailScreen);
            },
          ),
          alignment: Alignment.bottomCenter,
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
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Helvetica'),
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(200),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  getSeat(n1),
                  getSeat(n2),
                ]),
          ),
          Container(
            width: ScreenUtil().setWidth(200),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  getSeat(n3),
                  getSeat(n4),
                ]),
          ),
        ],
      ),
      padding: EdgeInsets.only(top: 20.0),
    );
  }
}

class SelectSeatTicket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        height: 200,
        child: Stack(
          children: <Widget>[
            Image(
              image: selectSeatScreenTicket,
            ),
            Padding(
              padding: EdgeInsets.only(left: 75.0, bottom: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 120,
                        width: 130,
                        child: Text(
                          '13',
                          style: TextStyle(
                              fontSize: 120,
                              color: Colors.black,
                              fontFamily: 'SFProText',
                              fontWeight: FontWeight.w900,
                              letterSpacing: -15),
                        ),
                      ),
                      Text(
                        '08 2019',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 90,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(right: 150),
                          child: Text(
                            'Kyiv',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                      Text(
                        '23:00',
                        style: TextStyle(
                          fontSize: 80,
                          color: darkBlue,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'DEPARTURE',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(right: 150),
                          child: Text(
                            'Odessa',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                      Text(
                        '06:20',
                        style: TextStyle(
                          fontSize: 80,
                          color: darkBlue,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'ARRIVAL',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
