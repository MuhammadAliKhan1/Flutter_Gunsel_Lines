import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/data/travel_list_one_way_model.dart';

import 'package:gunsel/data/sharedPreference.dart';

class SearchTicket_RoundWay extends StatefulWidget {
  Map<String, dynamic> userData;
  SearchTicket_RoundWay({
    @required this.userData,
  });

  @override
  _SearchTicket_RoundWayState createState() => _SearchTicket_RoundWayState();
}

class _SearchTicket_RoundWayState extends State<SearchTicket_RoundWay> {
  String enJson = "", uaJson = "", ruJson = "", plJson = "";
  SharePreferencelogin sh = SharePreferencelogin();
  String information = "Passenger details", searchTicket = "Search Ticket";

  void detailsBarlan() async {
    enJson = await DefaultAssetBundle.of(context)
        .loadString("languagefiles/en-US.json");
    uaJson = await DefaultAssetBundle.of(context)
        .loadString("languagefiles/ua-UA.json");
    ruJson = await DefaultAssetBundle.of(context)
        .loadString("languagefiles/ru-RU.json");
    plJson = await DefaultAssetBundle.of(context)
        .loadString("languagefiles/pl-PL.json");

    Map<String, dynamic> enData = json.decode(enJson);
    Map<String, dynamic> uaData = json.decode(uaJson);
    Map<String, dynamic> ruData = json.decode(ruJson);
    Map<String, dynamic> plData = json.decode(plJson);
    int b;
    int a = await sh.getshared1();

    setState(() {
      b = a;

      if (b == 0) {
        information = "Passenger details";
        searchTicket = "Search Ticket";
      } else if (b == 1) {
        information = "Реквізити пасажира";
        searchTicket = "Пошук Квитку";
      } else if (b == 2) {
        information = "Пассажирские данные";
        searchTicket = "Поиск Билета";
      } else if (b == 3) {
        searchTicket = "Wyszukaj Bilet";
        information = "Dane pasażera";
      }
    });
  }

  @override
  void initState() {
    super.initState();
    detailsBarlan();
  }

  Widget build(BuildContext context) {
    return GunselScaffold(
      appBarIcon: backArrow,
      appBarIncluded: true,
      backgroundImage: scaffoldImg,
      appBarColor: gunselColor,
      appBarTitle: searchTicket,
      appBarTitleIncluded: true,
      drawerIncluded: false,
      bodyWidget: SearchTicketScreen(
        userData: this.widget.userData,
      ),
    );
  }
}

class SearchTicketScreen extends StatefulWidget {
  Map<String, dynamic> userData;
  TabController tabs;
  SearchTicketScreen({
    this.userData,
  });
  @override
  State<StatefulWidget> createState() {
    return SearchTicketScreenState();
  }
}

class SearchTicketScreenState extends State<SearchTicketScreen> {
  String enJson = "", uaJson = "", ruJson = "", plJson = "";
  SharePreferencelogin sh = SharePreferencelogin();
  String busNotAvailable =
      "Looks like there are no buses available on this date";
  String changeDate = "Please change the date to get your result";
  String departure = "DEPARTURE";

  void detailsBarlan() async {
    enJson = await DefaultAssetBundle.of(context)
        .loadString("languagefiles/en-US.json");
    uaJson = await DefaultAssetBundle.of(context)
        .loadString("languagefiles/ua-UA.json");
    ruJson = await DefaultAssetBundle.of(context)
        .loadString("languagefiles/ru-RU.json");
    plJson = await DefaultAssetBundle.of(context)
        .loadString("languagefiles/pl-PL.json");

    Map<String, dynamic> enData = json.decode(enJson);
    Map<String, dynamic> uaData = json.decode(uaJson);
    Map<String, dynamic> ruData = json.decode(ruJson);
    Map<String, dynamic> plData = json.decode(plJson);
    int b;
    int a = await sh.getshared1();

    setState(() {
      b = a;

      if (b == 0) {
        busNotAvailable =
            "Looks like there are no buses available on this date";
        changeDate = "Please change the date to get your result";
        departure = "DEPARTURE";
      } else if (b == 1) {
        busNotAvailable = "Схоже, немає автобусів на цю дату";
        changeDate = "Будь ласка, змініть дату, щоб отримати результат";
        departure = "ВИХІДНА ПОЗИЦІЯ";
      } else if (b == 2) {
        busNotAvailable = "Похоже, что на эту дату нет автобусов";
        changeDate = "Пожалуйста, измените дату, чтобы получить свой результат";
        departure = "ИСХОДНАЯ ПОЗИЦИЯ";
      } else if (b == 3) {
        busNotAvailable =
            "Wygląda na to, że w tym dniu nie ma dostępnych autobusów";
        changeDate = "Zmień datę, aby uzyskać wynik";
        departure = "POZYCJA WYJŚCIOWA";
      }
    });
  }

