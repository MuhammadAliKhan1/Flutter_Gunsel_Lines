import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/data/select_seat_one_way_model.dart';
import 'package:gunsel/widgets/button.dart';
import 'package:http/http.dart' as http;
import 'package:gunsel/data/sharedPreference.dart';

Map<int, dynamic> selectedSeats;

class SelectSeat_TransferWay extends StatefulWidget {
  Map<String, dynamic> ticketData;
  SelectSeat_TransferWay({
    @required this.ticketData,
  });

  @override
  _SelectSeat_TransferWayState createState() => _SelectSeat_TransferWayState();
}

class _SelectSeat_TransferWayState extends State<SelectSeat_TransferWay> {
  Function loadScreen;
  SharePreferencelogin sh = SharePreferencelogin();
  String selectTicket = "Select a Seat";
  bool unblockLoad;

  void selectTicketlan() async {
    int b;
    int a = await sh.getshared1();

    setState(() {
      b = a;

      if (b == 1) {
        selectTicket = "Виберіть місце";
      } else if (b == 2) {
        selectTicket = "Select a Seat";
      } else if (b == 3) {
        selectTicket = "Выберите место";
      }
    });
  }

  @override
  void initState() {
    super.initState();
    selectTicketlan();
    loadScreen = () {
      if (unblockLoad)
        unblockLoad = false;
      else
        unblockLoad = true;
      setState(() {});
    };
    unblockLoad = false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (selectedSeats.length > 0 && !unblockLoad) {
            List pointNumbers = selectedSeats.keys.toList();
            SharedPreferences prefs = await SharedPreferences.getInstance();
            String token = prefs.getString('Token');
            unblockLoad = true;
            setState(() {});
            for (int pointNumber in pointNumbers) {
              http.Response response = await http.delete(
                'https://test-api.gunsel.ua/Public.svc/UnblockTravelSeat/${selectedSeats[pointNumber]}',
                headers: {'token': token},
              );
            }
            selectedSeats.clear();
            unblockLoad = false;
          }
          if (!unblockLoad) Navigator.pop(context);
        },
        child: GunselScaffold(
          appBarIcon: backArrow,
          appBarIncluded: true,
          backgroundImage: scaffoldImg,
          bodyWidget: Stack(
            children: <Widget>[
              SelectSeatScreen(
                ticketData: this.widget.ticketData,
                loadScreenFunction: loadScreen,
              ),
              unblockLoad
                  ? Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.black.withOpacity(0.5),
                    )
                  : Container(),
            ],
          ),
          appBarTitle: selectTicket,
          customFunction: () async {
            if (selectedSeats.length > 0 && !unblockLoad) {
              List pointNumbers = selectedSeats.keys.toList();
              SharedPreferences prefs = await SharedPreferences.getInstance();
              String token = prefs.getString('Token');
              unblockLoad = true;
              setState(() {});
              for (int pointNumber in pointNumbers) {
                http.Response response = await http.delete(
                  'https://test-api.gunsel.ua/Public.svc/UnblockTravelSeat/${selectedSeats[pointNumber]}',
                  headers: {'token': token},
                );
              }
              selectedSeats.clear();
              unblockLoad = false;
            }
            if (!unblockLoad) Navigator.of(context).pop();
          },
          appBarTitleIncluded: true,
          drawerIncluded: false,
        ));
  }
}

class SelectSeatScreen extends StatefulWidget {
  Map<String, dynamic> ticketData;
  Function loadScreenFunction;
  SelectSeatScreen({
    @required this.ticketData,
    @required this.loadScreenFunction,
  });

  @override
  _SelectSeatScreenState createState() => _SelectSeatScreenState();
}

class _SelectSeatScreenState extends State<SelectSeatScreen> {
  Map<String, dynamic> seatsData;
  Map<int, dynamic> seatMap;
  int rows, columns;
  Function refresh;
  Future<dynamic> _dataFetched;
  @override
  void initState() {
    widget.ticketData['FirstLeg']['TravelVariantLeg2'] = Map();
    selectTicketlan();
    getData();
    super.initState();
    _dataFetched = getData();
    seatMap = Map();
    selectedSeats = Map();
    refresh = () {
      setState(() {});
    };
  }

