import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/widgets/button.dart';

class TicketSummary extends StatelessWidget {
  Map<String, dynamic> ticketData;
  TicketSummary({
    @required this.ticketData,
  });
  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
      appBarIcon: backArrow,
      appBarIncluded: true,
      backgroundImage: scaffoldImg,
      bodyWidget: TicketSummaryScreen(ticketData: this.ticketData),
      appBarTitle: 'Payment Info',
      appBarTitleIncluded: true,
      drawerIncluded: false,
    );
  }
}

class TicketSummaryScreen extends StatefulWidget {
  Map<String, dynamic> ticketData;
  TicketSummaryScreen({
    @required this.ticketData,
  });
  @override
  _TicketSummaryScreenState createState() => _TicketSummaryScreenState();
}

class _TicketSummaryScreenState extends State<TicketSummaryScreen> {
  @override
  void initState() {
    super.initState();
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
                                color: Colors.white,
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
                              color: Colors.yellow,
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
                        height: 25,
                        width: 400,
                        image: wizardThree,
                      ),
                    ),
                  ],
                ),
              ),
              SliverPadding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return TicketSummaryTicket(
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
                          seatsDetail: widget.ticketData['FirstLeg']
                              ['SeatVoyagerInfo'][(index + 1)],
                          ticketPrice: widget.ticketData['FirstLeg']
                              ['TicketData']['TicketPrice'],
                          currencyType: widget.ticketData['FirstLeg']
                              ['TicketData']['Currency']['CurrencyName'],
                        );
                      },
                      childCount: widget.ticketData['FirstLeg']['SeatCount'],
                    ),
                  )),
              SliverList(
                delegate: SliverChildListDelegate([
                  FittedBox(
                    child: Container(
                      width: 380,
                      height: 180,
                      child: Image(
                        image: moneyImage,
                      ),
                    ),
                  ),
                  FittedBox(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.only(top: 0.5),
                      height: 4.0,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.all(
                          Radius.circular(1),
                        ),
                      ),
                      child: Center(
                          child: Text(
                        'Total Price:          ${(widget.ticketData['FirstLeg']['TicketData']['TicketPrice'] * widget.ticketData['FirstLeg']['SeatCount']).toStringAsFixed(0)} UAH',
                        style: TextStyle(
                          fontFamily: 'MyriadPro',
                          color: darkBlue,
                          fontWeight: FontWeight.w700,
                          fontSize: 2.5,
                        ),
                      )),
                    ),
                  ),
                ]),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 60,
                ),
              ),
            ],
          ),
        ),
        Align(
          child: GunselButton(
            btnWidth: 500,
            btnText: 'Pay',
            btnTextFontSize: 40,
            btnTextColor: darkBlue,
            whenPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              String token = prefs.getString('Token');
              var body;
              List tickets = [];
              for (int i = 1;
                  i <= widget.ticketData['FirstLeg']['SeatCount'];
                  ++i) {
                tickets.add({
                  "SeatNo": widget.ticketData['FirstLeg']['SeatVoyagerInfo'][i]
                      ['SeatNumber'],
                  "FirstName": widget.ticketData['FirstLeg']['SeatVoyagerInfo']
                      [i]['Name'],
                  "LastName": widget.ticketData['FirstLeg']['SeatVoyagerInfo']
                      [i]['Surname'],
                  "PhoneNumber": widget.ticketData['FirstLeg']
                          ['SeatVoyagerInfo'][i]['Number']
                      .substring(1),
                  "Email": widget.ticketData['FirstLeg']['SeatVoyagerInfo'][i]
                      ['Email'],
                  "ChairNumber": widget.ticketData['FirstLeg']
                      ['SeatVoyagerInfo'][i]['SeatNumber'],
                  "PassengerOrder": widget.ticketData['FirstLeg']['SeatCount'],
                  "CountryId": widget.ticketData['FirstLeg']['TicketData']
                      ['FromStation']['CountryId'],
                  "TravelVariantId": widget.ticketData['FirstLeg']['TicketData']
                      ['TravelVariantId'],
                  "TravelSeatBlockId": widget.ticketData['FirstLeg']
                      ['SelectedSeatsBlockIds'][(i - 1)],
                });
              }
              body = json.encode({
                "CustomerFirstName": widget.ticketData['FirstLeg']
                    ['SeatVoyagerInfo'][1]['Name'],
                "CustomerLastName": widget.ticketData['FirstLeg']
                    ['SeatVoyagerInfo'][1]['Surname'],
                "CustomerCountryId": widget.ticketData['FirstLeg']['TicketData']
                    ['FromStation']['CountryId'],
                "CustomerPhoneNumber": widget.ticketData['FirstLeg']
                        ['SeatVoyagerInfo'][1]['Number']
                    .substring(1),
                "CustomerEmail": widget.ticketData['FirstLeg']
                    ['SeatVoyagerInfo'][1]['Email'],
                "CustomerTravelSeatBlockId": widget.ticketData['FirstLeg']
                    ['SelectedSeatsBlockIds'][0],
                "PaymentChannel": 40,
                "TicketItems": tickets,
                "AddSubscriber": widget.ticketData['FirstLeg']
                    ['SubscriberCheckBox']
              });
              String url = 'https://test-api.gunsel.ua/Public.svc/SellTicket';
              http.Response response = await http.post(
                url,
                body: body,
                headers: {
                  'token': token,
                },
              );
              String payFormHtml =
                  '<html>${jsonDecode(jsonDecode(response.body)['Data'])['HTML']}</html>';
              debugPrint(jsonDecode(jsonDecode(response.body)['Data'])['HTML'],
                  wrapWidth: 1024);
              Navigator.of(context).pushNamedAndRemoveUntil(
                oneWayScreen,
                (Route<dynamic> route) => false,
              );
              Navigator.pushNamed(
                context,
                payScreen,
                arguments: payFormHtml,
              );
            },
          ),
          alignment: Alignment.bottomCenter,
        ),
      ],
    );
  }
}

