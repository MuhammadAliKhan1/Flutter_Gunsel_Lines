import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gunsel/data/PaymentResultModel.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/data/sharedPreference.dart';

class PaymentResult extends StatefulWidget {
  final Map<String, dynamic> userData;
  PaymentResult({
    @required this.userData,
  });

  @override
  _PaymentResultState createState() => _PaymentResultState();
}

class _PaymentResultState extends State<PaymentResult> {
  SharePreferencelogin sh = SharePreferencelogin();
  String information = "Passenger details";

  void detailsBarlan() async {
    int b;
    int a = await sh.getshared1();

    setState(() {
      b = a;

      if (b == 1) {
        information = "Реквізити пасажира";
      } else if (b == 2) {
        information = "Passenger details";
      } else if (b == 3) {
        information = "Пассажирские данные";
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
    return GunselScaffold(
      appBarIcon: backArrow,
      appBarIncluded: true,
      backgroundImage: scaffoldImg,
      bodyWidget: PaymentResultScreen(
        ticketData: this.widget.userData,
      ),
      appBarTitle: information,
      appBarTitleIncluded: true,
      drawerIncluded: false,
    );
  }
}

class PaymentResultScreen extends StatefulWidget {
  Map<String, dynamic> ticketData;
  @override
  _PaymentResultScreenState createState() => _PaymentResultScreenState();
  PaymentResultScreen({
    @required this.ticketData,
  });
}

class _PaymentResultScreenState extends State<PaymentResultScreen> {
  Future _dataFetched;
  bool loadBlock = false;
  Map<String, dynamic> paymentResultTicketData;
  TextEditingController _email = TextEditingController();
  PaymentResultModel paymentResultModelObj;
  @override
  void initState() {
    super.initState();
    detailslan();
    paymentResultModelObj = PaymentResultModel();
    paymentResultTicketData = Map();
    _dataFetched = getData();
  }

  getData() async {
    paymentResultTicketData = await paymentResultModelObj
        .getPaymentResult(widget.ticketData['PaymentToken']);
  }

  SharePreferencelogin sh = SharePreferencelogin();
  String yourSeat = "Your seat";
  String details = "Details";
  String purchaseDetails = "Purchase Details";
  String purchase = "Purchase";
  String totalPrice = "Total Price";
  String pay = "Pay";
  String payment = "Payment was sucessfull";
  String received =
      'You received an email for download ticket please check your address.';
  String sendmail = "Send ticket to email";
  String mailAgain = "Please write your email address";
  String email = "  Your email";
  String sendEmail = "Send email";
  String sendmailAgain = "Send email again";

  void detailslan() async {
    int b;
    int a = await sh.getshared1();

    setState(() {
      b = a;

      if (b == 1) {
        yourSeat = "Ваше місце";
        details = "Деталі";
        purchaseDetails = "Деталі придбання";
        purchase = "Купівля";
        totalPrice = "Загальна сума";
        pay = "Платити";
        payment = "Оплата була успішною";
        received =
            "Ви отримали електронний лист для завантаження квитка, будь ласка, перевірте свою адресу.";
        sendmail = "Надішліть квиток на електронну пошту";
        mailAgain = "Будь ласка, напишіть свою електронну адресу";
        email = "  Твоя електронна пошта";
        sendEmail = "Відправити лист";
        sendmailAgain = "Ще раз надішліть електронний лист";
      } else if (b == 2) {
        yourSeat = "Your seat";
        details = "Details";
        purchaseDetails = "Purchase Details";
        purchase = "Purchase";
        totalPrice = "Total Price";
        pay = "Pay";
        payment = "Payment was sucessfull";
        received =
            'You received an email for download ticket please check your address.';
        sendmail = "Send ticket to email";
        mailAgain = "Please write your email address";
        email = "  Your email";
        sendEmail = "Send email";
        sendmailAgain = "Send email again";
      } else if (b == 3) {
        yourSeat = "Ваше место";
        details = "подробности";
        purchaseDetails = "Детали покупки";
        purchase = "покупка";
        totalPrice = "Итоговая цена";
        pay = "платить";
        payment = "Оплата была успешной";
        received =
            "Вы получили письмо для загрузки билета, пожалуйста, проверьте свой адрес.";
        sendmail = "Отправить билет на электронную почту";
        mailAgain = "Пожалуйста, напишите свой адрес электронной почты\n";
        email = "  Ваш адрес электронной почты";
        sendEmail = "Отправить письмо";
        sendmailAgain = "Отправить письмо еще раз";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _dataFetched,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(
              child: Image(
            image: loadingAnim,
            height: ScreenUtil().setSp(150),
          ));
        else {
          return CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Column(
                      children: <Widget>[
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
                                  color: Colors.white,
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              purchase,
                              style: TextStyle(
                                  color: Colors.yellow,
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
                            image: wizardFour,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SliverPadding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return PaymentResultTicket(
                          day: int.parse(paymentResultTicketData['Data']
                                  ['Tickets'][index]['TravelDate']
                              .substring(8, 10)),
                          month: int.parse(paymentResultTicketData['Data']
                                  ['Tickets'][index]['TravelDate']
                              .substring(5, 7)),
                          year: int.parse(paymentResultTicketData['Data']
                                  ['Tickets'][index]['TravelDate']
                              .substring(0, 4)),
                          arrivalStation: paymentResultTicketData['Data']
                              ['Tickets'][index]['ToStation']['StationName'],
                          departureStation: paymentResultTicketData['Data']
                              ['Tickets'][index]['FromStation']['StationName'],
                          departureTime: paymentResultTicketData['Data']
                                  ['Tickets'][index]['DepartureTime']
                              .substring(0, 5),
                          arrivalTime: paymentResultTicketData['Data']
                                  ['Tickets'][index]['ArrivalTime']
                              .substring(0, 5),
                          firstName: paymentResultTicketData['Data']['Tickets']
                              [index]['FirstName'],
                          lastName: paymentResultTicketData['Data']['Tickets']
                              [index]['LastName'],
                          seatNumber: paymentResultTicketData['Data']['Tickets']
                              [index]['SeatNumber'],
                          ticketPrice: paymentResultTicketData['Data']
                              ['Tickets'][index]['TicketPrice'],
                          currencyType: paymentResultTicketData['Data']
                              ['Tickets'][index]['Currency']['CurrencyName'],
                          ticketNumber: paymentResultTicketData['Data']
                              ['Tickets'][index]['TicketNo'],
                        );
                      },
                      childCount:
                          paymentResultTicketData['Data']['Tickets'].length,
                    ),
                  )),
              SliverToBoxAdapter(
                child: FittedBox(
                  child: Center(
                    child: Container(
                      width: 40,
                      height: 20,
                      margin: EdgeInsets.only(left: 1, right: 1),
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: 50,
                              height: 18,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(1))),
                              child: Container(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    width: 40,
                                    height: 14.5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                          payment,
                                          style: TextStyle(
                                              fontSize: 1.7,
                                              fontFamily: 'Helvetica',
                                              color: Color.fromRGBO(
                                                  14, 52, 113, 10),
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          received,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 1.5,
                                            fontFamily: 'MyriadPro',
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            showDialog(
                                                barrierDismissible: true,
                                                context: context,
                                                builder: (context) {
                                                  return Container(
                                                      width: double.infinity,
                                                      child: AlertDialog(
                                                          backgroundColor:
                                                              Colors.white,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                10.0,
                                                              ),
                                                            ),
                                                          ),
                                                          title: Text(
                                                            sendmail,
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        14,
                                                                        52,
                                                                        113,
                                                                        10)),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                          content: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: <Widget>[
                                                              Text(mailAgain),
                                                              SizedBox(
                                                                  height: 10),
                                                              Container(
                                                                  child:
                                                                      TextFormField(
                                                                controller:
                                                                    _email,
                                                                validator:
                                                                    (String
                                                                        value) {
                                                                  if (value
                                                                      .isEmpty) {
                                                                    return "Please enter your email";
                                                                  }
                                                                },
                                                                keyboardType:
                                                                    TextInputType
                                                                        .emailAddress,
                                                                decoration: InputDecoration(
                                                                    contentPadding: EdgeInsets.symmetric(
                                                                        vertical:
                                                                            10,
                                                                        horizontal:
                                                                            10.0),
                                                                    fillColor: Color
                                                                        .fromRGBO(
                                                                            227,
                                                                            236,
                                                                            235,
                                                                            1),
                                                                    filled:
                                                                        true,
                                                                    hintText:
                                                                        email,
                                                                    border: OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                5.0)),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Colors.white))),
                                                              )),
                                                              Container(
                                                                  width: double
                                                                      .infinity,
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              10.0),
                                                                  child:
                                                                      RaisedButton(
                                                                    child: Text(
                                                                      sendEmail,
                                                                      textScaleFactor:
                                                                          1.5,
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.yellow),
                                                                    ),
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            14,
                                                                            52,
                                                                            113,
                                                                            10),
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.only(
                                                                          bottomRight: Radius.circular(
                                                                              15.0),
                                                                          topLeft:
                                                                              Radius.circular(15.0)),
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      loadBlock =
                                                                          true;
                                                                      setState(
                                                                          () {});
                                                                      await paymentResultModelObj.sendEmail(
                                                                          paymentResultTicketData['Data']
                                                                              [
                                                                              'PaymentNo'],
                                                                          _email
                                                                              .text);
                                                                      loadBlock =
                                                                          false;
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                  ))
                                                            ],
                                                          )));
                                                });
                                          },
                                          child: Container(
                                            width: 35,
                                            height: 4,
                                            padding: EdgeInsets.only(bottom: 1),
                                            child: Center(
                                              child: Text(
                                                sendmailAgain,
                                                style: TextStyle(
                                                  fontSize: 2,
                                                  color: Colors.yellow,
                                                  fontFamily: 'Helvetica',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  14, 52, 113, 10),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(2),
                                                bottomRight: Radius.circular(2),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Image(
                              image: paymentThumb,
                              height: 5,
                              width: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

class PaymentResultTicket extends StatefulWidget {
  String departureStation,
      departureTime,
      arrivalStation,
      arrivalTime,
      currencyType,
      seatNumber,
      firstName,
      lastName,
      ticketNumber;
  int day, month, year;
  double ticketPrice;

  PaymentResultTicket({
    @required this.day,
    @required this.month,
    @required this.year,
    @required this.ticketNumber,
    @required this.departureStation,
    @required this.arrivalStation,
    @required this.departureTime,
    @required this.arrivalTime,
    @required this.ticketPrice,
    @required this.currencyType,
    @required this.firstName,
    @required this.lastName,
    @required this.seatNumber,
  });

  @override
  _PaymentResultTicketState createState() => _PaymentResultTicketState();
}

class _PaymentResultTicketState extends State<PaymentResultTicket> {
  SharePreferencelogin sh = SharePreferencelogin();
  String departure = "DEPARTURE",
      arrival = "ARRIVAL",
      seat = "Seat: ",
      busType = "Bus Type: Comfort +";

  void detailsTicketlan() async {
    int b;
    int a = await sh.getshared1();

    setState(() {
      b = a;

      if (b == 1) {
        departure = "ВИДАЛЕННЯ";
        arrival = "ПРИЙНЯТТЯ";
        seat = "Місце:";
        busType = "Тип автобуса: Комфорт +";
      } else if (b == 2) {
        departure = "DEPARTURE";
        arrival = "ARRIVAL";
        seat = "Seat: ";
        busType = "Bus Type: Comfort +";
      } else if (b == 3) {
        departure = "ВЫЕЗД";
        arrival = "ПРИБЫТИЕ";
        seat = "сиденье:";
        busType = "Тип автобуса: Комфорт +";
      }
    });
  }

  @override
  void initState() {
    super.initState();
    detailsTicketlan();
  }

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
                            'Ticket Number:      ${widget.ticketNumber}',
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
                                    Text(
                                      busType,
                                      style: TextStyle(
                                        color: Color.fromRGBO(14, 52, 113, 10),
                                        fontFamily: 'Helvetica',
                                        fontSize:
                                            ScreenUtil(allowFontScaling: true)
                                                .setSp(45),
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          seat,
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
                                          '${widget.seatNumber}',
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
                                                        TextStyle(fontSize: 25),
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
                                                  departure,
                                                  style: TextStyle(
                                                    fontSize: ScreenUtil(
                                                            allowFontScaling:
                                                                true)
                                                        .setSp(45),
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
                                                Container(
                                                  width:
                                                      ScreenUtil().setSp(150),
                                                  child: AutoSizeText(
                                                    '${widget.arrivalStation}',
                                                    style:
                                                        TextStyle(fontSize: 25),
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
                                                  arrival,
                                                  style: TextStyle(
                                                    fontSize: ScreenUtil(
                                                            allowFontScaling:
                                                                true)
                                                        .setSp(45),
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
                                          '     ${widget.firstName} ${widget.lastName}',
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
