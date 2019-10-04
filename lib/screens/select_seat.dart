import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/data/select_seat_one_way_model.dart';
import 'package:gunsel/widgets/button.dart';
import 'package:http/http.dart' as http;

Map<int, dynamic> selectedSeats;

class SelectSeat extends StatelessWidget {
  Map<String, dynamic> ticketData;
  SelectSeat({
    @required this.ticketData,
  });
  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
      appBarIcon: backArrow,
      appBarIncluded: true,
      backgroundImage: scaffoldImg,
      bodyWidget: SelectSeatScreen(
        ticketData: this.ticketData,
      ),
      appBarTitle: 'Select Seat',
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

    if (widget.ticketData['BuyTicketData']['RoundWayCheck']) {
      if (widget.ticketData['BuyTicketData']['SecondLegCheck']) {
        this.seatsData = await selectSeatModelObj.getSeatsData(
          widget.ticketData['SecondLeg']['TicketData']['TravelVariantId'],
        );
        rows = this.seatsData['Data']['VehicleTypeModel']['ColumnCount'];
        columns = this.seatsData['Data']['VehicleTypeModel']['RowCount'];

        for (var seat in this.seatsData['Data']['VehicleTypeModel']
            ['VehicleTypePlanItems']) {
          if (seat['PointType'] == 10) {
            seatMap[seat['PointNumber']] = seat;
          }
        }
      } else {
        this.seatsData = await selectSeatModelObj.getSeatsData(
          widget.ticketData['FirstLeg']['TicketData']['TravelVariantId'],
        );
        rows = this.seatsData['Data']['VehicleTypeModel']['ColumnCount'];
        columns = this.seatsData['Data']['VehicleTypeModel']['RowCount'];

        for (var seat in this.seatsData['Data']['VehicleTypeModel']
            ['VehicleTypePlanItems']) {
          if (seat['PointType'] == 10) {
            seatMap[seat['PointNumber']] = seat;
          }
        }
      }
    } else {
      this.seatsData = await selectSeatModelObj.getSeatsData(
        widget.ticketData['FirstLeg']['TicketData']['TravelVariantId'],
      );
      rows = this.seatsData['Data']['VehicleTypeModel']['ColumnCount'];
      columns = this.seatsData['Data']['VehicleTypeModel']['RowCount'];

      for (var seat in this.seatsData['Data']['VehicleTypeModel']
          ['VehicleTypePlanItems']) {
        if (seat['PointType'] == 10) {
          seatMap[seat['PointNumber']] = seat;
        }
      }
    }

