import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/data/select_seat_one_way_model.dart';
import 'package:gunsel/widgets/button.dart';
import 'package:http/http.dart' as http;
import 'package:gunsel/data/sharedPreference.dart';

Map<int, dynamic> selectedSeats;

class SelectSeat_TransferWay_RoundWay extends StatefulWidget {
  Map<String, dynamic> ticketData;
  SelectSeat_TransferWay_RoundWay({
    @required this.ticketData,
  });

  @override
  _SelectSeat_TransferWay_RoundWayState createState() => _SelectSeat_TransferWay_RoundWayState();
}

class _SelectSeat_TransferWay_RoundWayState extends State<SelectSeat_TransferWay_RoundWay> {
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
    unblockLoad = false;
  }

  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
      appBarIcon: backArrow,
      appBarIncluded: true,
      backgroundImage: scaffoldImg,
      bodyWidget: Stack(
        children: <Widget>[
          SelectSeatScreen(
            ticketData: this.widget.ticketData,
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
        if (selectedSeats.length > 0) {
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
            print(response.body);
          }
          selectedSeats.clear();
        }
        Navigator.of(context).pop();
      },
      appBarTitleIncluded: true,
      drawerIncluded: false,
    );
  }
}

class SelectSeatScreen extends StatefulWidget {
  Map<String, dynamic> ticketData;
  SelectSeatScreen({
    @required this.ticketData,
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
    widget.ticketData['SecondLeg']['TravelVariantLeg2'] = Map();
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
      widget.ticketData['SecondLeg']['TicketData']['TravelVariantLeg2']
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
  String busInfo = "Bus Info";

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
        busInfo = "Інформація про автобус";
      } else if (b == 2) {
        yourSeat = "Your seat";
        details = "Details";
        purchaseDetails = "Purchase Details";
        purchase = "Purchase";
        search = "Search";
        busInfo = "Bus Info";
      } else if (b == 3) {
        yourSeat = "Ваше место";
        details = "подробности";
        purchaseDetails = "Детали покупки";
        purchase = "покупка";
        search = "Поиск";
        busInfo = "Информация об автобусе";
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
                        day: int.parse(widget.ticketData['SecondLeg']
                                    ['TicketData']['TravelVariantLeg2']
                                ['DepartureDate']
                            .substring(8, 10)),
                        month: int.parse(widget.ticketData['SecondLeg']
                                    ['TicketData']['TravelVariantLeg2']
                                ['DepartureDate']
                            .substring(5, 7)),
                        year: int.parse(widget.ticketData['SecondLeg']
                                    ['TicketData']['TravelVariantLeg2']
                                ['DepartureDate']
                            .substring(0, 4)),
                        arrivalStation: widget.ticketData['SecondLeg']
                                ['TicketData']['TravelVariantLeg2']['ToStation']
                            ['StationName'],
                        departureStation: widget.ticketData['SecondLeg']
                                ['TicketData']['TravelVariantLeg2']
                            ['FromStation']['StationName'],
                        departureTime: widget.ticketData['SecondLeg']
                                    ['TicketData']['TravelVariantLeg2']
                                ['DepartureTime']
                            .substring(0, 5),
                        arrivalTime: widget.ticketData['SecondLeg']['TicketData']
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
                        '$busInfo:',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Helvetica',
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      trailing: Image(
                        image: bus,
                        height: ScreenUtil().setSp(50),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 100),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  'Busy   ',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  color: red,
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Empty   ',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Selected   ',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  color: green,
                                )
                              ],
                            ),
                          ],
                        ))
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
                      widget.ticketData['SecondLeg']['TravelVariantLeg2']
                          ['SelectedSeatsNumber'] = selectedSeats.keys.toList();
                      widget.ticketData['SecondLeg']['TravelVariantLeg2']
                              ['SelectedSeatsBlockIds'] =
                          selectedSeats.values.toList();
                      print(widget.ticketData['SecondLeg']['TravelVariantLeg2']);
                      Navigator.pushNamed(context, detailsRoundWay_TransferWay,
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
  Map<String, dynamic> ticketData;
  Seat({
    @required this.refresh,
    @required this.seatData,
    @required this.ticketData,
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
                "TravelVariantId": widget.ticketData['SecondLeg']['TicketData']
                    ['TravelVariantLeg2']['TravelVariantId'],
              });
              String url =
                  'https://test-api.gunsel.ua/Public.svc/BlockTravelSeat';
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
                setState(
                  () {},
                );
              }
            }
          } else if (makeItGreen) {
            http.Response response = await http.delete(
              'https://test-api.gunsel.ua/Public.svc/UnblockTravelSeat/${widget.seatData['TravelSeatBlockId']}',
              headers: {'token': token},
            );
            print(response.body);
            if (response.statusCode == 200) {
              makeItGreen = false;
              widget.seatData['SeatStatus'] = 0;
              widget.seatData['TravelSeatBlockId'] = null;
              selectedSeats.remove(widget.seatData['PointNumber']);
              widget.refresh();
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
                    width: (widget.day > 9 ? 80.0 : 90.0),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(right: 100),
                          child: Text(
                            '${widget.departureStation}',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w600,
                            ),
                          )),
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
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(right: 130),
                          child: Text(
                            '${widget.arrivalStation}',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w600,
                            ),
                          )),
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