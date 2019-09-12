import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/screens/select_seat.dart';

class SearchTicket extends StatelessWidget {
  Widget build(BuildContext context) {
    return GunselScaffold(
      appBarIncluded: true,
      backgroundImage: scaffoldImg,
      appBarColor: gunselColor,
      appBarTitle: 'Search Ticket',
      appBarTitleIncluded: true,
      drawerIncluded: false,
      bodyWidget: TicketView(),
    );
  }
}

class TicketView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TicketViewState();
  }
}

class TicketViewState extends State<TicketView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(left: 5.0, right: 5.0),
      children: <Widget>[
        Stack(
          children: <Widget>[
            getTicketContainer(),
            Align(
              alignment: Alignment.topLeft,
              child: getSliderLeft(),
            ),
            Align(
              alignment: Alignment.topRight,
              child: getSliderRight(),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          child: InkWell(
            child: Ticket(),
            onTap: () {
              Navigator.pushNamed(
                context,
                selectSeatScreen,
              );
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          child: InkWell(
            child: Ticket(),
            onTap: () {
              Navigator.pushNamed(
                context,
                selectSeatScreen,
              );
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          child: InkWell(
            child: Ticket(),
            onTap: () {
              Navigator.pushNamed(
                context,
                selectSeatScreen,
              );
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          child: InkWell(
            child: Ticket(),
            onTap: () {
              Navigator.pushNamed(
                context,
                selectSeatScreen,
              );
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          child: InkWell(
            child: Ticket(),
            onTap: () {
              Navigator.pushNamed(
                context,
                selectSeatScreen,
              );
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          child: InkWell(
            child: Ticket(),
            onTap: () {
              Navigator.pushNamed(
                context,
                selectSeatScreen,
              );
            },
          ),
        ),
      ],
    );
  }

  getSliderLeft() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ButtonTheme(
            height: 80.0,
            minWidth: ScreenUtil().setWidth(100),
            child: RaisedButton.icon(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              color: Colors.yellow,
              icon: Icon(
                Icons.arrow_back_ios,
                color: gunselColor,
                size: 30.0,
              ),
              label: Text(""),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  getSliderRight() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ButtonTheme(
            height: 80.0,
            minWidth: ScreenUtil().setWidth(105),
            child: RaisedButton.icon(
              color: Colors.yellow,
              disabledColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              icon: Icon(
                Icons.arrow_forward_ios,
                color: gunselColor,
                size: 30.0,
              ),
              label: Text(""),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  getTicketContainer() {
    return Center(
      child: Container(
        width: ScreenUtil().setWidth(500),
        height: 80.0,
        color: Colors.black.withOpacity(0.4),
        alignment: Alignment.center,
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "Odessa->Kyiv",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "23.08.2019",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                width: 35,
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '14:50',
                    style: TextStyle(
                      fontSize: 45,
                      color: darkBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'DEPARTURE',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '19.5.2019',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '15 Seats',
                    style: TextStyle(
                      fontSize: 15,
                      color: darkBlue,
                    ),
                  ),
                ],
              ),
              SizedBox(
<<<<<<< HEAD
                width: 20,
=======
                width: 17,
>>>>>>> bca9b419fa274c69da690c8ee8ffba44a98c6d6c
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '19:50',
                    style: TextStyle(
                      fontSize: 45,
                      color: darkBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'ARRIVAL',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '19.5.2019',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 23,
                  )
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: <Widget>[
                  Container(
                    color: Colors.grey,
                    height: 90,
                    width: 1,
                  )
                ],
              ),
<<<<<<< HEAD
              SizedBox(width: 30 //,
=======
              SizedBox(width: 35 //,
>>>>>>> bca9b419fa274c69da690c8ee8ffba44a98c6d6c
                  ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 13,
                  ),
                  Text(
                    '420',
                    style: TextStyle(
                      fontSize: 50,
                      color: darkBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'UAH',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'MAN FORTUNA 19',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
