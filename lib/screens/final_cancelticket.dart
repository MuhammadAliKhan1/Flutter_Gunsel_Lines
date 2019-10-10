import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:http/http.dart';
import 'package:gunsel/data/sharedPreference.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:gunsel/data/cancelticketinfomodel.dart';


class FinalCancelTicket extends StatefulWidget {
  String secureCode, ticketNumber, ticketId, departPlace, departTime, arrivalPlace, arrivalTime, name, seatNumber, bookingDate, currencyName, paidBack, totalCut, day, month, year;
  FinalCancelTicket({Key key, this.secureCode, this.ticketNumber, this.ticketId, this.departPlace, this.departTime, this.arrivalPlace, this.arrivalTime, this.name, this.seatNumber, this.bookingDate, this.currencyName, this.paidBack,this.totalCut, this.day, this.month, this.year})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return FinalCancelTicketState(this.secureCode, this.ticketNumber, this.ticketId, this.departPlace, this.departTime, this.arrivalPlace, this.arrivalTime, this.name, this.seatNumber, this.bookingDate, this.currencyName, this.paidBack,this.totalCut, this.day, this.month, this.year);
  }
}

class FinalCancelTicketState extends State<FinalCancelTicket> {
SharePreferencelogin shPref = SharePreferencelogin();


String secureCode, ticketNumber, ticketId, departPlace, departTime, arrivalPlace, arrivalTime, name, seatNumber, bookingDate, currencyName, paidBack, totalCut, day, month, year;

  FinalCancelTicketState(this.secureCode, this.ticketNumber, this.ticketId, this.departPlace, this.departTime, this.arrivalPlace, this.arrivalTime, this.name, this.seatNumber, this.bookingDate, this.currencyName, this.paidBack,this.totalCut, this.day, this.month, this.year);

  SharePreferencelogin sh = SharePreferencelogin();
  String cancelTicket = "Cancel Ticket";
  @override
  void initState() {
    super.initState();

    //print("Security Code:"+securityCode+" Book ticket Number:"+bookticketNumber);

    finalCancellan();




  }

  void finalCancellan() async {
    int b;
    int a = await sh.getshared1();

    setState(() {
      b = a;

      if (b == 1) {
        cancelTicket = "Скасувати квиток";
      } else if (b == 2) {
        cancelTicket = "Cancel Ticket";
      } else if (b == 3) {
        cancelTicket = "Отменить билет";
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
                  "Ticket " + ticketId,
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
                height: 300.0,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 10.0),
                            child: AutoSizeText(
                              "Bus type comfort+",
                              style: TextStyle(color: darkBlue),
                            )),
                        Padding(
                            padding: EdgeInsets.only(left: 80.0),
                            child: Text(departPlace,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontFamily: "SFProText")))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
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
                        Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: AutoSizeText(day,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 90.0))),
                        Padding(
                            padding: EdgeInsets.only(
                              left: 85.0,
                            ),
                            child: AutoSizeText("DEPARTURE",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0)))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: AutoSizeText(
                            month + " " + year,
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 100.0),
                          child: AutoSizeText(
                            arrivalPlace,
                            style: TextStyle(
                                fontSize: 20.0, fontFamily: "SFProText"),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 10.0, bottom: 20.0),
                            child: AutoSizeText(
                              "Seat no: " + seatNumber,
                              style: TextStyle(fontSize: 15.0),
                            )),
                        Padding(
                            padding: EdgeInsets.only(left: 120.0),
                            child: AutoSizeText(
                              arrivalTime,
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
                        Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: AutoSizeText(name,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: darkBlue,
                                    fontWeight: FontWeight.bold))),
                        Padding(
                            padding: EdgeInsets.only(left: 90.0),
                            child: AutoSizeText("ARRIVAL",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0))),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 50.0,
                width: 390,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(211, 211, 211, 8),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0))),
                child: Center(
                    child: Padding(
                        padding: EdgeInsets.only(left: 120.0),
                        child: Row(
                          children: <Widget>[
                            AutoSizeText(paidBack,
                                style: TextStyle(
                                    color: darkBlue,
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.bold)),
                            Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: AutoSizeText(currencyName,
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
            height: ScreenUtil().setHeight(130),
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
                    Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 2.0),
                        child: AutoSizeText(
                          "Total cut:",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 90.0, top: 2.0),
                        child: AutoSizeText(
                          totalCut,
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 7.0),
                        child: AutoSizeText(
                          currencyName,
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
                      Padding(
                          padding: EdgeInsets.only(left: 30.0, top: 5.0),
                          child: AutoSizeText(
                            "Paid back:",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          )),
                      Padding(
                          padding: EdgeInsets.only(left: 80.0),
                          child: AutoSizeText(paidBack,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35.0,
                                  fontFamily: "Helvetica"))),
                      Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: AutoSizeText(currencyName,
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
                "Cancel ticket",
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


Future<void> ticketCancel() async{
    String tokens = await shPref.gettokens();
    String ticketnum = ticketNumber;
    String securitycode = secureCode;

  String url = 'https://test-api.gunsel.ua/Public.svc/CancelTicket?c0=$ticketnum&c1=A1A1A4B5-D1C8-4AEC-BD08-2A3FF55440DB&c2=42 131 23 32&c3=$securitycode';
  print("url:"+url.toString());

  Map<String, String> headers = {"token": tokens};
  Response response = await delete(url, headers: headers);
  // check the status code for the result
  int statuscode =response.statusCode;

  print("status code is:"+statuscode.toString());

  if(statuscode  == 200)
    {
//      showDialog(
//          context: context,
//          builder: (context) {
//            return AlertDialog(
//              content: Text("Ticket has been cancelled"),
//              actions: <Widget>[
//                FlatButton(
//                  child: Text("OK"),
//                  onPressed: () {
//                    Navigator.pop(context);
//                  },
//                )
//              ],
//            );
//          });

      Navigator.pushReplacementNamed(context, oneWayScreen);
    }

    else{
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Error",
            ),
            content: Text("Sorry sir,Ticket can not be cancelled."),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
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
