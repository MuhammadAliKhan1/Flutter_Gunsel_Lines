import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/widgets/button.dart';
import 'package:gunsel/data/sharedPreference.dart';
import 'package:auto_size_text/auto_size_text.dart';

Map<int, dynamic> formsData;
Map<int, dynamic> formsDataFirstLegVariantLegTwo;
Map<int, dynamic> secondLegformsData;
Map<int, dynamic> formsDataSecondLegVariantLegTwo;

class Detail extends StatefulWidget {
  Map<String, dynamic> ticketData;
  Detail({
    @required this.ticketData,
  });

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  SharePreferencelogin sh = SharePreferencelogin();
  String information = "Voyagers Information";

  void detailsBarlan() async {
    int b;
    int a = await sh.getshared1();

    setState(() {
      b = a;

      if (b == 1) {
        information = "Інформація про вояджери";
      } else if (b == 2) {
        information = "Voyagers Information";
      } else if (b == 3) {
        information = "Информация для путешественников";
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
      bodyWidget: DetailScreen(
        ticketData: this.widget.ticketData,
      ),
      appBarTitle: information,
      appBarTitleIncluded: true,
      drawerIncluded: false,
    );
  }
}

class DetailScreen extends StatefulWidget {
  Map<String, dynamic> ticketData;
  DetailScreen({
    @required this.ticketData,
  });
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  static GlobalKey<FormState> _detailForm = GlobalKey<FormState>();
  String detailFormType;
  String checked = "assets/checked.png";
  bool checkBox1 = false;
  bool checkBox2 = false;
  String path1 = "assets/unchecked.png";
  String path2 = "assets/unchecked.png";
  var number;
  @override
  void initState() {
    super.initState();
    detailFormType = 'FirstLeg';
    formsData = Map();
    formsDataFirstLegVariantLegTwo = Map();
    secondLegformsData = Map();
    formsDataSecondLegVariantLegTwo = Map();
    detailslan();

    for (int i = 0;
        i < (widget.ticketData['FirstLeg']['SelectedSeatsNumber'].length);
        ++i) {
      formsData[(i + 1)] = {
        'Name': 'null',
        'Surname': 'null',
        'Email': 'null',
        'Number': 0,
        'SeatNumber': 'null'
      };
    }
    if (widget.ticketData['FirstLeg']['TicketData']['TravelVariantLeg2'] !=
        null) {
      detailFormType = 'FirstLegVariantLeg2';
      for (int i = 0;
          i <
              (widget
                  .ticketData['FirstLeg']['TravelVariantLeg2']
                      ['SelectedSeatsNumber']
                  .length);
          ++i) {
        formsDataFirstLegVariantLegTwo[(i + 1)] = {
          'Name': 'null',
          'Surname': 'null',
          'Email': 'null',
          'Number': 0,
          'SeatNumber': 'null',
          'FirstLegVariantLeg2': true,
        };
      }
    }
    if (widget.ticketData['BuyTicketData']['RoundWayCheck']) {
      detailFormType = 'SecondLeg';
      for (int i = 0;
          i < (widget.ticketData['SecondLeg']['SelectedSeatsNumber'].length);
          ++i) {
        secondLegformsData[(i + 1)] = {
          'Name': 'null',
          'Surname': 'null',
          'Email': 'null',
          'Number': 0,
          'SeatNumber': 'null',
          'SecondLeg': true
        };
      }
      if (widget.ticketData['SecondLeg']['TicketData']['TravelVariantLeg2'] !=
          null) {
        detailFormType = 'SecondLegVariantLeg2';
        for (int i = 0;
            i <
                (widget
                    .ticketData['SecondLeg']['TravelVariantLeg2']
                        ['SelectedSeatsNumber']
                    .length);
            ++i) {
          formsDataSecondLegVariantLegTwo[(i + 1)] = {
            'Name': 'null',
            'Surname': 'null',
            'Email': 'null',
            'Number': 0,
            'SeatNumber': 'null',
            'SecondLegVariantLeg2': true,
          };
        }
      }
    }
  }

  SharePreferencelogin sh = SharePreferencelogin();
  String yourSeat = "Your seat";
  String details = "Details";
  String purchaseDetails = "Purchase Details";
  String purchase = "Purchase";
  String search = "Search";
  String agreement = "I read the agreement and I agree";
  String sub = "I want to be subscriber";
  String cont = "Continue";
  String information = "Voyagers Information";

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
        search = "Пошук";
        agreement = "Я читаю угоду і згоден";
        sub = "Я хочу бути передплатником";
        cont = "Продовжуйте";
      } else if (b == 2) {
        yourSeat = "Your seat";
        details = "Details";
        purchaseDetails = "Purchase Details";
        purchase = "Purchase";
        search = "Search";
        agreement = "I read the agreement and I agree";
        sub = "I want to be subscriber";
        cont = "Continue";
      } else if (b == 3) {
        yourSeat = "Ваше место";
        details = "подробности";
        purchaseDetails = "Детали покупки";
        purchase = "покупка";
        search = "Поиск";
        agreement = "Я прочитал соглашение, и я согласен";
        sub = "Я хочу быть подписчиком";
        cont = "Продолжить";
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
                              color: Colors.yellow,
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
                        image: wizardTwo,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: DetailTicket(
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
                        arrivalTime: widget.ticketData['FirstLeg']['TicketData']
                                ['ArrivalTime']
                            .substring(0, 5),
                      ),
                    ),
                  ],
                ),
              ),
              Form(
                  key: _detailForm,
                  child: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return DetailForm(
                          formType: this.detailFormType,
                          index: index + 1,
                          seatNumber: (widget.ticketData['FirstLeg']
                                  ['SelectedSeatsNumber'][index])
                              .toString(),
                          data: widget.ticketData,
                        );
                      },
                      childCount: widget
                          .ticketData['FirstLeg']['SelectedSeatsNumber'].length,
                    ),
                  )),
              SliverList(
                delegate: SliverChildListDelegate([
                  ListTile(
                    leading: GestureDetector(
                      child: Image.asset(path2, height: 20.0),
                      onTap: () {
                        setState(() {
                          if (checkBox2 == false) {
                            path2 = "assets/checked.png";
                            checkBox2 = true;
                          } else {
                            path2 = "assets/unchecked.png";
                            checkBox2 = false;
                          }
                        });
                      },
                    ),
                    title: Text(
                      agreement,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  ListTile(
                    leading: GestureDetector(
                      child: Image.asset(path1, height: 20.0),
                      onTap: () {
                        setState(() {
                          if (checkBox1 == false) {
                            path1 = "assets/checked.png";
                            checkBox1 = true;
                          } else {
                            path1 = "assets/unchecked.png";
                            checkBox1 = false;
                          }
                        });
                      },
                    ),
                    title: Text(
                      sub,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ]),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 60,
                ),
              ),
              SliverToBoxAdapter(
                child: Align(
                  child: GunselButton(
                    btnWidth: 500,
                    btnText: cont,
                    btnTextFontSize: 40,
                    whenPressed: () {
                      switch (detailFormType) {
                        case 'FirstLeg':
                          if (_detailForm.currentState.validate() &&
                              checkBox1) {
                            _detailForm.currentState.save();

                            widget.ticketData['FirstLeg']['SeatCount'] =
                                formsData.keys.length;
                            widget.ticketData['FirstLeg']['SeatVoyagerInfo'] =
                                formsData;
                            widget.ticketData['AgreementCheckBox'] = checkBox1;
                            widget.ticketData['SubscriberCheckBox'] = checkBox2;
                            Navigator.pushNamed(
                              context,
                              ticketSummaryScreen,
                              arguments: widget.ticketData,
                            );
                          }
                          break;
                        case 'FirstLegVariantLeg2':
                          if (_detailForm.currentState.validate() &&
                              checkBox1) {
                            _detailForm.currentState.save();
                            int index = 0;
                            formsData.forEach((k, v) {
                              formsDataFirstLegVariantLegTwo[k]['Name'] =
                                  v['Name'];
                              formsDataFirstLegVariantLegTwo[k]['Surname'] =
                                  v['Surname'];
                              formsDataFirstLegVariantLegTwo[k]['Email'] =
                                  v['Email'];
                              formsDataFirstLegVariantLegTwo[k]['Number'] =
                                  v['Number'];
                              formsDataFirstLegVariantLegTwo[k]['SeatNumber'] =
                                  widget.ticketData['FirstLeg']
                                          ['TravelVariantLeg2']
                                      ['SelectedSeatsNumber'][index];
                              ++index;
                            });
                            index = 0;
                            widget.ticketData['FirstLeg']['SeatCount'] =
                                formsData.keys.length;
                            widget.ticketData['FirstLeg']['SeatVoyagerInfo'] =
                                formsData;
                            widget.ticketData['FirstLeg']['TravelVariantLeg2']
                                    ['SeatCount'] =
                                formsDataFirstLegVariantLegTwo.keys.length;
                            widget.ticketData['FirstLeg']['TravelVariantLeg2']
                                    ['SeatVoyagerInfo'] =
                                formsDataFirstLegVariantLegTwo;
                            widget.ticketData['AgreementCheckBox'] = checkBox1;
                            widget.ticketData['SubscriberCheckBox'] = checkBox2;
                            Navigator.pushNamed(
                              context,
                              ticketSummaryScreen,
                              arguments: widget.ticketData,
                            );
                          }
                          break;
                        case 'SecondLeg':
                          if (_detailForm.currentState.validate() &&
                              checkBox1) {
                            _detailForm.currentState.save();
                            int index = 0;
                            formsData.forEach((k, v) {
                              secondLegformsData[k]['Name'] = v['Name'];
                              secondLegformsData[k]['Surname'] = v['Surname'];
                              secondLegformsData[k]['Email'] = v['Email'];
                              secondLegformsData[k]['Number'] = v['Number'];
                              secondLegformsData[k]['SeatNumber'] =
                                  widget.ticketData['SecondLeg']
                                      ['SelectedSeatsNumber'][index];
                              ++index;
                            });
                            index = 0;
                            widget.ticketData['FirstLeg']['SeatCount'] =
                                formsData.keys.length;
                            widget.ticketData['FirstLeg']['SeatVoyagerInfo'] =
                                formsData;

                            widget.ticketData['SecondLeg']['SeatCount'] =
                                secondLegformsData.keys.length;
                            widget.ticketData['SecondLeg']['SeatVoyagerInfo'] =
                                secondLegformsData;

                            widget.ticketData['AgreementCheckBox'] = checkBox1;
                            widget.ticketData['SubscriberCheckBox'] = checkBox2;
                            Navigator.pushNamed(
                              context,
                              ticketSummaryScreen,
                              arguments: widget.ticketData,
                            );
                          }
                          break;
                        case 'SecondLegVariantLeg2':
                          if (_detailForm.currentState.validate() &&
                              checkBox1) {
                            _detailForm.currentState.save();
                            int index = 0;
                            formsData.forEach((k, v) {
                              formsDataFirstLegVariantLegTwo[k]['Name'] =
                                  v['Name'];
                              formsDataFirstLegVariantLegTwo[k]['Surname'] =
                                  v['Surname'];
                              formsDataFirstLegVariantLegTwo[k]['Email'] =
                                  v['Email'];
                              formsDataFirstLegVariantLegTwo[k]['Number'] =
                                  v['Number'];
                              formsDataFirstLegVariantLegTwo[k]['SeatNumber'] =
                                  widget.ticketData['FirstLeg']
                                          ['TravelVariantLeg2']
                                      ['SelectedSeatsNumber'][index];
                              ++index;
                            });
                            index = 0;
                            formsData.forEach((k, v) {
                              secondLegformsData[k]['Name'] = v['Name'];
                              secondLegformsData[k]['Surname'] = v['Surname'];
                              secondLegformsData[k]['Email'] = v['Email'];
                              secondLegformsData[k]['Number'] = v['Number'];
                              secondLegformsData[k]['SeatNumber'] =
                                  widget.ticketData['SecondLeg']
                                      ['SelectedSeatsNumber'][index];
                              ++index;
                            });
                            index = 0;
                            formsData.forEach((k, v) {
                              formsDataSecondLegVariantLegTwo[k]['Name'] =
                                  v['Name'];
                              formsDataSecondLegVariantLegTwo[k]['Surname'] =
                                  v['Surname'];
                              formsDataSecondLegVariantLegTwo[k]['Email'] =
                                  v['Email'];
                              formsDataSecondLegVariantLegTwo[k]['Number'] =
                                  v['Number'];
                              formsDataSecondLegVariantLegTwo[k]['SeatNumber'] =
                                  widget.ticketData['SecondLeg']
                                          ['TravelVariantLeg2']
                                      ['SelectedSeatsNumber'][index];
                              ++index;
                            });
                            index = 0;
                            widget.ticketData['FirstLeg']['SeatCount'] =
                                formsData.keys.length;
                            widget.ticketData['FirstLeg']['SeatVoyagerInfo'] =
                                formsData;
                            widget.ticketData['FirstLeg']['TravelVariantLeg2']
                                    ['SeatCount'] =
                                formsDataFirstLegVariantLegTwo.keys.length;
                            widget.ticketData['FirstLeg']['TravelVariantLeg2']
                                    ['SeatVoyagerInfo'] =
                                formsDataFirstLegVariantLegTwo;
                            widget.ticketData['SecondLeg']['SeatCount'] =
                                secondLegformsData.keys.length;
                            widget.ticketData['SecondLeg']['SeatVoyagerInfo'] =
                                secondLegformsData;
                            widget.ticketData['SecondLeg']['TravelVariantLeg2']
                                    ['SeatCount'] =
                                formsDataSecondLegVariantLegTwo.keys.length;
                            widget.ticketData['SecondLeg']['TravelVariantLeg2']
                                    ['SeatVoyagerInfo'] =
                                formsDataSecondLegVariantLegTwo;
                            widget.ticketData['AgreementCheckBox'] = checkBox1;
                            widget.ticketData['SubscriberCheckBox'] = checkBox2;
                            Navigator.pushNamed(
                              context,
                              ticketSummaryScreen,
                              arguments: widget.ticketData,
                            );
                          }
                          break;
                        default:
                      }
                    },
                  ),
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DetailTicket extends StatefulWidget {
  String departureStation, departureTime, arrivalStation, arrivalTime;
  int day, month, year;
  DetailTicket({
    @required this.day,
    @required this.month,
    @required this.year,
    @required this.departureStation,
    @required this.arrivalStation,
    @required this.departureTime,
    @required this.arrivalTime,
  });

  @override
  _DetailTicketState createState() => _DetailTicketState();
}

class _DetailTicketState extends State<DetailTicket> {
  SharePreferencelogin sh = SharePreferencelogin();
  String departure = "DEPARTURE";
  String arrival = "ARRIVAL";

  void detailsTicketlan() async {
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
    detailsTicketlan();
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
                          color: Color.fromRGBO(14, 52, 113, 10),
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        departure,
                        style: TextStyle(
                          fontSize: 30,
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
                          color: Color.fromRGBO(14, 52, 113, 10),
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        arrival,
                        style: TextStyle(
                          fontSize: 30,
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

class DetailForm extends StatefulWidget {
  List<DropdownMenuItem<AssetImage>> _dropDownMenuItems;
  AssetImage _currentFlag;
  String _currentCode = '', formType, seatNumber;
  int index;
  Map data;

  DetailForm({
    @required this.index,
    @required this.seatNumber,
    @required this.formType,
    @required this.data,
  });

  @override
  _DetailFormState createState() => _DetailFormState();
}

class _DetailFormState extends State<DetailForm> {
  final _detailForm = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _surname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _number = TextEditingController();
  var phoneNumberFormatter = MaskTextInputFormatter(
    mask: '##)###-##-##',
  );
  List<DropdownMenuItem<AssetImage>> _dropDownMenuItems;
  AssetImage _currentFlag;
  String seatNumber;
  @override
  void initState() {
    searchTicketlan();
    switch (widget.formType) {
      case 'FirstLegVariantLeg2':
        seatNumber =
            '${widget.seatNumber},${widget.data['FirstLeg']['TravelVariantLeg2']['SelectedSeatsNumber'][(widget.index) - 1]}';

        break;
      case 'SecondLeg':
        seatNumber =
            '${widget.seatNumber},${widget.data['SecondLeg']['SelectedSeatsNumber'][(widget.index) - 1]}';
        break;
      case 'SecondLegVariantLeg2':
        seatNumber =
            '${widget.seatNumber},${widget.data['FirstLeg']['TravelVariantLeg2']['SelectedSeatsNumber'][(widget.index) - 1]},${widget.data['SecondLeg']['SelectedSeatsNumber'][(widget.index) - 1]},${widget.data['SecondLeg']['TravelVariantLeg2']['SelectedSeatsNumber'][(widget.index) - 1]}';
        break;
      default:
    }
    _dropDownMenuItems = getDropDownMenuItems();
    _currentFlag = _dropDownMenuItems[0].value;
    _currentCode = countryCode.keys
        .firstWhere((k) => countryCode[k] == _currentFlag, orElse: () => '');
    super.initState();
  }

  SharePreferencelogin sh = SharePreferencelogin();
  String information = "Voyager Information";
  String name = "Name";
  String surName = "Surname";
  String email = "Email";
  String seat = "Seat:";
  String enterName = "Please enter your name";
  String enterSur = "Please enter your surname";
  String enterEmail = "Please enter your email";

  void searchTicketlan() async {
    int b;
    int a = await sh.getshared1();

    setState(() {
      b = a;

      if (b == 1) {
        information = "Інформація про Voyager";
        name = "Ім'я";
        surName = "Прізвище";
        email = "Електронна пошта";
        seat = "Сидіння:";
        enterName = "Введіть своє ім’я";
        surName = "Введіть своє прізвище";
        enterEmail = "Будь ласка, введіть свій електронний лист";
      } else if (b == 2) {
        information = "Voyager Information";
        name = "Name";
        surName = "Surname";
        email = "Email";
        seat = "Seat:";
        enterName = "Please enter your name";
        enterSur = "Please enter your surname";
        enterEmail = "Please enter your email";
      } else if (b == 3) {
        information = "Информация о Вояджере";
        name = "имя";
        surName = "Фамилия";
        email = "Электронное письмо";
        seat = "сиденье:";
        enterName = "Пожалуйста, введите Ваше имя";
        enterSur = "Пожалуйста, введите вашу фамилию";
        enterEmail = "Пожалуйста, введите ваш адрес электронной почты";
      }
    });
  }

  String _currentCode = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ListTile(
          contentPadding: EdgeInsets.all(20),
          title: Text(
            '$information',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontFamily: 'Helvetica',
            ),
          ),
          trailing: Text(
            '$seat $seatNumber',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontFamily: 'Helvetica',
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(300),
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return enterName;
                  }
                },
                controller: this._name,
                onSaved: (name) {
                  switch (widget.formType) {
                    case 'FirstLeg':
                      formsData[widget.index]['Name'] = name.trim();
                      formsData[widget.index]['SeatNumber'] = widget.seatNumber;
                      break;
                    case 'FirstLegVariantLeg2':
                      formsDataFirstLegVariantLegTwo[widget.index]['Name'] =
                          name.trim();
                      formsDataFirstLegVariantLegTwo[widget.index]
                          ['SeatNumber'] = widget.seatNumber;
                      break;

                    default:
                  }
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10.0,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: " $name",
                ),
              ),
            ),
            Container(
              width: ScreenUtil().setWidth(300),
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return surName;
                  }
                },
                controller: this._surname,
                onSaved: (surname) {
                  switch (widget.formType) {
                    case 'FirstLeg':
                      formsData[widget.index]['Surname'] = surname.trim();
                      break;
                    case 'FirstLegVariantLeg2':
                      formsDataFirstLegVariantLegTwo[widget.index]['Surname'] =
                          surname.trim();
                      break;
                    default:
                  }
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10.0,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: " $surName",
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(300),
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return enterEmail;
                  }
                },
                onSaved: (email) {
                  switch (widget.formType) {
                    case 'FirstLeg':
                      formsData[widget.index]['Email'] = email.trim();
                      break;
                    case 'FirstLegVariantLeg2':
                      formsDataFirstLegVariantLegTwo[widget.index]['Email'] =
                          email.trim();
                      break;
                    default:
                  }
                },
                keyboardType: TextInputType.emailAddress,
                controller: this._email,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10.0,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: " $email",
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(300),
                  padding: EdgeInsets.only(bottom: 1.0),
                  height: 39,
                  color: Colors.white,
                  child: ButtonTheme(
                      alignedDropdown: true,
                      child: Row(
                        children: <Widget>[
                          FittedBox(
                            child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                              icon: Text(
                                ' ${this._currentCode}',
                                style: TextStyle(fontSize: 20),
                              ),
                              elevation: 0,
                              value: _currentFlag,
                              items: _dropDownMenuItems,
                              onChanged: changedDropDownItem,
                            )),
                          ),
                          Flexible(
                            child: TextFormField(
                              onChanged: (number) {
                                if (number.length > 11)
                                  FocusScope.of(context).unfocus();
                                if (number.contains(')') ||
                                    number.contains('-')) {
                                  number = number.replaceAll(')', '');
                                  number = number.replaceAll('-', '');
                                }

                                switch (widget.formType) {
                                  case 'FirstLeg':
                                    formsData[widget.index]['Number'] =
                                        number.trim();
                                    break;
                                  case 'FirstLegVariantLeg2':
                                    formsDataFirstLegVariantLegTwo[widget.index]
                                        ['Number'] = number.trim();
                                    break;
                                  default:
                                }
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return;
                                }
                              },
                              inputFormatters: [phoneNumberFormatter],
                              controller: this._number,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 0.0),
                                fillColor: Colors.white,
                                filled: true,
                              ),
                            ),
                          ),
                        ],
                      )),
                )
              ],
            )
          ],
        ),
      ],
    );
  }

  List<DropdownMenuItem<AssetImage>> getDropDownMenuItems() {
    List<DropdownMenuItem<AssetImage>> items = new List();
    for (AssetImage flag in countryCode.values) {
      // here we are creating the drop down menu items, you can customize the item right here
      // but I'll just use a simple text for this
      items.add(DropdownMenuItem(
          value: flag,
          child: Image(
            image: flag,
            height: 40,
            width: 40,
          )));
    }
    return items;
  }

  void changedDropDownItem(AssetImage selectedFlag) {
    setState(() {
      _currentFlag = selectedFlag;
      _currentCode = countryCode.keys
          .firstWhere((k) => countryCode[k] == selectedFlag, orElse: () => '');
    });
  }
}
