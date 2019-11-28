import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:http/http.dart';
import 'package:gunsel/data/sharedPreference.dart';
import 'package:auto_size_text/auto_size_text.dart';

class FinalCancelTicket extends StatefulWidget {
  String secureCode,
      ticketNumber,
      ticketId,
      departPlace,
      departTime,
      arrivalPlace,
      arrivalTime,
      name,
      seatNumber,
      bookingDate,
      currencyName,
      paidBack,
      totalCut,
      day,
      month,
      year;
  FinalCancelTicket(
      {Key key,
      this.secureCode,
      this.ticketNumber,
      this.ticketId,
      this.departPlace,
      this.departTime,
      this.arrivalPlace,
      this.arrivalTime,
      this.name,
      this.seatNumber,
      this.bookingDate,
      this.currencyName,
      this.paidBack,
      this.totalCut,
      this.day,
      this.month,
      this.year})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return FinalCancelTicketState(
        this.secureCode,
        this.ticketNumber,
        this.ticketId,
        this.departPlace,
        this.departTime,
        this.arrivalPlace,
        this.arrivalTime,
        this.name,
        this.seatNumber,
        this.bookingDate,
        this.currencyName,
        this.paidBack,
        this.totalCut,
        this.day,
        this.month,
        this.year);
  }
}

class FinalCancelTicketState extends State<FinalCancelTicket> {
  SharePreferencelogin shPref = SharePreferencelogin();

  String secureCode,
      ticketNumber,
      ticketId,
      departPlace,
      departTime,
      arrivalPlace,
      arrivalTime,
      name,
      seatNumber,
      bookingDate,
      currencyName,
      paidBack,
      totalCut,
      day,
      month,
      year;

  FinalCancelTicketState(
      this.secureCode,
      this.ticketNumber,
      this.ticketId,
      this.departPlace,
      this.departTime,
      this.arrivalPlace,
      this.arrivalTime,
      this.name,
      this.seatNumber,
      this.bookingDate,
      this.currencyName,
      this.paidBack,
      this.totalCut,
      this.day,
      this.month,
      this.year);

  SharePreferencelogin sh = SharePreferencelogin();
  String cancelTicket = "Cancel Ticket",
      ticket = "Ticket ",
      busType = "Bus type: comfort+",
      departure = "Departure",
      seatNo = "Seat no: ",
      arrival = " Arrival",
      totalcut = " Total cut",
      paidback = " Paid back",
      cancelticket = "Cancel Ticket",
      successfulCancel = " The ticket was successfully canceled",
      notCancel = "Ticket can not be canceled",
      error = "Error",
      ok = " Ok";

  String enJson = "", uaJson = "", ruJson = "", plJson = "";
  @override
  void initState() {
    super.initState();

    //print("Security Code:"+securityCode+" Book ticket Number:"+bookticketNumber);

    finalCancellan();
  }