class TicketSummaryTicket extends StatelessWidget {
  String departureStation,
      departureTime,
      arrivalStation,
      arrivalTime,
      currencyType;
  int day, month, year;
  double ticketPrice;
  Map<String, dynamic> seatsDetail;

  TicketSummaryTicket({
    @required this.day,
    @required this.month,
    @required this.year,
    @required this.departureStation,
    @required this.arrivalStation,
    @required this.departureTime,
    @required this.arrivalTime,
    @required this.ticketPrice,
    @required this.currencyType,
    @required this.seatsDetail,
  });
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        height: 490,
        margin: EdgeInsets.only(
          top: 10.0,
          bottom: 20.0,
        ),
        child: Stack(
          children: <Widget>[
            Image(
              image: purchasedTicket,
            ),
            Column(
              children: <Widget>[
                Container(
                  height: 400,
                  width: 729,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 80,
                        width: 500,
                        child: Center(
                          child: Text(
                            '',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontFamily: 'MyriadPro',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 320,
                        width: 700,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            FittedBox(
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                height: 320,
                                width: 250,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Container(
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            '$day',
                                            style: TextStyle(
                                              fontSize: ScreenUtil(
                                                      allowFontScaling: true)
                                                  .setSp(150),
                                              color: Colors.black,
                                              fontFamily: 'SFProText',
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          Text(
                                            '$month $year',
                                            style: TextStyle(
                                              fontSize: 35,
                                              color: Colors.black,
                                              fontFamily: 'Helvetica',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      'Bus Type: Comfort +',
                                      style: TextStyle(
                                        color: darkBlue,
                                        fontFamily: 'Helvetica',
                                        fontSize:
                                            ScreenUtil(allowFontScaling: true)
                                                .setSp(33),
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'Seat: ',
                                          style: TextStyle(
                                            color: darkBlue,
                                            fontFamily: 'Helvetica',
                                            fontWeight: FontWeight.w600,
                                            fontSize: ScreenUtil(
                                              allowFontScaling: true,
                                            ).setSp(40),
                                          ),
                                        ),
                                        Text(
                                          '${seatsDetail['SeatNumber']}',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Helvetica',
                                            fontWeight: FontWeight.w600,
                                            fontSize: ScreenUtil(
                                              allowFontScaling: true,
                                            ).setSp(40),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            FittedBox(
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                height: 320,
                                width: 450,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  '$departureStation                            ',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                    fontFamily: 'Helvetica',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  '$departureTime',
                                                  style: TextStyle(
                                                    fontSize: ScreenUtil(
                                                            allowFontScaling:
                                                                true)
                                                        .setSp(130),
                                                    color: darkBlue,
                                                    fontFamily: 'Helvetica',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  'DEPARTURE',
                                                  style: TextStyle(
                                                    fontSize: ScreenUtil(
                                                            allowFontScaling:
                                                                true)
                                                        .setSp(35),
                                                    color: Colors.black,
                                                    fontFamily: 'Helvetica',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  '$arrivalStation                            ',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                    fontFamily: 'Helvetica',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  '$arrivalTime',
                                                  style: TextStyle(
                                                    fontSize: ScreenUtil(
                                                            allowFontScaling:
                                                                true)
                                                        .setSp(130),
                                                    color: darkBlue,
                                                    fontFamily: 'Helvetica',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  'ARRIVAL',
                                                  style: TextStyle(
                                                    fontSize: ScreenUtil(
                                                            allowFontScaling:
                                                                true)
                                                        .setSp(35),
                                                    color: Colors.black,
                                                    fontFamily: 'Helvetica',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          '     ${seatsDetail['Name']} ${seatsDetail['Surname']}',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Helvetica',
                                            fontSize: ScreenUtil(
                                              allowFontScaling: true,
                                            ).setSp(45),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Text(
                                          '${ticketPrice.toStringAsFixed(0)}',
                                          style: TextStyle(
                                            color: darkBlue,
                                            fontFamily: 'Helvetica',
                                            fontWeight: FontWeight.w600,
                                            fontSize: ScreenUtil(
                                              allowFontScaling: true,
                                            ).setSp(70),
                                          ),
                                        ),
                                        Text(
                                          '$currencyType      ',
                                          style: TextStyle(
                                            color: darkBlue,
                                            fontFamily: 'Helvetica',
                                            fontWeight: FontWeight.w600,
                                            fontSize: ScreenUtil(
                                              allowFontScaling: true,
                                            ).setSp(40),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    width: 729,
                    height: 90,
                    child: Center(
                      child: Container(
                        height: 90,
                        width: 649,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            bottomRight: Radius.circular(40.0),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Center(
                              child: Text(
                                '',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'MyriadPro',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                '',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'MyriadPro',
                                  fontWeight: FontWeight.w600,
                                  color: red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
/* import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/widgets/button.dart';

class TicketSummary extends StatelessWidget {
  Map<String, dynamic> ticketData;
  TicketSummary({
    @required this.ticketData,
  });
  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
      appBarIcon: backArrow,
      appBarIncluded: true,
      backgroundImage: scaffoldImg,
      bodyWidget: TicketSummaryScreen(
        ticketData: this.ticketData,
      ),
      appBarTitle: 'Payment Info',
      appBarTitleIncluded: true,
      drawerIncluded: false,
    );
  }
}

class TicketSummaryScreen extends StatefulWidget {
  Map<String, dynamic> ticketData;
  TicketSummaryScreen({
    @required this.ticketData,
  });
  @override
  _TicketSummaryScreenState createState() => _TicketSummaryScreenState();
}

class _TicketSummaryScreenState extends State<TicketSummaryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(5.0),
      children: <Widget>[
        Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Your seat",
                    style: TextStyle(
                        color: Colors.white,
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
                      color: Colors.yellow,
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
                width: 310,
                image: wizardThree,
              ),
            ),
          ],
        ),
        
        FittedBox(
          child: SizedBox(
            height: 3,
            width: 100,
          ),
        ),
        
        SizedBox(
          height: 14,
        ),
        Center(
            child: GunselButton(
          btnWidth: 600,
          btnFontFamily: 'Helvetica',
          btnText: 'Pay',
          textWeight: FontWeight.w800,
          btnTextFontSize: 40,
          btnTextColor: darkBlue,
          whenPressed: () {
            Navigator.pushNamed(context, payScreen);
          },
        )),
      ],
    );
  }
}


 */
