import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/data/travel_list_one_way_model.dart';

class SearchTicket extends StatelessWidget {
  Map<String, dynamic> buyTicketData;
  SearchTicket({
    this.buyTicketData,
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
        buyTicketMap: this.buyTicketData,
      ),
    );
  }
}

class SearchTicketRoundWay extends StatelessWidget {
  Map<String, dynamic> buyTicketData;
  SearchTicketRoundWay({
    this.buyTicketData,
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
        buyTicketMap: this.buyTicketData,
      ),
    );
  }
}

class SearchTicketScreen extends StatefulWidget {
  Map<String, dynamic> buyTicketMap;
  TabController tabs;
  SearchTicketScreen({
    this.buyTicketMap,
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
  bool stopClick;
  Map<String, dynamic> travelListTicketData;
  Future<dynamic> _datafetched;
  @override
  void initState() {
    super.initState();
    if (widget.buyTicketMap['SecondLegCheck'] != null) {
      travelListTicketData = Map();
      travelListTicketData['BuyTicketData'] = widget.buyTicketMap;
    } else {
      travelListTicketData = widget.buyTicketMap;
      travelListTicketData['BuyTicketData']['SecondLegCheck'] = true;
    }
    _datafetched = getData();
    if (travelListTicketData['BuyTicketData']['SecondLegCheck']) {
      initialDay = travelListTicketData['BuyTicketData']['ReturnDay'];
      initialMonth = travelListTicketData['BuyTicketData']['ReturnMonth'];
      initialYear = travelListTicketData['BuyTicketData']['ReturnYear'];
    } else {
      initialDay = travelListTicketData['BuyTicketData']['DepartureDay'];
      initialMonth = travelListTicketData['BuyTicketData']['DepartureMonth'];
      initialYear = travelListTicketData['BuyTicketData']['DepartureYear'];
    }
    makeItGrey = true;
    stopClick = false;
  }

  getData() async {
    stopClick = true;
    TravelListOneWayModel travelListPODO = TravelListOneWayModel();
    if (travelListTicketData['BuyTicketData']['RoundWayCheck']) {
      if (travelListTicketData['BuyTicketData']['SecondLegCheck']) {
        travelListTicketData['SecondLegTickets'] =
            await travelListPODO.getRoundWaySecondLegList(
          travelListTicketData['BuyTicketData']['DepartureStationId'],
          travelListTicketData['BuyTicketData']['ArrivalStationId'],
          travelListTicketData['BuyTicketData']['ReturnYear'],
          travelListTicketData['BuyTicketData']['ReturnMonth'],
          travelListTicketData['BuyTicketData']['ReturnDay'],
        );
      } else {
        travelListTicketData['FirstLegTickets'] =
            await travelListPODO.getTravelList(
          travelListTicketData['BuyTicketData']['ArrivalStationId'],
          travelListTicketData['BuyTicketData']['DepartureStationId'],
          travelListTicketData['BuyTicketData']['DepartureYear'],
          travelListTicketData['BuyTicketData']['DepartureMonth'],
          travelListTicketData['BuyTicketData']['DepartureDay'],
        );
      }
    } else
      travelListTicketData['FirstLegTickets'] =
          await travelListPODO.getTravelList(
        travelListTicketData['BuyTicketData']['ArrivalStationId'],
        travelListTicketData['BuyTicketData']['DepartureStationId'],
        travelListTicketData['BuyTicketData']['DepartureYear'],
        travelListTicketData['BuyTicketData']['DepartureMonth'],
        travelListTicketData['BuyTicketData']['DepartureDay'],
      );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            travelListTicketData['BuyTicketData']['SecondLegCheck']
                ? getTicketContainer(
                    travelListTicketData['BuyTicketData']['ArrivalStation'],
                    travelListTicketData['BuyTicketData']['DepartureStation'],
                    travelListTicketData['BuyTicketData']['ReturnDay'],
                    travelListTicketData['BuyTicketData']['ReturnMonth'],
                    travelListTicketData['BuyTicketData']['ReturnYear'],
                  )
                : getTicketContainer(
                    travelListTicketData['BuyTicketData']['DepartureStation'],
                    travelListTicketData['BuyTicketData']['ArrivalStation'],
                    travelListTicketData['BuyTicketData']['DepartureDay'],
                    travelListTicketData['BuyTicketData']['DepartureMonth'],
                    travelListTicketData['BuyTicketData']['DepartureYear'],
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
        Expanded(
            child: travelListTicketData['BuyTicketData']['SecondLegCheck']
                ? getTicketSecondLegList(_datafetched)
                : getTicketFirstLegList(_datafetched))
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
              onPressed: travelListTicketData['BuyTicketData']['SecondLegCheck']
                  ? () async {
                      if (!stopClick) {
                        if (!makeItGrey) {
                          if (travelListTicketData['BuyTicketData']
                                  ['ReturnDay'] >=
                              1) {
                            if (travelListTicketData['BuyTicketData']
                                    ['ReturnDay'] ==
                                1) {
                              if (travelListTicketData['BuyTicketData']
                                      ['ReturnMonth'] ==
                                  1) {
                                travelListTicketData['BuyTicketData']
                                    ['ReturnYear']--;
                                travelListTicketData['BuyTicketData']
                                    ['ReturnDay'] = 31;
                                travelListTicketData['BuyTicketData']
                                    ['ReturnMonth'] = 12;
                              } else {
                                travelListTicketData['BuyTicketData']
                                    ['ReturnMonth']--;
                                travelListTicketData['BuyTicketData']
                                    ['ReturnDay'] = 31;
                              }
                            } else {
                              travelListTicketData['BuyTicketData']
                                  ['ReturnDay']--;
                            }
                          }
                          setState(() {
                            _datafetched = getData();
                          });
                        }
                        if (travelListTicketData['BuyTicketData']
                                    ['ReturnDay'] ==
                                this.initialDay &&
                            travelListTicketData['BuyTicketData']
                                    ['ReturnMonth'] ==
                                this.initialMonth &&
                            travelListTicketData['BuyTicketData']
                                    ['ReturnYear'] ==
                                this.initialYear) makeItGrey = true;
                        if (!makeItGrey)
                          setState(() {
                            _datafetched = getData();
                          });
                      }
                    }
                  : () async {
                      if (!stopClick) {
                        if (!makeItGrey) {
                          if (travelListTicketData['BuyTicketData']
                                  ['DepartureDay'] >=
                              1) {
                            if (travelListTicketData['BuyTicketData']
                                    ['DepartureDay'] ==
                                1) {
                              if (travelListTicketData['BuyTicketData']
                                      ['DepartureMonth'] ==
                                  1) {
                                travelListTicketData['BuyTicketData']
                                    ['DepartureYear']--;
                                travelListTicketData['BuyTicketData']
                                    ['DepartureDay'] = 31;
                                travelListTicketData['BuyTicketData']
                                    ['DepartureMonth'] = 12;
                              } else {
                                travelListTicketData['BuyTicketData']
                                    ['DepartureMonth']--;
                                travelListTicketData['BuyTicketData']
                                    ['DepartureDay'] = 31;
                              }
                            } else {
                              travelListTicketData['BuyTicketData']
                                  ['DepartureDay']--;
                            }
                          }
                          setState(() {
                            _datafetched = getData();
                          });
                        }
                        if (travelListTicketData['BuyTicketData']
                                    ['DepartureDay'] ==
                                this.initialDay &&
                            travelListTicketData['BuyTicketData']
                                    ['DepartureMonth'] ==
                                this.initialMonth &&
                            travelListTicketData['BuyTicketData']
                                    ['DepartureYear'] ==
                                this.initialYear) makeItGrey = true;
                        if (!makeItGrey)
                          setState(() {
                            _datafetched = getData();
                          });
                      }
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
              onPressed: travelListTicketData['BuyTicketData']['SecondLegCheck']
                  ? () async {
                      if (!stopClick) {
                        if (travelListTicketData['BuyTicketData']
                                ['ReturnDay'] <=
                            31) {
                          if (travelListTicketData['BuyTicketData']
                                  ['ReturnDay'] ==
                              31) {
                            if (travelListTicketData['BuyTicketData']
                                    ['ReturnMonth'] ==
                                12) {
                              travelListTicketData['BuyTicketData']
                                  ['ReturnYear']++;
                              travelListTicketData['BuyTicketData']
                                  ['ReturnDay'] = 1;
                              travelListTicketData['BuyTicketData']
                                  ['ReturnMonth'] = 1;
                            } else {
                              travelListTicketData['BuyTicketData']
                                  ['ReturnMonth']++;
                              travelListTicketData['BuyTicketData']
                                  ['ReturnDay'] = 1;
                            }
                          } else
                            travelListTicketData['BuyTicketData']
                                ['ReturnDay']++;
                        }
                        makeItGrey = false;
                        setState(() {
                          _datafetched = getData();
                        });
                      }
                    }
                  : () async {
                      if (!stopClick) {
                        if (travelListTicketData['BuyTicketData']
                                ['DepartureDay'] <=
                            31) {
                          if (travelListTicketData['BuyTicketData']
                                  ['DepartureDay'] ==
                              31) {
                            if (travelListTicketData['BuyTicketData']
                                    ['DepartureMonth'] ==
                                12) {
                              travelListTicketData['BuyTicketData']
                                  ['DepartureYear']++;
                              travelListTicketData['BuyTicketData']
                                  ['DepartureDay'] = 1;
                              travelListTicketData['BuyTicketData']
                                  ['DepartureMonth'] = 1;
                            } else {
                              travelListTicketData['BuyTicketData']
                                  ['DepartureMonth']++;
                              travelListTicketData['BuyTicketData']
                                  ['DepartureDay'] = 1;
                            }
                          } else
                            travelListTicketData['BuyTicketData']
                                ['DepartureDay']++;
                        }
                        makeItGrey = false;
                        setState(() {
                          _datafetched = getData();
                        });
                      }
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

  getTicketFirstLegList(_future) {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(
            child: Image(
              image: loadingAnim,
              height: ScreenUtil().setSp(150),
            ),
          );
        else {
          stopClick = false;
          if (travelListTicketData['FirstLegTickets']['Data'] == null)
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
              itemCount: travelListTicketData['FirstLegTickets']['Data'].length,
              itemBuilder: (BuildContext context, int index) {
                Map<String, dynamic> ticketData = {
                  'FirstLeg': {
                    'TicketData': travelListTicketData['FirstLegTickets']
                        ['Data'][index]
                  },
                  'BuyTicketData': travelListTicketData['BuyTicketData'],
                };
                return Ticket(
                  travelListTicketData['FirstLegTickets']['Data'][index]
                          ['DepartureDate']
                      .substring(0, 10),
                  travelListTicketData['FirstLegTickets']['Data'][index]
                          ['ArrivalDate']
                      .substring(0, 10),
                  travelListTicketData['FirstLegTickets']['Data'][index]
                          ['DepartureTime']
                      .substring(0, 5),
                  travelListTicketData['FirstLegTickets']['Data'][index]
                          ['ArrivalTime']
                      .substring(0, 5),
                  travelListTicketData['FirstLegTickets']['Data'][index]
                      ['TicketPrice'],
                  travelListTicketData['FirstLegTickets']['Data'][index]
                      ['Currency']['CurrencyName'],
                  travelListTicketData['FirstLegTickets']['Data'][index]
                      ['EmptySeatCount'],
                  travelListTicketData['FirstLegTickets']['Data'][index]
                      ['VehicleType']['VehicleTypeName'],
                  ticketData,
                );
              },
            );
        }
      },
    );
  }

  getTicketSecondLegList(_future) {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(
            child: Image(
              image: loadingAnim,
              height: ScreenUtil().setSp(150),
            ),
          );
        else {
          stopClick = false;

          if (travelListTicketData['SecondLegTickets']['Data'] == null) {
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
          } else
            return ListView.builder(
              itemCount:
                  travelListTicketData['SecondLegTickets']['Data'].length,
              itemBuilder: (BuildContext context, int index) {
                Map<String, dynamic> ticketData = {
                  'SecondLeg': {
                    'TicketData': travelListTicketData['SecondLegTickets']
                        ['Data'][index]
                  },
                  'BuyTicketData': travelListTicketData['BuyTicketData'],
                };
                return Ticket(
                  travelListTicketData['SecondLegTickets']['Data'][index]
                          ['DepartureDate']
                      .substring(0, 10),
                  travelListTicketData['SecondLegTickets']['Data'][index]
                          ['ArrivalDate']
                      .substring(0, 10),
                  travelListTicketData['SecondLegTickets']['Data'][index]
                          ['DepartureTime']
                      .substring(0, 5),
                  travelListTicketData['SecondLegTickets']['Data'][index]
                          ['ArrivalTime']
                      .substring(0, 5),
                  travelListTicketData['SecondLegTickets']['Data'][index]
                      ['TicketPrice'],
                  travelListTicketData['SecondLegTickets']['Data'][index]
                      ['Currency']['CurrencyName'],
                  travelListTicketData['SecondLegTickets']['Data'][index]
                      ['EmptySeatCount'],
                  travelListTicketData['SecondLegTickets']['Data'][index]
                      ['VehicleType']['VehicleTypeName'],
                  ticketData,
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
  Map<String, dynamic> ticketData;
  Ticket(
    this.departureDate,
    this.arrivalDate,
    this.departureTime,
    this.arrivalTime,
    this.ticketPrice,
    this.currencyName,
    this.numberOfSeats,
    this.vehicleTypeName,
    this.ticketData,
  );

  @override
  _TicketState createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, selectSeatScreen,
              arguments: widget.ticketData);
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
                                color: Color.fromRGBO(14, 52, 113, 10),
                                fontSize: 40,
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'DEPARTURE',
                            style: TextStyle(
                                color: Color.fromRGBO(14, 52, 113, 10),
                                fontSize: 15,
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            '${widget.departureDate}',
                            style: TextStyle(
                              color: Color.fromRGBO(14, 52, 113, 10),
                              fontSize: 15,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '${widget.numberOfSeats} seats',
                            style: TextStyle(
                              color: Color.fromRGBO(14, 52, 113, 10),
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
                                color: Color.fromRGBO(14, 52, 113, 10),
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
                                  '${widget.ticketPrice.toStringAsFixed(0)}',
                                  style: TextStyle(
                                    color: Color.fromRGBO(14, 52, 113, 10),
                                    fontSize: 50,
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