  getData() async {
    SelectSeatModel selectSeatModelObj = SelectSeatModel();

    this.seatsData = await selectSeatModelObj.getSeatsData(
      widget.ticketData['FirstLeg']['TicketData']['TravelVariantLeg2']
          ['TravelVariantId'],
    );
    rows = this.seatsData['Data']['VehicleTypeModel']['ColumnCount'];
    columns = this.seatsData['Data']['VehicleTypeModel']['RowCount'];

    for (var seat in this.seatsData['Data']['VehicleTypeModel']
        ['VehicleTypePlanItems']) {
      if (seat['PointType'] == 10) {
        seatMap[seat['PointNumber']] = seat;
      }
    }

    return true;
  }

  SharePreferencelogin sh = SharePreferencelogin();
  String yourSeat = "Your seat";
  String details = "Details";
  String purchaseDetails = "Purchase Details";
  String purchase = "Purchase";
  String search = "Search";
  String busInfo = "Bus Info::";
  String selected = "Selected";
  String empty = "Free";
  String busy = "Occupied";

  void selectTicketlan() async {
    int b;
    int a = await sh.getshared1();

    setState(() {
      b = a;

      if (b == 1) {
        yourSeat = "Ваше місце";
        details = "Деталі";
        purchaseDetails = "Деталі придбання";
        purchase = "Купівля";
        search = "Пошук";
        busInfo = "Інформація про автобус ::";
        selected = "Вибрано";
        empty = "Безкоштовно";
        busy = "Окуповані";
      } else if (b == 2) {
        yourSeat = "Your seat";
        details = "Details";
        purchaseDetails = "Purchase Details";
        purchase = "Purchase";
        search = "Search";
        busInfo = "Bus info::";
        selected = "Selected";
        empty = "Free";
        busy = "Occupied";
      } else if (b == 3) {
        yourSeat = "Ваше место";
        details = "подробности";
        purchaseDetails = "Детали покупки";
        purchase = "покупка";
        search = "Поиск";
        busInfo = "Информация об автобусе ::";
        selected = "выбранный";
        empty = "Свободно";
        busy = "занятый";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(yourSeat,
                            style: TextStyle(
                                color: Colors.yellow,
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.w600)),
                        Text(
                          details,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          purchaseDetails,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          purchase,
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
                        width: 400,
                        image: wizardOne,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: SelectSeatTicket(
                        day: int.parse(widget.ticketData['FirstLeg']
                                    ['TicketData']['TravelVariantLeg2']
                                ['DepartureDate']
                            .substring(8, 10)),
                        month: int.parse(widget.ticketData['FirstLeg']
                                    ['TicketData']['TravelVariantLeg2']
                                ['DepartureDate']
                            .substring(5, 7)),
                        year: int.parse(widget.ticketData['FirstLeg']
                                    ['TicketData']['TravelVariantLeg2']
                                ['DepartureDate']
                            .substring(0, 4)),
                        arrivalStation: widget.ticketData['FirstLeg']
                                ['TicketData']['TravelVariantLeg2']['ToStation']
                            ['StationName'],
                        departureStation: widget.ticketData['FirstLeg']
                                ['TicketData']['TravelVariantLeg2']
                            ['FromStation']['StationName'],
                        departureTime: widget.ticketData['FirstLeg']
                                    ['TicketData']['TravelVariantLeg2']
                                ['DepartureTime']
                            .substring(0, 5),
                        arrivalTime: widget.ticketData['FirstLeg']['TicketData']
                                ['TravelVariantLeg2']['ArrivalTime']
                            .substring(0, 5),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(
                        left: 30.0,
                        right: 50.0,
                      ),
                      title: Text(
                        '$busInfo',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Helvetica',
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      trailing: Image(
                        image: bus,
                        height: ScreenUtil().setSp(55),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: red,
                              ),
                            ),
                            Container(
                                width: ScreenUtil().setWidth(140),
                                child: AutoSizeText(
                                  '   $busy',
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: Colors.white,
                              ),
                            ),
                            Container(
                                width: ScreenUtil().setWidth(180),
                                child: AutoSizeText(
                                  '   $empty',
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: green,
                              ),
                            ),
                            Container(
                                width: ScreenUtil().setWidth(170),
                                child: AutoSizeText(
                                  '   $selected',
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              getSeatGrid(_dataFetched),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 60,
                ),
              )
            ],
          ),
        ),
        selectedSeats.length == 0
            ? Container()
            : Align(
                child: GunselButton(
                  btnWidth: 500,
                  btnText: search,
                  btnTextFontSize: 40,
                  whenPressed: () {
                    if (selectedSeats.length != 0) {
                      widget.ticketData['FirstLeg']['TravelVariantLeg2']
                          ['SelectedSeatsNumber'] = selectedSeats.keys.toList();
                      widget.ticketData['FirstLeg']['TravelVariantLeg2']
                              ['SelectedSeatsBlockIds'] =
                          selectedSeats.values.toList();
                      Navigator.pushNamed(context, details_TransferWay,
                          arguments: widget.ticketData);
                    }
                  },
                ),
                alignment: Alignment.bottomCenter,
              ),
      ],
    );
  }

