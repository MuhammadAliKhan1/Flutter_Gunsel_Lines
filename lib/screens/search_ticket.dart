import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';

class SearchTicket extends StatelessWidget {
  Widget build(BuildContext context) {
    return GunselScaffold(
      appBarIcon: backArrow,
      appBarIncluded: true,
      backgroundImage: scaffoldImg,
      appBarColor: gunselColor,
      appBarTitle: 'Search Ticket',
      appBarTitleIncluded: true,
      drawerIncluded: false,
      bodyWidget: SearchTicketScreen(),
    );
  }
}

class SearchTicketScreen extends StatefulWidget {
  TabController tabs;
  @override
  State<StatefulWidget> createState() {
    return SearchTicketScreenState();
  }
}

class SearchTicketScreenState extends State<SearchTicketScreen> {
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
        Ticket(),
        Ticket(),
        Ticket(),
        Ticket(),
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
              "Odessa-Kyiv",
              style: TextStyle(color: Colors.white, fontFamily: "MyriadPro"),
            ),
            Text(
              "23.08.2019",
              style: TextStyle(color: Colors.white, fontFamily: "MyriadPro"),
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
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, selectSeatScreen);
        },
        child: FittedBox(
            child: Container(
          margin: EdgeInsets.only(top: 10.0),
          height: 112,
          child: Stack(
            children: <Widget>[
              Image(
                image: smallTicket,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 30.0, top: 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      SizedBox(
                        width: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            '13:40',
                            style: TextStyle(
                                color: darkBlue,
                                fontSize: 40,
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'DEPARTURE',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            '09.09.2019',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '15 seats',
                            style: TextStyle(
                              color: darkBlue,
                              fontSize: 15,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            '19:50',
                            style: TextStyle(
                                color: darkBlue,
                                fontSize: 40,
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'ARRIVAL',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            '17.09.2019', //Empty space as to not distur the alignment
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '',
                            style: TextStyle(
                              color: darkBlue,
                              fontSize: 15,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 45),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                height: 43,
                                child: Text(
                                  '420',
                                  style: TextStyle(
                                    color: darkBlue,
                                    fontSize: 50,
                                    fontFamily: 'Helvetica',
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Text(
                                'UAH', //Empty space as to not distur the alignment
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Neoplan TourLine (46)', //Empty space as to not distur the alignment
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 12,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        )));
  }
}