  void finalCancellan() async {
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
        cancelTicket = enData["cancel_ticket_page_header"];
        ticket = "Ticket ";
        busType = "Bus type: comfort+";
        departure = enData["departure"];
        seatNo = "Seat no: ";
        arrival = enData["arrival"];
        totalcut = enData["total_cut"];
        paidback = enData["paid_back"];
        cancelticket = enData["cancel_ticket_page_header"];
        successfulCancel = enData["ticket_successfully_canceled"];
        notCancel = "Ticket can not be canceled";
        error = enData["error"];
        ok = enData["ok"];
      } else if (b == 1) {
        cancelTicket = uaData["cancel_ticket_page_header"];
        ticket = "Квиток ";
        busType = "Тип автобуса: комфорт +";
        departure = "Виїзд";
        seatNo = "Ні місця: ";
        arrival = uaData["arrival"];
        totalcut = uaData["total_cut"];
        paidback = uaData["paid_back"];
        cancelticket = uaData["cancel_ticket_page_header"];
        successfulCancel = uaData["ticket_successfully_canceled"];
        notCancel = "Квиток не можна скасувати";
        error = uaData["error"];
        ok = uaData["ok"];
      } else if (b == 2) {
        cancelTicket = ruData["cancel_ticket_page_header"];
        ticket = "Проездной билет ";
        busType = "Тип автобуса: комфорт +";
        departure = "Выезд";
        seatNo = "Место нет: ";
        arrival = ruData["arrival"];
        totalcut = ruData["total_cut"];
        paidback = ruData["paid_back"];
        cancelticket = ruData["cancel_ticket_page_header"];
        successfulCancel = ruData["ticket_successfully_canceled"];
        notCancel = "Билет не может быть отменен";
        error = ruData["error"];
        ok = ruData["ok"];
      } else if (b == 3) {
        cancelTicket = "Anuluj bilet";
        ticket = "Bilet ";
        busType = "Typ autobusu: komfort +";
        departure = "wyjazd";
        seatNo = "Miejsce nr: ";
        arrival = plData["arrival"];
        totalcut = plData["total_cut"];
        paidback = plData["paid_back"];
        cancelticket = "Anuluj bilet";
        successfulCancel = plData["ticket_successfully_canceled"];
        notCancel = "Biletu nie można anulować";
        error = plData["error"];
        ok = plData["ok"];
//

//
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
        appBarIcon: backArrow,
        appBarIncluded: true,
        appBarTitle: cancelTicket,
        appBarTitleIncluded: true,
        drawerIncluded: false,
        backgroundImage: scaffoldImg,
        bodyWidget: ListView(children: <Widget>[
          Container(
            height: 402.0,
            margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: darkBlue,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0))),
                height: 50.0,
                child: Center(
                    child: AutoSizeText(
                  ticket + ticketId,
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      fontFamily: "Helvetica"),
                )),
              ),
              Container(
                color: Colors.white,
                height: ScreenUtil().setHeight(500),
                child:SingleChildScrollView(
                child:Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                            width: ScreenUtil().setWidth(300),
                            padding: EdgeInsets.only(left: 10.0, top: 10.0),
                            child: AutoSizeText(
                              busType,
                              style: TextStyle(color: darkBlue),
                            )),
                        Container(
                            width: ScreenUtil().setWidth(300),
                            padding: EdgeInsets.only(left: 40.0),
                            child: Text(departPlace,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontFamily: "SFProText")))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                            width: ScreenUtil().setWidth(600),
                            padding: EdgeInsets.only(left: 200.0),
                            child: AutoSizeText(
                              departTime,
                              style: TextStyle(
                                  color: darkBlue,
                                  fontSize: 60.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Helvetica"),
                            ))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                            width: ScreenUtil().setWidth(260),
                            padding: EdgeInsets.only(left: 10.0),
                            child: AutoSizeText(day,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 90.0))),
                        Container(
                            width: ScreenUtil().setWidth(340),
                            padding: EdgeInsets.only(
                              left: 60.0,
                            ),
                            child: AutoSizeText(departure,
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0)))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: ScreenUtil().setWidth(300),
                          padding: EdgeInsets.only(left: 10.0),
                          child: AutoSizeText(
                            month + " " + year,
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(300),
                          padding: EdgeInsets.only(left: 40.0),
                          child: AutoSizeText(
                            arrivalPlace,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 20.0, fontFamily: "SFProText"),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                            width: ScreenUtil().setWidth(200),
                            padding: EdgeInsets.only(left: 10.0, bottom: 20.0),
                            child: AutoSizeText(
                              seatNo + seatNumber,
                              maxLines: 1,
                              style: TextStyle(fontSize: 15.0),
                            )),
                        Container(
                            width: ScreenUtil().setWidth(400),
                            padding: EdgeInsets.only(left: 95.0),
                            child: AutoSizeText(
                              arrivalTime,
                              maxLines: 1,
                              style: TextStyle(
                                  color: darkBlue,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Helvetica"),
                            ))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                            width: ScreenUtil().setWidth(300),
                            padding: EdgeInsets.only(left: 10.0),
                            child: AutoSizeText(name,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: darkBlue,
                                    fontWeight: FontWeight.bold))),
                        Container(
                            width: ScreenUtil().setWidth(300),
                            padding: EdgeInsets.only(left: 40.0),
                            child: AutoSizeText(arrival,
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0))),
                      ],
                    ),
                  ],
                ),
              ),
              ),
              //Yaha scrollview
              Container(
                height: ScreenUtil().setHeight(60),
                width: 390,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(211, 211, 211, 8),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0))),
                child: Center(
                    child: Container(
                        width: ScreenUtil().setWidth(400),
                        padding: EdgeInsets.only(left: 50.0),
                        child: Row(
                          children: <Widget>[
                            AutoSizeText(paidBack,
                                maxLines: 1,
                                style: TextStyle(
                                    color: darkBlue,
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.bold)),
                            Container(
                                width: ScreenUtil().setWidth(100),
                                padding: EdgeInsets.only(top: 10.0),
                                child: AutoSizeText(currencyName,
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: darkBlue,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold)))
                          ],
                        ))),
              )
            ]),
          ),
          Container(
            height: ScreenUtil().setHeight(180),
            margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.yellow,
            ),
            child: Column(
              children: <Widget>[
//                Row(
//                  children: <Widget>[
//                    Padding(
//                        padding: EdgeInsets.only(left: 10.0, top: 10.0),
//                        child: Text(
//                          "Canel fees:",
//                          style: TextStyle(
//                              color: Colors.red,
//                              fontSize: 25.0,
//                              fontWeight: FontWeight.bold),
//                        )),
//                    Padding(
//                      padding: EdgeInsets.only(left: 70.0, top: 10.0),
//                      child: Text("14.4",
//                          style: TextStyle(
//                              color: Colors.red,
//                              fontWeight: FontWeight.bold,
//                              fontSize: 20.0)),
//                    ),
//                    Padding(
//                        padding: EdgeInsets.only(left: 5.0, top: 15.0),
//                        child: Text(
//                          currencyName,
//                          style: TextStyle(fontSize: 12.0, color: Colors.red),
//                        )),
//                    Padding(
//                        padding: EdgeInsets.only(right: 10.0, top: 10.0),
//                        child: Text(" %3", style: TextStyle(fontSize: 23.0)))
//                  ],
//                ),
                Row(
                  children: <Widget>[
                    Container(
                        width: ScreenUtil().setWidth(200),
                        height: ScreenUtil().setHeight(100),
                        padding: EdgeInsets.only(left: 10.0, top: 2.0),
                        child: AutoSizeText(
                          totalcut,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        )),
                    Container(
                        width: ScreenUtil().setWidth(250),
                        height: ScreenUtil().setHeight(100),
                        padding: EdgeInsets.only(left: 80.0, top: 2.0),
                        child: AutoSizeText(
                          totalCut,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        )),
                    Container(
                        width: ScreenUtil().setWidth(100),
                        height: ScreenUtil().setHeight(100),
                        padding: EdgeInsets.only(top: 7.0),
                        child: AutoSizeText(
                          currencyName,
                          maxLines: 1,
                          style: TextStyle(color: Colors.red),
                        ))
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0))),
                  height: 50.0,
                  child: Row(
                    children: <Widget>[
                      Container(
                          width: ScreenUtil().setWidth(200),
                          padding: EdgeInsets.only(left: 20.0, top: 5.0),
                          child: AutoSizeText(
                            paidback,
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          )),
                      Container(
                          width: ScreenUtil().setWidth(270),
                          padding: EdgeInsets.only(left: 80.0),
                          child: AutoSizeText(paidBack,
                              maxLines: 1,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35.0,
                                  fontFamily: "Helvetica"))),
                      Container(
                          width: ScreenUtil().setWidth(70),
                          padding: EdgeInsets.only(top: 5.0),
                          child: AutoSizeText(currencyName,
                              maxLines: 1,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  fontFamily: "Helvetica")))
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 380.0,
            height: 50.0,
            margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: RaisedButton(
              child: AutoSizeText(
                cancelticket,
                maxLines: 1,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontFamily: "SFProText",
                    fontWeight: FontWeight.w600),
              ),
              highlightColor: Colors.red,
              color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25.0),
                    topLeft: Radius.circular(25.0)),
              ),
              onPressed: () {
                ticketCancel();
              },
            ),
          ),
        ]));
  }