  int initialDay;
  int initialMonth;
  int initialYear;
  bool makeItGrey;
  bool stopClick;
  Map<String, dynamic> travelListTicketData;
  Future<dynamic> _datafetched;
  @override
  void initState() {
    detailsBarlan();
    super.initState();
    travelListTicketData = widget.userData;
    _datafetched = getData();
    initialDay = travelListTicketData['BuyTicketData']['ReturnDay'];
    initialMonth = travelListTicketData['BuyTicketData']['ReturnMonth'];
    initialYear = travelListTicketData['BuyTicketData']['ReturnYear'];

    makeItGrey = true;
    stopClick = false;
  }

  getData() async {
    stopClick = true;
    TravelListOneWayModel travelListPODO = TravelListOneWayModel();

    travelListTicketData['SecondLegTickets'] =
        await travelListPODO.getRoundWaySecondLegList(
      travelListTicketData['BuyTicketData']['DepartureStationId'],
      travelListTicketData['BuyTicketData']['ArrivalStationId'],
      travelListTicketData['BuyTicketData']['ReturnYear'],
      travelListTicketData['BuyTicketData']['ReturnMonth'],
      travelListTicketData['BuyTicketData']['ReturnDay'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            getTicketContainer(
              travelListTicketData['BuyTicketData']['ArrivalStation'],
              travelListTicketData['BuyTicketData']['DepartureStation'],
              travelListTicketData['BuyTicketData']['ReturnDay'],
              travelListTicketData['BuyTicketData']['ReturnMonth'],
              travelListTicketData['BuyTicketData']['ReturnYear'],
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
          child: getTicketSecondLegList(_datafetched),
        )
      ],
    );
  }

