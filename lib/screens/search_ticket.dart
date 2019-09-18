import 'package:flutter/material.dart';
import 'package:gunsel/data/buy_ticket.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/data/travel_list_one_way_model.dart';

class SearchTicket extends StatelessWidget {
  BuyTicketOneWayData oneWayData;
  SearchTicket({
    this.oneWayData,
  });
  Widget build(BuildContext context) {
    return GunselScaffold(
      appBarIcon: backArrow,
      appBarIncluded: true,
      backgroundImage: scaffoldImg,
      appBarColor: gunselColor,
      appBarTitle: 'Search Ticket',
      appBarTitleIncluded: true,
      drawerIncluded: false,
      bodyWidget: SearchTicketScreen(
        oneWayData: this.oneWayData,
      ),
    );
  }
}

class SearchTicketScreen extends StatefulWidget {
  final BuyTicketOneWayData oneWayData;
  TabController tabs;
  SearchTicketScreen({
    this.oneWayData,
  });
  @override
  State<StatefulWidget> createState() {
    return SearchTicketScreenState();
  }
}

class SearchTicketScreenState extends State<SearchTicketScreen> {
  int initialDay;
  int initialMonth;
  int initialYear;
  bool makeItGrey;
  Map<String, dynamic> travelListTicketData;
  @override
  void initState() {
    super.initState();
    getData();
    initialDay = widget.oneWayData.day;
    initialMonth = widget.oneWayData.month;
    initialYear = widget.oneWayData.year;
    makeItGrey = true;
  }

  getData() async {
    TravelListOneWayModel travelListPODO = TravelListOneWayModel();
    travelListTicketData = await travelListPODO.getTravelList(
        widget.oneWayData.arrivalStationID,
        widget.oneWayData.departureStationID,
        widget.oneWayData.year,
        widget.oneWayData.month,
        widget.oneWayData.day);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            getTicketContainer(
              widget.oneWayData.departureStation,
              widget.oneWayData.arrivalStation,
              widget.oneWayData.day,
              widget.oneWayData.month,
              widget.oneWayData.year,
            ),
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
        Expanded(child: getTicketList())
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
            height: searchTicketTabHeight,
            minWidth: ScreenUtil().setWidth(50),
            child: RaisedButton.icon(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              color: makeItGrey ? Colors.grey : Colors.yellow,
              icon: Image(
                image: arrow_left,
                height: 20,
              ),
              label: Text(""),
              onPressed: () {
                setState(() {
                  if (widget.oneWayData.day != this.initialDay ||
                      widget.oneWayData.month != this.initialMonth ||
                      widget.oneWayData.year !=
                          this.initialYear) if (widget.oneWayData.day >= 1) {
                    if (widget.oneWayData.day == 1) {
                      getData();
                      if (widget.oneWayData.month == 1) {
                        widget.oneWayData.year--;
                        widget.oneWayData.day = 31;
                        widget.oneWayData.month = 12;
                      } else {
                        widget.oneWayData.month--;
                        widget.oneWayData.day = 31;
                      }
                    } else {
                      getData();
                      widget.oneWayData.day--;
                    }
                  } else
                    makeItGrey = true;
                });
              },
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
            height: searchTicketTabHeight,
            minWidth: ScreenUtil().setWidth(50),
            child: RaisedButton.icon(
              color: Colors.yellow,
              disabledColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              icon: Image(
                image: arrow_right,
                height: 20,
              ),
              label: Text(""),
              onPressed: () {
                setState(() {
                  if (widget.oneWayData.day <= 31) {
                    if (widget.oneWayData.day == 31) {
                      if (widget.oneWayData.month == 12) {
                        widget.oneWayData.year++;
                        widget.oneWayData.day = 1;
                        widget.oneWayData.month = 1;
                      } else {
                        widget.oneWayData.month++;
                        widget.oneWayData.day = 1;
                      }
                    } else
                      widget.oneWayData.day++;
                  }
                  makeItGrey = false;
                  getData();
                });
              },
            ),
          )
        ],
      ),
    );
  }

  getTicketContainer(String departureStation, String arrivalStation, int day,
      int month, int year) {
    return Center(
      child: Container(
        width: ScreenUtil().setWidth(500),
        height: searchTicketTabHeight,
        color: Colors.black.withOpacity(0.4),
        alignment: Alignment.center,
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "$departureStation-$arrivalStation",
              style: TextStyle(color: Colors.white, fontFamily: "MyriadPro"),
            ),
            Text(
              "$day.$month.$year",
              style: TextStyle(
                  color: Colors.white, fontFamily: "MyriadPro", fontSize: 15),
            )
          ],
        ),
      ),
    );
  }

  getTicketList() {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(
            child: Image(
              image: loadingAnim,
              height: ScreenUtil().setSp(150),
            ),
          );
        else {
          if (travelListTicketData['Data'] == null)
            return Padding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Spacer(),
                  Spacer(),
                  Text(
                    'Looks like there are no buses available on this date',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(35),
                        fontFamily: 'MyriadPro'),
                  ),
                  Spacer(),
                  Text(
                    'Please change the date to get your result',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(35),
                        fontFamily: 'MyriadPro'),
                  ),
                  Image(
                    image: noSearchTicketImage,
                    height: ScreenUtil().setSp(250),
                  ),
                  Spacer(),
                  Spacer(),
                ],
              ),
              padding: EdgeInsets.all(50),
            );
          else
            return ListView.builder(
              itemCount: travelListTicketData['Data'].length,
              itemBuilder: (BuildContext context, int index) {
                return Ticket(
                  travelListTicketData['Data'][index]['DepartureDate']
                      .substring(0, 10),
                  travelListTicketData['Data'][index]['ArrivalDate']
                      .substring(0, 10),
                  travelListTicketData['Data'][index]['DepartureTime']
                      .substring(0, 5),
                  travelListTicketData['Data'][index]['ArrivalTime']
                      .substring(0, 5),
                  travelListTicketData['Data'][index]['TicketPrice'],
                  travelListTicketData['Data'][index]['Currency']
                      ['CurrencyName'],
                  travelListTicketData['Data'][index]['EmptySeatCount'],
                  travelListTicketData['Data'][index]['VehicleType']
                      ['VehicleTypeName'],
                );
              },
            );
        }
      },
    );
  }
}

class Ticket extends StatefulWidget {
  String departureDate;
  String departureTime;
  String arrivalTime;
  String arrivalDate;
  int numberOfSeats;
  double ticketPrice;
  String currencyName;
  String vehicleTypeName;
  Ticket(
    this.departureDate,
    this.arrivalDate,
    this.departureTime,
    this.arrivalTime,
    this.ticketPrice,
    this.currencyName,
    this.numberOfSeats,
    this.vehicleTypeName,
  );

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
                  padding: EdgeInsets.only(left: 25.0, top: 5.0),
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
                            '${widget.departureTime}',
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
                            '${widget.departureDate}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '${widget.numberOfSeats} seats',
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
                            '${widget.arrivalTime}',
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
                            '${widget.arrivalDate}', //Empty space as to not distur the alignment
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
                                  '${widget.ticketPrice}',
                                  style: TextStyle(
                                    color: darkBlue,
                                    fontSize: 40,
                                    fontFamily: 'Helvetica',
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Text(
                                '${widget.currencyName}', //Empty space as to not distur the alignment
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
                            '${widget.vehicleTypeName}', //Empty space as to not distur the alignment
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