  getSeatGrid(_future) {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return SliverToBoxAdapter(
              child: Image(
            image: loadingAnim,
            height: ScreenUtil().setSp(150),
          ));

        if (this.seatsData == null)
          return SliverToBoxAdapter(child: Text('null'));
        else
          return SliverPadding(
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, crossAxisSpacing: 10, mainAxisSpacing: 10),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return GridTile(
                      child: Row(
                    children: <Widget>[
                      (index == 2 || (index / 2) % 2 == 0)
                          ? getSpacer()
                          : Container(),
                      (index == 2 || (index / 2) % 2 == 1)
                          ? getSpacer()
                          : Container(),
                      Seat(
                        loadScreen: widget.loadScreenFunction,
                        refresh: this.refresh,
                        seatData: seatMap[(index + 1)],
                        ticketData: widget.ticketData,
                      ),
                    ],
                  ));
                },
                childCount: seatMap.length,
              ),
            ),
            padding: EdgeInsets.only(left: 30.0, right: 40.0, top: 10.0),
          );
      },
    );
  }

  getSpacer() => Spacer();
}

class Seat extends StatefulWidget {
  Map<String, dynamic> seatData;
  Function refresh;
  Function loadScreen;
  Map<String, dynamic> ticketData;
  Seat({
    @required this.refresh,
    @required this.seatData,
    @required this.ticketData,
    @required this.loadScreen,
  });
  @override
  _SeatState createState() => _SeatState();
}

class _SeatState extends State<Seat> {
  bool makeItGreen;

