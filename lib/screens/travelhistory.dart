import 'package:gunsel/data/constants.dart';
import 'package:gunsel/data/sharedPreference.dart';
import 'package:http/http.dart';
import 'package:gunsel/data/TravelHistory.dart';
import 'package:gunsel/widgets/button.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  SharePreferencelogin sh = SharePreferencelogin();
  String history = " Travel history";

  void historyTicketlan() async {
    int b;
    int a = await sh.getshared1();

    setState(() {
      b = a;

      if (b == 0) {
        history = " Travel history";
      } else if (b == 1) {
        history = " Історію рейсу";
      } else if (b == 2) {
        history = " Историю рейса";
      } else if (b == 3) {
        history = "Historia podróży";
      }
    });
  }

  @override
  void initState() {
    super.initState();
    historyTicketlan();
  }

  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
      appBarIcon: menuIcon,
      appBarIncluded: true,
      backgroundImage: scaffoldImg,
      bodyWidget: HistoryTicket(),
      appBarTitle: history,
      appBarTitleIncluded: true,
      drawerIncluded: true,
    );
  }
}

class HistoryTicket extends StatefulWidget {
  @override
  _HistoryTicketState createState() => _HistoryTicketState();
}

class _HistoryTicketState extends State<HistoryTicket> {
  SharePreferencelogin shPref = SharePreferencelogin();
  String token;
  int day, year, month;
  var travelProfData;
  bool checkdata = false;
  //SharePreferencelogin sh = SharePreferencelogin();
  String departure = "Departure";
  String arrival = " Arrival";
  String seats = "Seat no";
  String noTickets = "You have no available tickets";
  String ticketDes = "You have a destination? Find out the best tickets";
  String here = " Here";

  String enJson = "", uaJson = "", ruJson = "", plJson = "";

  @override
  void initState() {
    //getToken();
    historyTicketlan();
    getTravelHistory(context);
    super.initState();
  }

//  Future<String> getToken() async
//  {
//    token = await shPref.gettokens();
//    print("data is"+token);
//  }

  void historyTicketlan() async {
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
    int a = await shPref.getshared1();

    setState(() {
      b = a;

      if (b == 0) {
        departure = enData["departure"];
        arrival = enData["arrival"];
        seats = enData["seat_no"];
        noTickets = enData["no_tickets_available_profile"];
        ticketDes = "You have a destination? Find out the best tickets";
        here = enData["here"];
        //ticketError = "OOPS! You have not bought any Ticket";
      } else if (b == 1) {
        departure ="Виїзд";
        arrival = uaData["arrival"];
        seats = uaData["seat_no"];
        noTickets = uaData["no_tickets_available_profile"];
        ticketDes = uaData["is_destination"];
        here = uaData["here"];
        //ticketError = "OOPS! Ви не купили жодного квитка";
      } else if (b == 2) {
        departure = "Выезд";
        arrival = ruData["arrival"];
        seats = ruData["seat_no"];
        noTickets = ruData["no_tickets_available_profile"];
        ticketDes = ruData["is_destination"];
        here = ruData["here"];
        //ticketError = "OOPS! Вы не купили билет";
      } else if (b == 3) {
        departure = "Saída";
        arrival = plData["arrival"];
        ;
        seats = "Miejsce nr";
        noTickets = "Nie masz dostępnych biletów";
        ticketDes = plData["is_destination"];
        here = plData["here"];
        //ticketError = "OOPS! Вы не купили билет";
      }
    });
  }

