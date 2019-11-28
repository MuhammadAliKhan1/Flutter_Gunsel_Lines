import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/widgets/button.dart';

import 'package:gunsel/data/sharedPreference.dart';

class TicketSummary extends StatefulWidget {
  Map<String, dynamic> ticketData;
  TicketSummary({
    @required this.ticketData,
  });

  @override
  _TicketSummaryState createState() => _TicketSummaryState();
}

class _TicketSummaryState extends State<TicketSummary> {
  String enJson = "", uaJson = "", ruJson = "", plJson = "";
  SharePreferencelogin sh = SharePreferencelogin();
  String paymentInfo = "Payment Info";

  void selectTicketlan() async {
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
        paymentInfo = "Payment Info";
      } else if (b == 1) {
        paymentInfo = "Інформація Про Платіж";
      } else if (b == 2) {
        paymentInfo = "Информация Об Оплате";
      } else if (b == 3) {
        paymentInfo = "Informacje O Płatności";
      }
    });
  }

  @override
  void initState() {
    super.initState();
    selectTicketlan();
  }

  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
      appBarIcon: backArrow,
      appBarIncluded: true,
      backgroundImage: scaffoldImg,
      bodyWidget: TicketSummaryScreen(ticketData: this.widget.ticketData),
      appBarTitle: paymentInfo,
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
  double total;
  Map<String, dynamic> userData;
  void initState() {
    detailslan();
    super.initState();
    widget.ticketData['BuyTicketData']['RoundWayCheck']
        ? total = ((widget.ticketData['FirstLeg']['TicketData']['TicketPrice'] *
                widget.ticketData['FirstLeg']['SeatCount']) +
            (widget.ticketData['SecondLeg']['TicketData']['TicketPrice'] *
                widget.ticketData['SecondLeg']['SeatCount']))
        : total = (widget.ticketData['FirstLeg']['TicketData']['TicketPrice'] *
            widget.ticketData['FirstLeg']['SeatCount']);

    if (widget.ticketData['FirstLeg']['TicketData']['TravelVariantLeg2'] !=
        null)
      total += widget.ticketData['FirstLeg']['TicketData']['TravelVariantLeg2']
          ['TicketPrice'];
    if (widget.ticketData['BuyTicketData']['RoundWayCheck']) {
      if (widget.ticketData['SecondLeg']['TicketData']['TravelVariantLeg2'] !=
          null)
        total += widget.ticketData['SecondLeg']['TicketData']
            ['TravelVariantLeg2']['TicketPrice'];
    }
    userData = Map();
  }

  SharePreferencelogin sh = SharePreferencelogin();
  String enJson = "", uaJson = "", ruJson = "", plJson = "";
  String yourSeat = "Your seat";
  String details = "Details";
  String purchaseDetails = "Purchase Details";
  String purchase = "Purchase";
  String totalPrice = "Total Price";
  String pay = "Pay";

  void detailslan() async {
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
        yourSeat = enData["your_seat"];
        details = enData["details"];
        purchaseDetails = "Purchase Details";
        purchase = "Purchase";
        totalPrice = "Total Price";
        pay = enData["pay"];
      } else if (b == 1) {
        yourSeat = uaData["your_seat"];
        details = uaData["details"];
        purchaseDetails = "Деталі придбання";
        purchase = "Купівля";
        totalPrice = "Повна Вартість";
        pay = uaData["pay"];
      } else if (b == 2) {
        yourSeat = ruData["your_seat"];
        details = ruData["details"];
        purchaseDetails = "Детали покупки";
        purchase = "покупка";
        totalPrice = "Полная Стоимость";
        pay = ruData["pay"];
      } else if (b == 3) {
        yourSeat = plData["your_seat"];
        details = plData["details"];
        purchaseDetails = "Szczegóły zakupu";
        purchase = "Zakup";
        totalPrice = "Wartość Całkowita";
        pay = plData["pay"];
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
                                color: Colors.white,
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
                              color: Colors.yellow,
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
              (widget.ticketData['FirstLeg']['TicketData']
                          ['TravelVariantLeg2'] !=
                      null)
                  ? SliverPadding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return TicketSummaryTicket(
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
                                      ['TicketData']['TravelVariantLeg2']
                                  ['ToStation']['StationName'],
                              departureStation: widget.ticketData['FirstLeg']
                                      ['TicketData']['TravelVariantLeg2']
                                  ['FromStation']['StationName'],
                              departureTime: widget.ticketData['FirstLeg']
                                          ['TicketData']['TravelVariantLeg2']
                                      ['DepartureTime']
                                  .substring(0, 5),
                              arrivalTime: widget.ticketData['FirstLeg']
                                          ['TicketData']['TravelVariantLeg2']
                                      ['ArrivalTime']
                                  .substring(0, 5),
                              seatsDetail: widget.ticketData['FirstLeg']
                                      ['TravelVariantLeg2']['SeatVoyagerInfo']
                                  [(index + 1)],
                              ticketPrice: widget.ticketData['FirstLeg']
                                      ['TicketData']['TravelVariantLeg2']
                                  ['TicketPrice'],
                              currencyType: widget.ticketData['FirstLeg']
                                      ['TicketData']['TravelVariantLeg2']
                                  ['Currency']['CurrencyName'],
                            );
                          },
                          childCount: widget.ticketData['FirstLeg']
                              ['TravelVariantLeg2']['SeatCount'],
                        ),
                      ))
                  : SliverToBoxAdapter(),
              widget.ticketData['BuyTicketData']['RoundWayCheck']
                  ? SliverPadding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return TicketSummaryTicket(
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
                              seatsDetail: widget.ticketData['SecondLeg']
                                  ['SeatVoyagerInfo'][(index + 1)],
                              ticketPrice: widget.ticketData['SecondLeg']
                                  ['TicketData']['TicketPrice'],
                              currencyType: widget.ticketData['SecondLeg']
                                  ['TicketData']['Currency']['CurrencyName'],
                            );
                          },
                          childCount: widget.ticketData['SecondLeg']
                              ['SeatCount'],
                        ),
                      ))
                  : SliverToBoxAdapter(),
              (widget.ticketData['BuyTicketData']['RoundWayCheck'] &&
                      (widget.ticketData['SecondLeg']['TicketData']
                              ['TravelVariantLeg2'] !=
                          null))
                  ? SliverPadding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return TicketSummaryTicket(
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
                                      ['TicketData']['TravelVariantLeg2']
                                  ['ToStation']['StationName'],
                              departureStation: widget.ticketData['SecondLeg']
                                      ['TicketData']['TravelVariantLeg2']
                                  ['FromStation']['StationName'],
                              departureTime: widget.ticketData['SecondLeg']
                                          ['TicketData']['TravelVariantLeg2']
                                      ['DepartureTime']
                                  .substring(0, 5),
                              arrivalTime: widget.ticketData['SecondLeg']
                                          ['TicketData']['TravelVariantLeg2']
                                      ['ArrivalTime']
                                  .substring(0, 5),
                              seatsDetail: widget.ticketData['SecondLeg']
                                      ['TravelVariantLeg2']['SeatVoyagerInfo']
                                  [(index + 1)],
                              ticketPrice: widget.ticketData['SecondLeg']
                                      ['TicketData']['TravelVariantLeg2']
                                  ['TicketPrice'],
                              currencyType: widget.ticketData['SecondLeg']
                                      ['TicketData']['TravelVariantLeg2']
                                  ['Currency']['CurrencyName'],
                            );
                          },
                          childCount: widget.ticketData['SecondLeg']
                              ['TravelVariantLeg2']['SeatCount'],
                        ),
                      ))
                  : SliverToBoxAdapter(),
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
                        '$totalPrice:          ${total.toStringAsFixed(0)} UAH',
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
            btnText: pay,
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
                      ['SeatVoyagerInfo'][i]['Number'],
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
              if (widget.ticketData['FirstLeg']['TicketData']
                      ['TravelVariantLeg2'] !=
                  null)
                for (int i = 1;
                    i <=
                        widget.ticketData['FirstLeg']['TravelVariantLeg2']
                            ['SeatCount'];
                    ++i) {
                  tickets.add({
                    "SeatNo": widget.ticketData['FirstLeg']['TravelVariantLeg2']
                        ['SeatVoyagerInfo'][i]['SeatNumber'],
                    "FirstName": widget.ticketData['FirstLeg']
                        ['TravelVariantLeg2']['SeatVoyagerInfo'][i]['Name'],
                    "LastName": widget.ticketData['FirstLeg']
                        ['TravelVariantLeg2']['SeatVoyagerInfo'][i]['Surname'],
                    "PhoneNumber": widget.ticketData['FirstLeg']
                        ['TravelVariantLeg2']['SeatVoyagerInfo'][i]['Number'],
                    "Email": widget.ticketData['FirstLeg']['TravelVariantLeg2']
                        ['SeatVoyagerInfo'][i]['Email'],
                    "ChairNumber": widget.ticketData['FirstLeg']
                            ['TravelVariantLeg2']['SeatVoyagerInfo'][i]
                        ['SeatNumber'],
                    "PassengerOrder": widget.ticketData['FirstLeg']
                        ['TravelVariantLeg2']['SeatCount'],
                    "CountryId": widget.ticketData['FirstLeg']['TicketData']
                        ['TravelVariantLeg2']['FromStation']['CountryId'],
                    "TravelVariantId": widget.ticketData['FirstLeg']
                        ['TicketData']['TravelVariantLeg2']['TravelVariantId'],
                    "TravelSeatBlockId": widget.ticketData['FirstLeg']
                        ['TravelVariantLeg2']['SelectedSeatsBlockIds'][(i - 1)],
                  });
                }
              if (widget.ticketData['BuyTicketData']['RoundWayCheck'])
                for (int i = 1;
                    i <= widget.ticketData['SecondLeg']['SeatCount'];
                    ++i) {
                  tickets.add({
                    "SeatNo": widget.ticketData['SecondLeg']['SeatVoyagerInfo']
                        [i]['SeatNumber'],
                    "FirstName": widget.ticketData['SecondLeg']
                        ['SeatVoyagerInfo'][i]['Name'],
                    "LastName": widget.ticketData['SecondLeg']
                        ['SeatVoyagerInfo'][i]['Surname'],
                    "PhoneNumber": widget.ticketData['SecondLeg']
                        ['SeatVoyagerInfo'][i]['Number'],
                    "Email": widget.ticketData['SecondLeg']['SeatVoyagerInfo']
                        [i]['Email'],
                    "ChairNumber": widget.ticketData['SecondLeg']
                        ['SeatVoyagerInfo'][i]['SeatNumber'],
                    "PassengerOrder": widget.ticketData['SecondLeg']
                        ['SeatCount'],
                    "CountryId": widget.ticketData['SecondLeg']['TicketData']
                        ['FromStation']['CountryId'],
                    "TravelVariantId": widget.ticketData['SecondLeg']
                        ['TicketData']['TravelVariantId'],
                    "TravelSeatBlockId": widget.ticketData['SecondLeg']
                        ['SelectedSeatsBlockIds'][(i - 1)],
                  });
                }
              if (widget.ticketData['BuyTicketData']['RoundWayCheck'] &&
                  (widget.ticketData['SecondLeg']['TicketData']
                          ['TravelVariantLeg2'] !=
                      null))
                for (int i = 1;
                    i <=
                        widget.ticketData['SecondLeg']['TravelVariantLeg2']
                            ['SeatCount'];
                    ++i) {
                  tickets.add({
                    "SeatNo": widget.ticketData['SecondLeg']
                            ['TravelVariantLeg2']['SeatVoyagerInfo'][i]
                        ['SeatNumber'],
                    "FirstName": widget.ticketData['SecondLeg']
                        ['TravelVariantLeg2']['SeatVoyagerInfo'][i]['Name'],
                    "LastName": widget.ticketData['SecondLeg']
                        ['TravelVariantLeg2']['SeatVoyagerInfo'][i]['Surname'],
                    "PhoneNumber": widget.ticketData['SecondLeg']
                        ['TravelVariantLeg2']['SeatVoyagerInfo'][i]['Number'],
                    "Email": widget.ticketData['SecondLeg']['TravelVariantLeg2']
                        ['SeatVoyagerInfo'][i]['Email'],
                    "ChairNumber": widget.ticketData['SecondLeg']
                            ['TravelVariantLeg2']['SeatVoyagerInfo'][i]
                        ['SeatNumber'],
                    "PassengerOrder": widget.ticketData['SecondLeg']
                        ['TravelVariantLeg2']['SeatCount'],
                    "CountryId": widget.ticketData['SecondLeg']['TicketData']
                        ['TravelVariantLeg2']['FromStation']['CountryId'],
                    "TravelVariantId": widget.ticketData['SecondLeg']
                        ['TicketData']['TravelVariantLeg2']['TravelVariantId'],
                    "TravelSeatBlockId": widget.ticketData['SecondLeg']
                        ['TravelVariantLeg2']['SelectedSeatsBlockIds'][(i - 1)],
                  });
                }
              body = json.encode({
                "CustomerFirstName": null.toString(),
                "CustomerLastName": null.toString(),
                "CustomerCountryId": widget.ticketData['FirstLeg']['TicketData']
                    ['FromStation']['CountryId'],
                "CustomerPhoneNumber": null.toString(),
                "CustomerEmail": null.toString(),
                "CustomerTravelSeatBlockId": widget.ticketData['FirstLeg']
                    ['SelectedSeatsBlockIds'][0],
                "PaymentChannel": 40,
                "TicketItems": tickets,
                "AddSubscriber": widget.ticketData['SubscriberCheckBox'],
              });
              String url = 'https://api.gunsel.ua/Public.svc/SellTicket';
              print("body is"+body.toString());
              http.Response response = await http.post(
                url,
                body: body,
                headers: {
                  'token': token,
                },
              );
              if (jsonDecode(response.body)['Data'] != null) {
                String payFormHtml =
                    '<html>${jsonDecode(jsonDecode(response.body)['Data'])['HTML']}</html>';
                userData = widget.ticketData;
                userData['PayFormHTML'] = payFormHtml;
                Navigator.of(context).pushNamedAndRemoveUntil(
                  oneWayScreen,
                  (Route<dynamic> route) => false,
                );

                print("Json Decode data is:"+jsonDecode(response.body)['Data'].toString());
                Navigator.pushNamed(context, payScreen, arguments: userData);

              } else {
                print('Data is null');
                print(response.body);
                print(body);
              }
            },
          ),
          alignment: Alignment.bottomCenter,
        ),
      ],
    );
  }
}