//  Future<void> getticketInformation() async{
//    String tokens = await shPref.gettokens();
//
//    print("Token is:"+tokens);
//    print("Ticket number is:"+bookticketNumber.toString());
//    print("Security code is:"+securityCode.toString());
//
//
//    String url =
//        'https://test-api.gunsel.ua/Public.svc/GetTicketInformation?1=1&c0=$bookticketNumber&c3=$securityCode';
//   print("url is:"+url.toString());
//
//    Map<String, String> headers = {"token": tokens};
//    Response response = await get(url, headers: headers);
//    // check the status code for the result
//    int statusCode = response.statusCode;
//    //String body = response.body;
//
//
//    Map<String, dynamic> infoapiData = {
//      'Data': jsonDecode(jsonDecode(response.body)['Data'])
//    };
//    print(infoapiData);
//    Cancelticketinfo infoapimodelobj =
//    Cancelticketinfo.fromJson(infoapiData);
//    var infoapifinalData = infoapimodelobj.toJson();
////
////    print("Authenticated token is:" + fbProfData['Data']['Token']);
////    print("First Name is:" + fbProfData['Data']['FirstName']);
////    print("Last Name is:" + fbProfData['Data']['LastName']);
////    print("Image is:" + fbProfData['Data']['ImageURL']);
////    print("Email is:" + fbProfData['Data']['Email']);
//
//
//
//    print("status code is:"+statusCode.toString());
//    print("response body is:"+response.body);
//
//
//   // print("Allow cancel is:"+infoapifinalData['Data']['PenaltyRate'].toString());
//
//    print("Ticket id is :"+infoapifinalData['Data']['Ticket']['TicketId']);
//    print("Departure place :"+infoapifinalData['Data']['Ticket']['FromStationure']['CityName']);
//    print("Departure time :"+infoapifinalData['Data']['Ticket']['DepartureTime']);
//    print("Arrival place :"+infoapifinalData['Data']['Ticket']['ToStation']['CityName']);
//    print("Arrival time :"+infoapifinalData['Data']['Ticket']['ArrivalTime']);
//    print("Name:"+infoapifinalData['Data']['Ticket']['FirstName']+" "+infoapifinalData['Data']['Ticket']['LastName']);
//    print("Seat Number :"+infoapifinalData['Data']['Ticket']['SeatNumber']);
//    print("Booking Date :"+infoapifinalData['Data']['Ticket']['TicketDate']);
//    print("Currency Name :"+infoapifinalData['Data']['Ticket']['Currency']['CurrencyName']);
//    print("Total Paid Back is :"+infoapifinalData['Data']['TotalPaidBack'].toString());
//    print("Total cut:"+infoapifinalData['Data']['TotalCut'].toString());
//
//
//    var moonLanding = DateTime.parse(infoapifinalData['Data']['Ticket']['TicketDate']);
//
//    print("Year is:"+moonLanding.year.toString());
//    print("Date is:"+moonLanding.day.toString());
//    print("Month is:"+moonLanding.month.toString());
//
//
//  }

  Future<void> ticketCancel() async {
    String tokens = await shPref.gettokens();
    String ticketnum = ticketNumber;
    String securitycode = secureCode;

    String url =
        'https://api.gunsel.ua/Public.svc/CancelTicket?c0=$ticketnum&c1=A1A1A4B5-D1C8-4AEC-BD08-2A3FF55440DB&c2=42 131 23 32&c3=$securitycode';
    print("url:" + url.toString());

    Map<String, String> headers = {"token": tokens};
    Response response = await delete(url, headers: headers);
    // check the status code for the result
    int statuscode = response.statusCode;

    print("status code is:" + statuscode.toString());

    if (statuscode == 200) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(successfulCancel),
              actions: <Widget>[
                FlatButton(
                  child: Text(ok),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, oneWayScreen);
                  },
                )
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                error,
              ),
              content: Text(notCancel),
              actions: <Widget>[
                FlatButton(
                  child: Text(ok),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          });
    }
  }
}
