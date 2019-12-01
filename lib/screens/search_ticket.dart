import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/data/travel_list_one_way_model.dart';
import 'package:gunsel/data/sharedPreference.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class SearchTicket extends StatefulWidget {
  Map<String, dynamic> buyTicketData;
  SearchTicket({
    this.buyTicketData,
  });

  @override
  _SearchTicketState createState() => _SearchTicketState();
}

class _SearchTicketState extends State<SearchTicket> {
  String enJson = "", uaJson = "", ruJson = "", plJson = "";
  SharePreferencelogin sh = SharePreferencelogin();
  String searchTicket = "Search Ticket",
      busNotAvailable = "Looks like there are no buses available on this date",
      changeDate = "Please change the date to get your result";

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
        searchTicket = "Search Ticket";
        busNotAvailable =
            "Looks like there are no buses available on this date";
        changeDate = "Please change the date to get your result";
      } else if (b == 1) {
        searchTicket = "Пошук Квитку";
        busNotAvailable = "Схоже, немає автобусів на цю дату";
        changeDate = "Будь ласка, змініть дату, щоб отримати результат";
      } else if (b == 2) {
        searchTicket = "Поиск Билета";
        busNotAvailable = "Похоже, что на эту дату нет автобусов";
        changeDate = "Пожалуйста, измените дату, чтобы получить свой результат";
      } else if (b == 3) {
        searchTicket = "Wyszukaj Bilet";
        busNotAvailable =
            "Wygląda na to, że w tym dniu nie ma dostępnych autobusów";
        changeDate = "Zmień datę, aby uzyskać wynik";
      }
    });
  }

  @override
  void initState() {
    super.initState();
    searchTicketlan();
  }

  Widget build(BuildContext context) {
    return GunselScaffold(
      key: _scaffoldKey,
      appBarIcon: backArrow,
      appBarIncluded: true,
      backgroundImage: scaffoldImg,
      appBarColor: gunselColor,
      appBarTitle: searchTicket,
      appBarTitleIncluded: true,
      drawerIncluded: false,
      bodyWidget: SearchTicketScreen(
        buyTicketMap: widget.buyTicketData,
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
  SharePreferencelogin sh = SharePreferencelogin();
  String searchTicket = "Search Ticket",
      busNotAvailable = "Looks like there are no buses available on this date",
      changeDate = "Please change the date to get your result";

  void searchTicketlan() async {
    int b;
    int a = await sh.getshared1();

    setState(() {
      b = a;

      if (b == 0) {
        searchTicket = "Search Ticket";
        busNotAvailable =
            "Looks like there are no buses available on this date";
        changeDate = "Please change the date to get your result";
      } else if (b == 1) {
        searchTicket = "Пошук Квитку";
        busNotAvailable = "Схоже, немає автобусів на цю дату";
        changeDate = "Будь ласка, змініть дату, щоб отримати результат";
      } else if (b == 2) {
        searchTicket = "Поиск Билета";
        busNotAvailable = "Похоже, что на эту дату нет автобусов";
        changeDate = "Пожалуйста, измените дату, чтобы получить свой результат";
      } else if (b == 3) {
        searchTicket = "Wyszukaj Bilet";
        busNotAvailable =
            "Wygląda na to, że w tym dniu nie ma dostępnych autobusów";
        changeDate = "Zmień datę, aby uzyskać wynik";
      }
    });
  }

  int initialDay, initialMonth, initialYear;
  bool makeItGrey, stopClick, isLeapYear;
  Map<String, dynamic> travelListTicketData;
  Future<dynamic> _datafetched;
  Function refresh;
  List<int> thirtyOneDays, thirtyDays;
  @override
  void initState() {
    super.initState();
    searchTicketlan();
    travelListTicketData = Map();
    travelListTicketData['BuyTicketData'] = widget.buyTicketMap;
    _datafetched = getData();
    initialDay = travelListTicketData['BuyTicketData']['DepartureDay'];
    initialMonth = travelListTicketData['BuyTicketData']['DepartureMonth'];
    initialYear = travelListTicketData['BuyTicketData']['DepartureYear'];
    isLeapYear = (initialYear % 400 == 0 || initialYear % 100 != 0) &&
            (initialYear % 4 == 0)
        ? true
        : false;
    thirtyOneDays = [1, 3, 5, 7, 8, 10, 12];
    thirtyDays = [4, 6, 9, 11];
    makeItGrey = true;
    stopClick = false;
    refresh = () {
      setState(() {});
    };
  }

  getData() async {
    stopClick = true;
    TravelListOneWayModel travelListPODO = TravelListOneWayModel();
    travelListTicketData['FirstLegTickets'] =
        await travelListPODO.getRoundWayFirstLegList(
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
            getTicketContainer(
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
          child: getTicketFirstLegList(_datafetched),
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
                  int lastDay;
                  lastDay = thirtyOneDays.contains(
                          travelListTicketData['BuyTicketData']
                                  ['DepartureMonth'] -
                              1)
                      ? 31
                      : (thirtyDays.contains(
                              travelListTicketData['BuyTicketData']
                                      ['DepartureMonth'] -
                                  1))
                          ? 30
                          : isLeapYear ? 29 : 28;
                  if (!makeItGrey) {
                    if (travelListTicketData['BuyTicketData']['DepartureDay'] >=
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
                              ['DepartureDay'] = lastDay;
                          travelListTicketData['BuyTicketData']
                              ['DepartureMonth'] = 12;
                        } else {
                          travelListTicketData['BuyTicketData']
                              ['DepartureMonth']--;
                          travelListTicketData['BuyTicketData']
                              ['DepartureDay'] = lastDay;
                        }
                      } else {
                        travelListTicketData['BuyTicketData']['DepartureDay']--;
                      }
                    }
                    setState(() {
                      _datafetched = getData();
                    });
                  }
                  if (travelListTicketData['BuyTicketData']['DepartureDay'] ==
                          this.initialDay &&
                      travelListTicketData['BuyTicketData']['DepartureMonth'] ==
                          this.initialMonth &&
                      travelListTicketData['BuyTicketData']['DepartureYear'] ==
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
                  int lastDay;
                  lastDay = thirtyOneDays.contains(
                          travelListTicketData['BuyTicketData']
                              ['DepartureMonth'])
                      ? 31
                      : (thirtyDays.contains(
                              travelListTicketData['BuyTicketData']
                                  ['DepartureMonth']))
                          ? 30
                          : isLeapYear ? 29 : 28;
                  if (travelListTicketData['BuyTicketData']['DepartureDay'] <=
                      lastDay) {
                    if (travelListTicketData['BuyTicketData']['DepartureDay'] ==
                        lastDay) {
                      if (travelListTicketData['BuyTicketData']
                              ['DepartureMonth'] ==
                          12) {
                        travelListTicketData['BuyTicketData']
                            ['DepartureYear']++;
                        travelListTicketData['BuyTicketData']['DepartureDay'] =
                            1;
                        travelListTicketData['BuyTicketData']
                            ['DepartureMonth'] = 1;
                      } else {
                        travelListTicketData['BuyTicketData']
                            ['DepartureMonth']++;
                        travelListTicketData['BuyTicketData']['DepartureDay'] =
                            1;
                      }
                    } else
                      travelListTicketData['BuyTicketData']['DepartureDay']++;
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
            Container(
              height: ScreenUtil().setHeight(30),
              width: ScreenUtil().setWidth(450),
              child: AutoSizeText(
                "$departureStation - $arrivalStation",
                maxFontSize: 30,
                minFontSize: 10,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "MyriadPro",
                ),
              ),
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
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
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
                  ticketData['FirstLeg']['TicketData']['TravelVariantLeg2'] ==
                          null
                      ? travelListTicketData['FirstLegTickets']['Data'][index]
                              ['ArrivalDate']
                          .substring(0, 10)
                      : travelListTicketData['FirstLegTickets']['Data'][index]
                              ['TravelVariantLeg2']['ArrivalDate']
                          .substring(0, 10),
                  travelListTicketData['FirstLegTickets']['Data'][index]
                          ['DepartureTime']
                      .substring(0, 5),
                  ticketData['FirstLeg']['TicketData']['TravelVariantLeg2'] ==
                          null
                      ? travelListTicketData['FirstLegTickets']['Data'][index]
                              ['ArrivalTime']
                          .substring(0, 5)
                      : travelListTicketData['FirstLegTickets']['Data'][index]
                              ['TravelVariantLeg2']['ArrivalTime']
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
                  travelListTicketData['FirstLegTickets']['Data'][index]
                      ['FromStation']['Address'],
                  ticketData['FirstLeg']['TicketData']['TravelVariantLeg2'] ==
                          null
                      ? travelListTicketData['FirstLegTickets']['Data'][index]
                          ['ToStation']['Address']
                      : travelListTicketData['FirstLegTickets']['Data'][index]
                          ['TravelVariantLeg2']['ToStation']['Address'],
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
  String departureAddress;
  String arrivalAddress;
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
    this.departureAddress,
    this.arrivalAddress,
  );

  @override
  _TicketState createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  String departure = '',
      arrival = '',
      enJson = "",
      uaJson = "",
      ruJson = "",
      seats = 'Available Seats',
      transfer = "Transfer",
      waitTime = "Wait Time",
      plJson = "";
  bool disableTicket, arrivalDateIsGreat;

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

    SharedPreferences prefs = await SharedPreferences.getInstance();
    int languageint = prefs.getInt("languageIndicator");

    setState(() {
      if (languageint == 0) {
        //English
        seats = "Available Seats";
        transfer = "Transfer";
        waitTime = "Wait Time";
      } else if (languageint == 1) {
        //Ukrainian
        transfer = "Передача";
        waitTime = "Зачекайте часу";
        seats = "Вільних місць";
      } else if (languageint == 2) {
        //Russian
        transfer = "Перечислить";
        seats = "Свободных мест";
        waitTime = "Время ожидания";
      } else if (languageint == 3) {
        //Polski
        waitTime = "Czas oczekiwania";
        transfer = "Przeniesienie";
        seats = "Puste siedzenia";
      }
    });
  }

  @override
  void initState() {
    disableTicket = widget.numberOfSeats > 0 ? false : true;
    arrivalDateIsGreat = arrivalDateGreaterThanDepartureDate();
    super.initState();
    searchTicketlan();
    departure =
        widget.ticketData['FirstLeg']['TicketData']['FromStation']['CityName'];
    if (widget.ticketData['FirstLeg']['TicketData']['TravelVariantLeg2'] ==
        null) {
      arrival =
          widget.ticketData['FirstLeg']['TicketData']['ToStation']['CityName'];
    } else {
      arrival = widget.ticketData['FirstLeg']['TicketData']['TravelVariantLeg2']
          ['ToStation']['CityName'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!disableTicket)
          Navigator.pushNamed(
            context,
            selectSeatScreen,
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
                color: disableTicket ? Colors.grey : Colors.white,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 35.0, top: 5.0),
                  child: FittedBox(
                    child: Container(
                      height: 120,
                      width: 390,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    height: ScreenUtil().setSp(60),
                                    child: AutoSizeText(
                                      '${widget.departureTime}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(14, 52, 113, 10),
                                          fontSize: ScreenUtil().setSp(60),
                                          fontFamily: 'Helvetica',
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Container(
                                    width: ScreenUtil().setWidth(150),
                                    child: AutoSizeText(
                                      departure,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Helvetica',
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  //Departure Address
                                  Container(
                                    height: ScreenUtil().setHeight(22),
                                    child: Text(
                                      '${widget.departureAddress}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: ScreenUtil().setHeight(22),
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: ScreenUtil().setHeight(22),
                                    child: Text(
                                      DateTime.parse(widget.departureDate)
                                              .day
                                              .toString() +
                                          "/" +
                                          DateTime.parse(widget.departureDate)
                                              .month
                                              .toString() +
                                          "/" +
                                          DateTime.parse(widget.departureDate)
                                              .year
                                              .toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: ScreenUtil().setHeight(22),
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: ScreenUtil().setHeight(20),
                                    child: AutoSizeText(
                                      '$seats:${widget.numberOfSeats}',
                                      minFontSize: 14,
                                      style: TextStyle(
                                        color: disableTicket
                                            ? Colors.red
                                            : Color.fromRGBO(14, 52, 113, 10),
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    height: ScreenUtil().setSp(60),
                                    child: AutoSizeText(
                                      '${widget.arrivalTime}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(14, 52, 113, 10),
                                          fontSize: ScreenUtil().setSp(60),
                                          fontFamily: 'Helvetica',
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Container(
                                    width: ScreenUtil().setWidth(150),
                                    child: AutoSizeText(
                                      arrival,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Helvetica',
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  //Arrival Address
                                  Container(
                                    height: ScreenUtil().setHeight(22),
                                    child: Text(
                                      '${widget.arrivalAddress}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: ScreenUtil().setHeight(22),
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: ScreenUtil().setHeight(22),
                                    child: Text(
                                      DateTime.parse(widget.arrivalDate)
                                              .day
                                              .toString() +
                                          "/" +
                                          DateTime.parse(widget.arrivalDate)
                                              .month
                                              .toString() +
                                          "/" +
                                          DateTime.parse(widget.arrivalDate)
                                              .year
                                              .toString(),
                                      style: TextStyle(
                                        color: arrivalDateIsGreat
                                            ? Colors.red
                                            : Colors.black,
                                        fontSize: ScreenUtil().setHeight(22),
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: ScreenUtil().setHeight(20),
                                    child: AutoSizeText(
                                      '',
                                      minFontSize: 14,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        height: ScreenUtil().setSp(80),
                                        child: AutoSizeText(
                                          '${widget.ticketPrice.toStringAsFixed(0)}',
                                          style: TextStyle(
                                            color:
                                                Color.fromRGBO(14, 52, 113, 10),
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
                          widget.ticketData['FirstLeg']['TicketData']
                                      ['TravelVariantLeg2'] ==
                                  null
                              ? Container(
                                  width: 0,
                                  height: 0,
                                )
                              : Container(
                                  child: AutoSizeText(
                                    '$transfer: ${widget.ticketData['FirstLeg']['TicketData']['TravelVariantLeg2']['FromStation']['CityName']} (${widget.ticketData['FirstLeg']['TicketData']['TravelVariantLeg2']['FromStation']['Address']}) $waitTime: ${widget.ticketData['FirstLeg']['TicketData']['TravelVariantLeg2']['TransferWaitingTime']}',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 12,
                                      fontFamily: 'Helvetica',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                )
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

  bool arrivalDateGreaterThanDepartureDate() {
    int departureDay = DateTime.parse(widget.departureDate).day;
    int departureMonth = DateTime.parse(widget.departureDate).month;
    int departureYear = DateTime.parse(widget.departureDate).year;
    int arrivalDay = DateTime.parse(widget.arrivalDate).day;
    int arrivalMonth = DateTime.parse(widget.arrivalDate).month;
    int arrivalYear = DateTime.parse(widget.arrivalDate).year;
    return (arrivalYear > departureYear
        ? true
        : (arrivalMonth > departureMonth
            ? true
            : (arrivalDay > departureDay ? true : false)));
  }
}