    return true;
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
                        width: 400,
                        image: wizardOne,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: widget.ticketData['BuyTicketData']
                              ['SecondLegCheck']
                          ? SelectSeatTicket(
                              day: int.parse(widget.ticketData['SecondLeg']
                                      ['TicketData']['DepartureDate']
                                  .substring(8, 10)),
                              month: int.parse(widget.ticketData['SecondLeg']
                                      ['TicketData']['DepartureDate']
                                  .substring(5, 7)),
                              year: int.parse(widget.ticketData['SecondLeg']
                                      ['TicketData']['DepartureDate']
                                  .substring(0, 4)),
                              arrivalStation: widget.ticketData['SecondLeg']
                                  ['TicketData']['ToStation']['StationName'],
                              departureStation: widget.ticketData['SecondLeg']
                                  ['TicketData']['FromStation']['StationName'],
                              departureTime: widget.ticketData['SecondLeg']
                                      ['TicketData']['DepartureTime']
                                  .substring(0, 5),
                              arrivalTime: widget.ticketData['SecondLeg']
                                      ['TicketData']['ArrivalTime']
                                  .substring(0, 5),
                            )
                          : SelectSeatTicket(
                              day: int.parse(widget.ticketData['FirstLeg']
                                      ['TicketData']['DepartureDate']
                                  .substring(8, 10)),
                              month: int.parse(widget.ticketData['FirstLeg']
                                      ['TicketData']['DepartureDate']
                                  .substring(5, 7)),
                              year: int.parse(widget.ticketData['FirstLeg']
                                      ['TicketData']['DepartureDate']
                                  .substring(0, 4)),
                              arrivalStation: widget.ticketData['FirstLeg']
                                  ['TicketData']['ToStation']['StationName'],
                              departureStation: widget.ticketData['FirstLeg']
                                  ['TicketData']['FromStation']['StationName'],
                              departureTime: widget.ticketData['FirstLeg']
                                      ['TicketData']['DepartureTime']
                                  .substring(0, 5),
                              arrivalTime: widget.ticketData['FirstLeg']
                                      ['TicketData']['ArrivalTime']
                                  .substring(0, 5),
                            ),
                    ),
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
                  btnText: 'Search',
                  btnTextFontSize: 40,
                  whenPressed: () {
                    if (selectedSeats.length != 0) {
                      if (widget.ticketData['BuyTicketData']['RoundWayCheck']) {
                        if (widget.ticketData['BuyTicketData']
                            ['SecondLegCheck']) {
                          widget.ticketData['SecondLeg']
                                  ['SelectedSeatsNumber'] =
                              selectedSeats.keys.toList();
                          widget.ticketData['SecondLeg']
                                  ['SelectedSeatsBlockIds'] =
                              selectedSeats.values.toList();
                        } else {
                          widget.ticketData['FirstLeg']['SelectedSeatsNumber'] =
                              selectedSeats.keys.toList();
                          widget.ticketData['FirstLeg']
                                  ['SelectedSeatsBlockIds'] =
                              selectedSeats.values.toList();
                        }
                      } else {
                        widget.ticketData['FirstLeg']['SelectedSeatsNumber'] =
                            selectedSeats.keys.toList();
                        widget.ticketData['FirstLeg']['SelectedSeatsBlockIds'] =
                            selectedSeats.values.toList();
                      }
                      Navigator.pushNamed(context, detailScreen,
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
                crossAxisCount: 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 7
              ),
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
            padding: EdgeInsets.only(left: 40.0, right: 50.0, top: 10.0),
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
          if (widget.seatData['SeatStatus'] == 0) {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            String token = prefs.getString('Token');
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
                "TravelVariantId": widget.ticketData['BuyTicketData']
                        ['SecondLegCheck']
                    ? widget.ticketData['SecondLeg']['TicketData']
                        ['TravelVariantId']
                    : widget.ticketData['FirstLeg']['TicketData']
                        ['TravelVariantId'],
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
            } else {
              http.Response response = await http.delete(
                'https://test-api.gunsel.ua/Public.svc/UnblockTravelSeat/${widget.seatData['TravelSeatBlockId']}',
                headers: {'token': token},
              );
              widget.seatData['TravelSeatBlockId'] = null;
              selectedSeats.remove(widget.seatData['PointNumber']);
              widget.refresh();
              setState(() {
                makeItGreen = false;
              });
            }
          }
        }
      },
      child: Stack(
        children: <Widget>[
          Container(
            width: 40.0,
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
            width: 40.0,
            height: 40.0,
            child: Center(
              child: Text(
                makeItGreen
                    ? widget.seatData['PointNumber'].toString()
                    : selectedSeats.length < 4
                        ? widget.seatData['PointNumber'].toString()
                        : '', // commented code is for disappearing seats number when 4 seats are selected
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Helvetica'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SelectSeatTicket extends StatelessWidget {
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
                            '$day',
                            style: TextStyle(
                              fontSize: 120,
                              color: Colors.black,
                              fontFamily: 'SFProText',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        padding: EdgeInsets.only(left: (day > 9 ? 0.0 : 30.0)),
                      ),
                      Padding(
                        child: Text(
                          '$month $year',
                          style: TextStyle(
                            fontSize: 35,
                            color: Colors.black,
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        padding: EdgeInsets.only(left: (day > 9 ? 0.0 : 30.0)),
                      )
                    ],
                  ),
                  SizedBox(
                    width: (day > 9 ? 55.0 : 130.0),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(right: 100),
                          child: Text(
                            '$departureStation',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                      Text(
                        '$departureTime',
                        style: TextStyle(
                          fontSize: 80,
                          color: Color.fromRGBO(14, 52, 113, 10),
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
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(right: 130),
                          child: Text(
                            '$arrivalStation',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                      Text(
                        '$arrivalTime',
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
