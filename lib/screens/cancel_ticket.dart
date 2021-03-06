import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';

import 'package:gunsel/data/sharedPreference.dart';
import 'package:gunsel/screens/final_cancelticket.dart';
import 'package:gunsel/data/cancelticketinfomodel.dart';
import 'package:http/http.dart';

class CancelTicket extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CancelTicketState();
  }
}

class CancelTicketState extends State<CancelTicket> {
  SharePreferencelogin shPref = SharePreferencelogin();
  TextEditingController _secureCode = TextEditingController();
  TextEditingController _ticketNumber = TextEditingController();

  SharePreferencelogin sh = SharePreferencelogin();
  String cancelTicket = " Cancel ticket",
      secureHint = "SECURITY CODE",
      ticketNumberHint = "TICKET NUMBER",
      btnCancel = "Cancel",
      secureNumberRequired = "Secure code and ticket number is required",
      ok = " Ok",
      error = "Error",
      january = "January",
      feb = "February",
      march = "March",
      april = "April",
      may = "May",
      june = "June",
      july = "July",
      august = "August",
      sep = "September",
      oct = "October",
      nov = "November",
      dec = "December",
      correnData = "Enter the correct data";

  String enJson="",uaJson="",ruJson="",plJson="";


  @override
  void initState() {
    super.initState();

    cancelTicketlan();
  }