  getSliderLeft() {
    return Container(
      padding: EdgeInsets.only(left: 5.0),
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
                onPressed: () async {
                  if (!stopClick) {
                    if (!makeItGrey) {
                      if (travelListTicketData['BuyTicketData']['ReturnDay'] >=
                          1) {
                        if (travelListTicketData['BuyTicketData']
                                ['ReturnDay'] ==
                            1) {
                          if (travelListTicketData['BuyTicketData']
                                  ['ReturnMonth'] ==
                              1) {
                            travelListTicketData['BuyTicketData']
                                ['ReturnYear']--;
                            travelListTicketData['BuyTicketData']['ReturnDay'] =
                                31;
                            travelListTicketData['BuyTicketData']
                                ['ReturnMonth'] = 12;
                          } else {
                            travelListTicketData['BuyTicketData']
                                ['ReturnMonth']--;
                            travelListTicketData['BuyTicketData']['ReturnDay'] =
                                31;
                          }
                        } else {
                          travelListTicketData['BuyTicketData']['ReturnDay']--;
                        }
                      }
                      setState(() {
                        _datafetched = getData();
                      });
                    }
                    if (travelListTicketData['BuyTicketData']['ReturnDay'] ==
                            this.initialDay &&
                        travelListTicketData['BuyTicketData']['ReturnMonth'] ==
                            this.initialMonth &&
                        travelListTicketData['BuyTicketData']['ReturnYear'] ==
                            this.initialYear) makeItGrey = true;
                    if (!makeItGrey)
                      setState(() {
                        _datafetched = getData();
                      });
                  }
                }),
          )
        ],
      ),
    );
  }

  getSliderRight() {
    return Container(
      padding: EdgeInsets.only(right: 5.0),
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
              onPressed: () async {
                if (!stopClick) {
                  if (travelListTicketData['BuyTicketData']['ReturnDay'] <=
                      31) {
                    if (travelListTicketData['BuyTicketData']['ReturnDay'] ==
                        31) {
                      if (travelListTicketData['BuyTicketData']
                              ['ReturnMonth'] ==
                          12) {
                        travelListTicketData['BuyTicketData']['ReturnYear']++;
                        travelListTicketData['BuyTicketData']['ReturnDay'] = 1;
                        travelListTicketData['BuyTicketData']['ReturnMonth'] =
                            1;
                      } else {
                        travelListTicketData['BuyTicketData']['ReturnMonth']++;
                        travelListTicketData['BuyTicketData']['ReturnDay'] = 1;
                      }
                    } else
                      travelListTicketData['BuyTicketData']['ReturnDay']++;
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "$departureStation - $arrivalStation",
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
                    busNotAvailable,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(35),
                        fontFamily: 'MyriadPro'),
                  ),
                  Spacer(),
                  Text(
                    changeDate,
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
                  travelListTicketData['FirstLeg'],
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
  Map<String, dynamic> ticketDataFirstLeg;
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
    this.ticketDataFirstLeg,
  );

  @override
  _TicketState createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  SharePreferencelogin sh = SharePreferencelogin();
  String enJson = "", uaJson = "", ruJson = "", plJson = "";
  String departure = "DEPARTURE";
  String arrival = "ARRIVAL";
  String seats = "seats";

  void searchTicketlan() async {
    enJson = await DefaultAssetBundle.of(context)
        .loadString("languagefiles/en-US.json");
    uaJson = await DefaultAssetBundle.of(context)
        .loadString("languagefiles/ua-UA.json");
    ruJson = await DefaultAssetBundle.of(context)
        .loadString("languagefiles/ru-RU.json");
    plJson = await DefaultAssetBundle.of(context)
        .loadString("languagefiles/pl-PL.json");

    Map<String, dynamic> enData = json.decode(enJson);
    Map<String, dynamic> uaData = json.decode(uaJson);
    Map<String, dynamic> ruData = json.decode(ruJson);
    Map<String, dynamic> plData = json.decode(plJson);

    int b;
    int a = await sh.getshared1();

    setState(() {
      b = a;

      if (b == 0) {
        departure = "DEPARTURE";
        arrival = "ARRIVAL";
        seats = "seats";
      } else if (b == 1) {
        departure = "ВИХІДНА ПОЗИЦІЯ";
        arrival = "ПРИБУТТЯ";
        seats = "місць";
      } else if (b == 2) {
        departure = "ИСХОДНАЯ ПОЗИЦИЯ";
        arrival = "ПРИБЫТИЕ";
        seats = "мест";
      } else if (b == 3) {
        departure = "POZYCJA WYJŚCIOWA";
        arrival = "PRZYJAZD";
        seats = "siedzenia";
      }
    });
  }

  @override
  void initState() {
    super.initState();
    searchTicketlan();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.ticketData['FirstLeg'] = widget.ticketDataFirstLeg;
        Navigator.pushNamed(
          context,
          selectSeatRoundWay,
          arguments: widget.ticketData,
        );
      },
      child: FittedBox(
        child: Container(
          margin: EdgeInsets.only(top: 15.0, left: 5.0, right: 5.0),
          height: 112,
          child: Stack(
            children: <Widget>[
              Image(
                image: smallTicket,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 25.0, top: 5.0),
                  child: FittedBox(
                    child: Container(
                      height: 112,
                      width: 380,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                height: ScreenUtil().setSp(65),
                                child: AutoSizeText(
                                  '${widget.departureTime}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromRGBO(14, 52, 113, 10),
                                      fontSize: ScreenUtil().setSp(65),
                                      fontFamily: 'Helvetica',
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Container(
                                height: ScreenUtil().setHeight(26),
                                width: ScreenUtil().setWidth(170),
                                child: AutoSizeText(
                                  departure,
                                  textAlign: TextAlign.center,
                                  minFontSize: 11,
                                  maxFontSize: 15,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Helvetica',
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Container(
                                height: ScreenUtil().setHeight(25),
                                child: Text(
                                  '${widget.departureDate}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: ScreenUtil().setHeight(25),
                                    fontFamily: 'Helvetica',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Container(
                                height: ScreenUtil().setHeight(23),
                                child: AutoSizeText(
                                  '${widget.numberOfSeats} $seats',
                                  minFontSize: 15,
                                  style: TextStyle(
                                    color: Color.fromRGBO(14, 52, 113, 10),
                                    fontFamily: 'Helvetica',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                height: ScreenUtil().setSp(65),
                                child: AutoSizeText(
                                  '${widget.arrivalTime}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromRGBO(14, 52, 113, 10),
                                      fontSize: 1000,
                                      fontFamily: 'Helvetica',
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Container(
                                height: ScreenUtil().setHeight(26),
                                width: ScreenUtil().setWidth(170),
                                child: AutoSizeText(
                                  arrival,
                                  textAlign: TextAlign.center,
                                  minFontSize: 11,
                                  maxFontSize: 15,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Helvetica',
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Container(
                                height: ScreenUtil().setHeight(25),
                                child: Text(
                                  '${widget.departureDate}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: ScreenUtil().setHeight(25),
                                    fontFamily: 'Helvetica',
                                    fontWeight: FontWeight.w700,
                                  ),
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                    height: ScreenUtil().setSp(80),
                                    child: AutoSizeText(
                                      '${widget.ticketPrice.toStringAsFixed(0)}',
                                      style: TextStyle(
                                        color: Color.fromRGBO(14, 52, 113, 10),
                                        fontSize: ScreenUtil().setSp(80),
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: ScreenUtil().setSp(35),
                                    child: Text(
                                      '${widget.currencyName}', //Empty space as to not distur the alignment
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: ScreenUtil().setSp(35),
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: ScreenUtil().setSp(17),
                                child: AutoSizeText(
                                  '${widget.vehicleTypeName}', //Empty space as to not distur the alignment
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: ScreenUtil().setSp(17),
                                    fontFamily: 'Helvetica',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
