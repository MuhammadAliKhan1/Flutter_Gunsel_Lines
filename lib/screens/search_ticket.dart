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
            )
          ],
        ),
        Container(
          color: Colors.red,
          margin: EdgeInsets.only(top: 10.0),
          child: Stack(
            children: <Widget>[
              Image(
                image: smallTicket,
                height: 115,
              ),
              Container(
                child: Center(
                  child: Text(
                    'i',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(35),
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
              Center(
                  child: Container(
                      child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                          color: Colors.yellow,
                          height: ScreenUtil().setHeight(190),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                '19:50',
                                style: TextStyle(
                                    color: darkBlue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: ScreenUtil().setSp(60),
                                    letterSpacing: -1),
                              ),
                              Text(
                                'DEPARTURE',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              Text('09.09.2015'),
                              Text('15 seats'),
                            ],
                          ))),
                  Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                          height: ScreenUtil().setHeight(190),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                '19:50',
                                style: TextStyle(
                                    color: darkBlue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: ScreenUtil().setSp(60),
                                    letterSpacing: -1),
                              ),
                              Text(
                                'ARRIVAL',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              Text('09.09.2015'),
                              SizedBox(height: ScreenUtil().setHeight(30))
                            ],
                          ))),
                  Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                          height: ScreenUtil().setHeight(150),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                '19:50',
                                style: TextStyle(
                                    color: darkBlue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: ScreenUtil().setSp(60),
                                    letterSpacing: -1),
                              ),
                              Text(
                                'ARRIVAL',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              Text('09.09.2015'),
                            ],
                          ))),
                ],
              )))
            ],
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