  @override
  void initState() {
    super.initState();
    makeItGreen = selectedSeats.containsKey(widget.seatData['PointNumber'])
        ? true
        : false;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (selectedSeats.length < 4 || makeItGreen) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          String token = prefs.getString('Token');
          if (widget.seatData['SeatStatus'] == 0) {
            if (!makeItGreen) {
              var body = json.encode({
                "SeatNo": widget.seatData['PointNumber'].toString(),
                "FirstName": null.toString(),
                "LastName": null.toString(),
                "PhoneNumber": null.toString(),
                "Email": null.toString(),
                "ChairNumber": widget.seatData['PointNumber'].toString(),
                "PassengerOrder": 1.toString(),
                "CountryId": null.toString(),
                "TravelVariantId": widget.ticketData['FirstLeg']['TicketData']
                    ['TravelVariantLeg2']['TravelVariantId'],
              });
              String url =
                  'https://test-api.gunsel.ua/Public.svc/BlockTravelSeat';

              widget.loadScreen();
              http.Response response = await http.post(
                url,
                body: body,
                headers: {
                  'token': token,
                },
              );
              if (jsonDecode(response.body)['Data'] != null) {
                widget.seatData['SeatStatus'] = 10;
                makeItGreen = true;
                widget.seatData['TravelSeatBlockId'] = (jsonDecode(
                    jsonDecode(response.body)['Data'])['TravelSeatBlockId']);
                selectedSeats[widget.seatData['PointNumber']] =
                    widget.seatData['TravelSeatBlockId'];

                widget.refresh();
                widget.loadScreen();
                setState(
                  () {},
                );
              }
            }
          } else if (makeItGreen) {
            widget.loadScreen();
            http.Response response = await http.delete(
              'https://test-api.gunsel.ua/Public.svc/UnblockTravelSeat/${widget.seatData['TravelSeatBlockId']}',
              headers: {'token': token},
            );
            if (response.statusCode == 200) {
              makeItGreen = false;
              widget.seatData['SeatStatus'] = 0;
              widget.seatData['TravelSeatBlockId'] = null;
              selectedSeats.remove(widget.seatData['PointNumber']);
              widget.refresh();

              widget.loadScreen();
              setState(() {});
            }
          }
        }
      },
      child: Stack(
        children: <Widget>[
          Container(
            width: 50.0,
            height: 50.0,
            child: Image(
              image: makeItGreen
                  ? selectedSeat
                  : widget.seatData['SeatStatus'] == 0 ? emptySeat : busySeat,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            width: 50.0,
            height: 40.0,
            child: Center(
              child: Text(
                widget.seatData['PointNumber'].toString(),
                // commented code is for disappearing seats number when 4 seats are selected
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Helvetica',
                  color: makeItGreen
                      ? Colors.white
                      : widget.seatData['SeatStatus'] == 0
                          ? Colors.black
                          : Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SelectSeatTicket extends StatefulWidget {
  String departureStation, departureTime, arrivalStation, arrivalTime;
  int day, month, year;
  SelectSeatTicket({
    @required this.day,
    @required this.month,
    @required this.year,
    @required this.departureStation,
    @required this.arrivalStation,
    @required this.departureTime,
    @required this.arrivalTime,
  });

  @override
  _SelectSeatTicketState createState() => _SelectSeatTicketState();
}

class _SelectSeatTicketState extends State<SelectSeatTicket> {
  SharePreferencelogin sh = SharePreferencelogin();
  String departure = "DEPARTURE";
  String arrival = "ARRIVAL";

  void searchTicketlan() async {
    int b;
    int a = await sh.getshared1();

    setState(() {
      b = a;

      if (b == 1) {
        departure = "ВИДАЛЕННЯ";
        arrival = "ПРИЙНЯТТЯ";
      } else if (b == 2) {
        departure = "DEPARTURE";
        arrival = "ARRIVAL";
      } else if (b == 3) {
        departure = "ВЫЕЗД";
        arrival = "ПРИБЫТИЕ";
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
              padding: EdgeInsets.only(left: 75.0, bottom: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        child: SizedBox(
                          height: 120,
                          child: Text(
                            '${widget.day}',
                            style: TextStyle(
                              fontSize: 120,
                              color: Colors.black,
                              fontFamily: 'SFProText',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        padding: EdgeInsets.only(
                            left: (widget.day > 9 ? 0.0 : 30.0)),
                      ),
                      Padding(
                        child: Text(
                          '${widget.month} ${widget.year}',
                          style: TextStyle(
                            fontSize: 35,
                            color: Colors.black,
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        padding: EdgeInsets.only(
                            left: (widget.day > 9 ? 0.0 : 30.0)),
                      )
                    ],
                  ),
                  SizedBox(
                    width: (widget.day > 9 ? 90.0 : 100.0),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: ScreenUtil().setSp(150),
                            child: AutoSizeText(
                              '${widget.departureStation}',
                              style: TextStyle(fontSize: 25),
                              maxLines: 2,
                            ),
                          ),
                          SizedBox(
                            width: ScreenUtil().setSp(100),
                          ),
                        ],
                      ),
                      Text(
                        '${widget.departureTime}',
                        style: TextStyle(
                          fontSize: 80,
                          color: lightBlue,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        departure,
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
                    width: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: ScreenUtil().setSp(150),
                            child: AutoSizeText(
                              '${widget.arrivalStation}',
                              style: TextStyle(fontSize: 25),
                              maxLines: 2,
                            ),
                          ),
                          SizedBox(
                            width: ScreenUtil().setSp(100),
                          ),
                        ],
                      ),
                      Text(
                        '${widget.arrivalTime}',
                        style: TextStyle(
                          fontSize: 80,
                          color: lightBlue,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        arrival,
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