class TicketSummaryTicket extends StatefulWidget {
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
  _TicketSummaryTicketState createState() => _TicketSummaryTicketState();
}

class _TicketSummaryTicketState extends State<TicketSummaryTicket> {
  SharePreferencelogin sh = SharePreferencelogin();
  String enJson = "", uaJson = "", ruJson = "", plJson = "";
  String bustype = "Bus Type: Comfort";
  String seats = "Seats";
  String departure = "DEPARTURE";
  String arrival = "ARRIVAL";

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
        bustype = "Bus Type: Comfort+";
        seats = enData["seats"];
        departure = "DEPARTURE";
        arrival = "ARRIVAL";
      } else if (b == 1) {
        bustype = "Тип автобуса: Комфорт+";
        seats = uaData["seats"];
        departure = "ВИХІДНА ПОЗИЦІЯ";
        arrival = "ПРИБУТТЯ";
      } else if (b == 2) {
        bustype = "Тип автобуса: Комфорт+";
        seats = ruData["seats"];
        departure = "ИСХОДНАЯ ПОЗИЦИЯ";
        arrival = "ПРИБЫТИЕ";
      } else if (b == 3) {
        seats = plData["seats"];
        departure = "POZYCJA WYJŚCIOWA";
        arrival = "PRZYJAZD";
        bustype = "Typ autobusu: Comfort+";
      }
    });
  }

  @override
  void initState() {
    super.initState();
    detailsBarlan();
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        height: 490,
        width: 700,
        margin: EdgeInsets.only(
          top: 10.0,
          bottom: 20.0,
        ),
        child: Stack(
          children: <Widget>[
            Image(
              image: purchasedTicket2,
              width: ScreenUtil().setWidth(1300),
              height: ScreenUtil().setHeight(700),
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
                                            '${widget.day}',
                                            style: TextStyle(
                                              fontSize: ScreenUtil(
                                                      allowFontScaling: true)
                                                  .setSp(200),
                                              color: Colors.black,
                                              fontFamily: 'SFProText',
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          Text(
                                            '${widget.month} ${widget.year}',
                                            style: TextStyle(
                                              fontSize: 40,
                                              color: Colors.black,
                                              fontFamily: 'Helvetica',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: ScreenUtil().setWidth(250),
                                      child: AutoSizeText(
                                        '$bustype +',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                ScreenUtil().setHeight(30),
                                            fontFamily: 'Helvetica',
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          '$seats: ',
                                          style: TextStyle(
                                            color:
                                                Color.fromRGBO(14, 52, 113, 10),
                                            fontFamily: 'Helvetica',
                                            fontWeight: FontWeight.w600,
                                            fontSize: ScreenUtil(
                                              allowFontScaling: true,
                                            ).setSp(40),
                                          ),
                                        ),
                                        Text(
                                          '${widget.seatsDetail['SeatNumber']}',
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
                                                Container(
                                                  width:
                                                      ScreenUtil().setSp(150),
                                                  child: AutoSizeText(
                                                    '${widget.departureStation}',
                                                    style:
                                                        TextStyle(fontSize: 21),
                                                    maxLines: 2,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width:
                                                      ScreenUtil().setSp(100),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  '${widget.departureTime}',
                                                  style: TextStyle(
                                                    fontSize: ScreenUtil(
                                                            allowFontScaling:
                                                                true)
                                                        .setSp(140),
                                                    color: Color.fromRGBO(
                                                        14, 52, 113, 10),
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
                                                Container(
                                                  height: ScreenUtil()
                                                      .setHeight(50),
                                                  width: ScreenUtil()
                                                      .setWidth(250),
                                                  child: AutoSizeText(
                                                    departure,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: ScreenUtil()
                                                          .setHeight(50),
                                                      fontFamily: 'Helvetica',
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
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
                                                Container(
                                                  width:
                                                      ScreenUtil().setSp(150),
                                                  child: AutoSizeText(
                                                    '${widget.arrivalStation}',
                                                    style:
                                                        TextStyle(fontSize: 21),
                                                    maxLines: 2,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width:
                                                      ScreenUtil().setSp(100),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  '${widget.arrivalTime}',
                                                  style: TextStyle(
                                                    fontSize: ScreenUtil(
                                                            allowFontScaling:
                                                                true)
                                                        .setSp(140),
                                                    color: Color.fromRGBO(
                                                        14, 52, 113, 10),
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
                                                Container(
                                                  height: ScreenUtil()
                                                      .setHeight(50),
                                                  width: ScreenUtil()
                                                      .setWidth(250),
                                                  child: AutoSizeText(
                                                    arrival,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: ScreenUtil()
                                                            .setHeight(50),
                                                        fontFamily: 'Helvetica',
                                                        fontWeight:
                                                            FontWeight.w700),
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
                                          '    ${widget.seatsDetail['Name']} ${widget.seatsDetail['Surname']}',
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
                                          '${widget.ticketPrice.toStringAsFixed(0)}',
                                          style: TextStyle(
                                            color:
                                                Color.fromRGBO(14, 52, 113, 10),
                                            fontFamily: 'Helvetica',
                                            fontWeight: FontWeight.w600,
                                            fontSize: ScreenUtil(
                                              allowFontScaling: true,
                                            ).setSp(70),
                                          ),
                                        ),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 5.0),
                                            child: Text(
                                              '${widget.currencyType}           ',
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    14, 52, 113, 10),
                                                fontFamily: 'Helvetica',
                                                fontWeight: FontWeight.w600,
                                                fontSize: ScreenUtil(
                                                  allowFontScaling: true,
                                                ).setSp(40),
                                              ),
                                            )),
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