  Future<String> getTravelHistory(BuildContext context) async {
    try {
      token = await shPref.gettokens();
      String url =
          'https://api.gunsel.ua/Membership.svc/GetMemberTicketList?c0=0';
      Map<String, String> headers = {"token": token};
      //String json = '{"Platform":31,"Language":0,"DeviceToken":null,"Token":"$fbtoken"}';

      print("Token is" + token);

      Response response = await get(url, headers: headers);

      print("Response body is:" + response.body);
      print("Status code is:" + response.statusCode.toString());

      Map<String, dynamic> travelapiData = {
        'Data': jsonDecode(jsonDecode(response.body)['Data'])
      };
      print(travelapiData);
      travelhistory travelprofilemodelobj =
          travelhistory.fromJson(travelapiData);

      travelProfData = travelprofilemodelobj.toJson();

      print("First travel data is:" + travelProfData['Data'].toString());
      print(
          "Travel data length is:" + travelProfData['Data'].length.toString());

      print("Departure time is:" +
          travelProfData['Data'][0]['DepartureTime'].toString());
      print("Departure Date is:" +
          travelProfData['Data'][0]['DepartureDate'].toString());
      print("Seat no :" + travelProfData['Data'][0]['SeatNo'].toString());
      print("Arrival time is:" +
          travelProfData['Data'][0]['ArrivalTime'].toString());
      print("Arrival date is:" +
          travelProfData['Data'][0]['ArrivalDate'].toString());

      print("Ticket Price is:" +
          travelProfData['Data'][0]['TicketPrice'].toString());
      print("Currency Name is:" +
          travelProfData['Data'][0]['Currency'].toString());
      print("Vehicle Type Name is:" +
          travelProfData['Data'][0]['VehicleType']['VehicleTypeName']
              .toString());

      var moonLanding =
          DateTime.parse(travelProfData['Data'][0]['DepartureDate']);

      year = moonLanding.year;
      day = moonLanding.day;
      month = moonLanding.month;

      checkdata = true;
    } catch (e) {
      print("error");
      checkdata = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getTravelHistory(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            );
          else
            return checkdata
                ? ListView.builder(
                    itemCount: travelProfData['Data'].length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                          onTap: () {
                            //Navigator.pushNamed(context, selectSeatScreen);
                          },
                          child: FittedBox(
                              child: Container(
                            margin: EdgeInsets.only(
                                top: 10.0, left: 5.0, right: 5.0),
                            height: 112,
                            child: Stack(
                              children: <Widget>[
                                Image(
                                  image: smallTicket,
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 30.0, top: 5.0),
                                    child: FittedBox(
                                      child: Container(
                                        height: 112,
                                        width: 380,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Text(
                                                  travelProfData['Data'][index]
                                                      ['DepartureTime'],
                                                  style: TextStyle(
                                                      color: darkBlue,
                                                      fontSize: 40,
                                                      fontFamily: 'Helvetica',
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                Text(
                                                  departure,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontFamily: 'Helvetica',
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                Text(
                                                  DateTime.parse(travelProfData[
                                                                  'Data'][index]
                                                              ['DepartureDate'])
                                                          .day
                                                          .toString() +
                                                      "." +
                                                      DateTime.parse(travelProfData[
                                                                  'Data'][index]
                                                              ['DepartureDate'])
                                                          .month
                                                          .toString() +
                                                      "." +
                                                      DateTime.parse(
                                                              travelProfData['Data']
                                                                      [index]
                                                                  ['DepartureDate'])
                                                          .year
                                                          .toString(),
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontFamily: 'Helvetica',
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Text(
                                                  seats +
                                                      ":" +
                                                      travelProfData['Data']
                                                              [index]['SeatNo']
                                                          .toString(),
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Text(
                                                  travelProfData['Data'][index]
                                                      ['ArrivalTime'],
                                                  style: TextStyle(
                                                      color: darkBlue,
                                                      fontSize: 40,
                                                      fontFamily: 'Helvetica',
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                Text(
                                                  arrival,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontFamily: 'Helvetica',
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                Text(
                                                  DateTime.parse(travelProfData[
                                                  'Data'][index]
                                                  ['ArrivalDate'])
                                                      .day
                                                      .toString() +
                                                      "." +
                                                      DateTime.parse(travelProfData[
                                                      'Data'][index]
                                                      ['ArrivalDate'])
                                                          .month
                                                          .toString() +
                                                      "." +
                                                      DateTime.parse(
                                                          travelProfData['Data']
                                                          [index]
                                                          ['ArrivalDate'])
                                                          .year
                                                          .toString(), //Empty space as to not distur the alignment
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Column(
                                                  children: <Widget>[
                                                    Container(
                                                      height: 43,
                                                      child: Text(
                                                        travelProfData['Data']
                                                                    [index]
                                                                ['TicketPrice']
                                                            .toString(),
                                                        style: TextStyle(
                                                          color: darkBlue,
                                                          fontSize: 50,
                                                          fontFamily:
                                                              'Helvetica',
                                                          fontWeight:
                                                              FontWeight.w800,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      travelProfData['Data']
                                                              [index][
                                                          'Currency'], //Empty space as to not distur the alignment
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20,
                                                        fontFamily: 'Helvetica',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  travelProfData['Data'][index]
                                                          ['VehicleType'][
                                                      'VehicleTypeName'], //Empty space as to not distur the alignment
                                                  style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.8),
                                                    fontSize: 12,
                                                    fontFamily: 'Helvetica',
                                                    fontWeight: FontWeight.w600,
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
                          )));
                    })
                : Container(
                    margin: EdgeInsets.only(top: 120.0),
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Container(
                            child: Text(noTickets,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 25.0),
                            child: Text(ticketDes,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center),
                          ),
                        ),
                        Center(
                          child: Container(
                            height: 60,
                            width: 450,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                GunselButton(
                                  btnWidth: 290,
                                  whenPressed: () {
                                    Navigator.pushNamed(context, oneWayScreen);
                                  },
                                  btnFontFamily: 'SFProText',
                                  textWeight: FontWeight.w500,
                                  btnText: here,
                                  btnTextFontSize: 35,
                                  btnHeight: 42,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
        });
  }
}