  void cancelTicketlan() async {

    enJson = await DefaultAssetBundle.of(context).loadString("languagefiles/en-US.json");
    uaJson = await DefaultAssetBundle.of(context).loadString("languagefiles/ua-UA.json");
    ruJson = await DefaultAssetBundle.of(context).loadString("languagefiles/ru-RU.json");
    plJson = await DefaultAssetBundle.of(context).loadString("languagefiles/pl-PL.json");

    Map<String , dynamic> enData = json.decode(enJson);
    Map<String , dynamic> uaData = json.decode(uaJson);
    Map<String , dynamic> ruData = json.decode(ruJson);
    Map<String , dynamic> plData = json.decode(plJson);



    int b;
    int a = await sh.getshared1();

    setState(() {
      b = a;

      if (b == 0) {
        cancelTicket = enData["cancel_ticket"];
        secureHint = enData["secure_code"];
        ticketNumberHint = enData["ticket_number"];
        btnCancel = enData["cancel"];
        secureNumberRequired = "Secure code and ticket number is required";
        ok = enData["ok"];
        error = enData["error"];
        january = "January";
        feb = "February";
        march = "March";
        april = "April";
        may = "May";
        june = "June";
        july = "July";
        august = "August";
        sep = "September";
        oct = "October";
        nov = "November";
        dec = "December";
        correnData = "Enter the correct data";
      }
      else if (b == 1) {
        secureHint = uaData["secure_code"];
        ticketNumberHint = uaData["ticket_number"];
        btnCancel = uaData["cancel"];
        cancelTicket = uaData["cancel_ticket"];
        secureNumberRequired = "Потрібні безпечний код та номер квитка";
        ok = uaData["ok"];
        error = uaData["error"];
        january = "Січень";
        feb = "Лютий";
        march = "Березень";
        april = "Квітень";
        may = "Може";
        june = "Червень";
        july = "Липень";
        august = "Серпень";
        sep = "Вересень";
        oct = "Жовтень";
        nov = "Листопад";
        dec = "Грудень";
        correnData = "Введіть правильні дані";
      }
      else if (b == 2) {
        cancelTicket = ruData["cancel_ticket"];
        secureHint = ruData["secure_code"];
        ticketNumberHint = ruData["ticket_number"];
        btnCancel = ruData["cancel"];
        secureNumberRequired = "Требуется безопасный код и номер билета";
        ok = ruData["error"];
        error = "ошибка";
        january = "январь";
        feb = "февраль";
        march = "марш";
        april = "апрель";
        may = "май";
        june = "июнь";
        july = "июль";
        august = "августейший";
        sep = "сентябрь";
        oct = "октября";
        nov = "ноябрь";
        dec = "Декабрь";
        correnData = "Введите правильные данные";
      }
      else if (b == 3) {
        cancelTicket = plData["cancel_ticket"];
        secureHint = plData["secure_code"];
        ticketNumberHint = plData["ticket_number"];
        btnCancel = plData["cancel"];
        secureNumberRequired = "Wymagany jest bezpieczny kod i numer biletu";
        ok = plData["ok"];
        error = plData["error"];
        january = "styczeń";
        feb = "luty";
        march = "Marsz";
        april = "kwiecień";
        may = "Może";
        june = "czerwiec";
        july = "lipiec";
        august = "sierpień";
        sep = "wrzesień";
        oct = "październik";
        nov = "listopad";
        dec = "grudzień";
        correnData = "Wprowadź poprawne dane";
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
      bodyWidget: Column(children: <Widget>[
        Container(
            height: 230.0,
            margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 15.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ListView(children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 15.0, left: 15.0, top: 15.0),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0),
                    keyboardType: TextInputType.text,
                    controller: this._secureCode,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: secureHint,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7.0))),
                  )),

              //Ticket number
              Padding(
                  padding: EdgeInsets.only(right: 15.0, left: 15.0, top: 15.0),
                  child: TextFormField(
                    style: TextStyle(fontSize: 18.0),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.text,
                    controller: this._ticketNumber,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: ticketNumberHint,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7.0))),
                  )),
              Container(
                width: 340.0,
                margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                child: RaisedButton(
                  child: Text(
                    btnCancel,
                    style: TextStyle(
                        color: gunselColor,
                        fontSize: 25.0,
                        fontFamily: "Helvetica"),
                  ),
                  highlightColor: Colors.yellow,
                  color: Colors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15.0),
                        topLeft: Radius.circular(15.0)),
                  ),
                  onPressed: () {
                    getticketInformation();

//                    Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                            builder: (context) => FinalCancelTicket(
//                                secureCode: _secureCode.text ,
//                                ticketNumber: _ticketNumber.text,
//                                )));
                  },
                ),
              ),
            ])),
      ]),
    );
  }

  Future<void> getticketInformation() async {
    try {
      String tokens = await shPref.gettokens();

//      print("Token is:" + tokens);
//      print("Ticket number is:" + _ticketNumber.text);
//      print("Security code is:" + _secureCode.text);

      String ticketNumber, secureCode;
      ticketNumber = _ticketNumber.text;
      secureCode = _secureCode.text;


      //language change
      int languageint = await shPref.getshared1();
      String languageChange = languageint.toString();

      print("language is:"+languageChange);


      String url =
          'https://api.gunsel.ua/Public.svc/GetTicketInformation?1=1&c0=$ticketNumber&c3=$secureCode';
      print("url is:" + url.toString());

      Map<String, String> headers = {"token": tokens,'language' : languageChange};
      Response response = await get(url, headers: headers);
      // check the status code for the result
      int statusCode = response.statusCode;
      //String body = response.body;
      print("response body is:" + response.body);

      Map<String, dynamic> infoapiData = {
        'Data': jsonDecode(jsonDecode(response.body)['Data'])
      };
      print(infoapiData);
      Cancelticketinfo infoapimodelobj = Cancelticketinfo.fromJson(infoapiData);
      var infoapifinalData = infoapimodelobj.toJson();

//
//    print("Authenticated token is:" + fbProfData['Data']['Token']);
//    print("First Name is:" + fbProfData['Data']['FirstName']);
//    print("Last Name is:" + fbProfData['Data']['LastName']);
//    print("Image is:" + fbProfData['Data']['ImageURL']);
//    print("Email is:" + fbProfData['Data']['Email']);

      print("status code is:" + statusCode.toString());

      // print("Allow cancel is:"+infoapifinalData['Data']['PenaltyRate'].toString());
      var _ticketId = infoapifinalData['Data']['Ticket']['TicketNo'];
      var _departPlace =
          infoapifinalData['Data']['Ticket']['FromStation']['CityName'];
      var _departTime =
          infoapifinalData['Data']['Ticket']['DepartureTime'].substring(0, 5);
      var _arrivalPlace =
          infoapifinalData['Data']['Ticket']['ToStation']['CityName'];
      var _arrivalTime =
          infoapifinalData['Data']['Ticket']['ArrivalTime'].substring(0, 5);
      var _name = infoapifinalData['Data']['Ticket']['FirstName'] +
          " " +
          infoapifinalData['Data']['Ticket']['LastName'];
      var _seatNumber = infoapifinalData['Data']['Ticket']['SeatNumber'];
      var _bookingDate = infoapifinalData['Data']['Ticket']['TicketDate'];
      var _currencyName =
          infoapifinalData['Data']['Ticket']['Currency']['CurrencyName'];
      var _paidBack = infoapifinalData['Data']['TotalPaidBack'].toString();
      var _totalCut = infoapifinalData['Data']['TotalCut'].toString();

      // print("Ticket id is :"+infoapifinalData['Data']['Ticket']['TicketId']);
      //print("Departure place :"+infoapifinalData['Data']['Ticket']['FromStation']['CityName']);
      //print("Departure time :"+infoapifinalData['Data']['Ticket']['DepartureTime']);
      //print("Arrival place :"+infoapifinalData['Data']['Ticket']['ToStation']['CityName']);
      //print("Arrival time :"+infoapifinalData['Data']['Ticket']['ArrivalTime']);
      //print("Name:"+infoapifinalData['Data']['Ticket']['FirstName']+" "+infoapifinalData['Data']['Ticket']['LastName']);
      //print("Seat Number :"+infoapifinalData['Data']['Ticket']['SeatNumber']);
      //print("Booking Date :"+infoapifinalData['Data']['Ticket']['TicketDate']);
      //print("Currency Name :"+infoapifinalData['Data']['Ticket']['Currency']['CurrencyName']);
      //print("Total Paid Back is :"+infoapifinalData['Data']['TotalPaidBack'].toString());
      //print("Total cut:"+infoapifinalData['Data']['TotalCut'].toString());

      var moonLanding =
          DateTime.parse(infoapifinalData['Data']['Ticket']['TicketDate']);
      var _year = moonLanding.year.toString();
      var _day = moonLanding.day.toString();
      var _month = moonLanding.month.toString();
      String monthName;

      if (_month == "1") {
        monthName = january;
      } else if (_month == "2") {
        monthName = feb;
      } else if (_month == "3") {
        monthName = march;
      } else if (_month == "4") {
        monthName = april;
      } else if (_month == "5") {
        monthName = may;
      } else if (_month == "6") {
        monthName = june;
      } else if (_month == "7") {
        monthName = july;
      } else if (_month == "8") {
        monthName = august;
      } else if (_month == "9") {
        monthName = sep;
      } else if (_month == "10") {
        monthName = oct;
      } else if (_month == "11") {
        monthName = nov;
      } else {
        monthName = dec;
      }

//    print("Year is:"+moonLanding.year.toString());
//    print("Date is:"+moonLanding.day.toString());
//    print("Month is:"+moonLanding.month.toString());

      if (statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FinalCancelTicket(
                      secureCode: _secureCode.text,
                      ticketNumber: _ticketNumber.text,
                      ticketId: _ticketId,
                      departPlace: _departPlace,
                      departTime: _departTime,
                      arrivalPlace: _arrivalPlace,
                      arrivalTime: _arrivalTime,
                      name: _name,
                      seatNumber: _seatNumber,
                      bookingDate: _bookingDate,
                      currencyName: _currencyName,
                      paidBack: _paidBack,
                      totalCut: _totalCut,
                      day: _day,
                      month: monthName.toUpperCase(),
                      year: _year,
                    )));
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  error,
                ),
                content: Text(secureNumberRequired),
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
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                error,
              ),
              content: Text(correnData),
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
