import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/data/stationlist_model.dart';
import 'package:gunsel/widgets/button.dart';
import 'package:http/http.dart' as http;

import 'package:gunsel/data/sharedPreference.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;

class RoundWay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RoundWayState();
  }
}

class RoundWayState extends State<RoundWay> {
  SharePreferencelogin sh = SharePreferencelogin();
  String searchTicket = "Search Ticket";
  @override
  void initState() {
    super.initState();
    searchTicketlan();
  }

  void searchTicketlan() async {
    int b;
    int a = await sh.getshared1();

    setState(() {
      b = a;

      if (b == 1) {
        searchTicket = "Пошуковий квиток";
      } else if (b == 2) {
        searchTicket = "Seach Ticket";
      } else if (b == 3) {
        searchTicket = "Поиск билета";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
      appBarIcon: menuIcon,
      backgroundImage: scaffoldImg,
      appBarTitleIncluded: true,
      appBarTitle: searchTicket,
      appBarIncluded: true,
      bodyWidget: SingleChildScrollView(child: SearchTicketContainer()),
      drawerIncluded: true,
    );
  }
}

class SearchTicketContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchTicketContainerState();
  }
}

class SearchTicketContainerState extends State<SearchTicketContainer> {
  SharePreferencelogin sh = SharePreferencelogin();
  String roundWay = "ROUND WAY";
  @override
  void initState() {
    super.initState();
    roundWayButtonlan();
  }

  void roundWayButtonlan() async {
    int b;
    int a = await sh.getshared1();

    setState(() {
      b = a;

      if (b == 1) {
        roundWay = "КРУГЛИЙ ШЛЯХ";
      } else if (b == 2) {
        roundWay = "ROUND WAY";
      } else if (b == 3) {
        roundWay = "КРУГЛЫЙ ПУТЬ";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment:
            Alignment.lerp(Alignment.topCenter, Alignment.bottomCenter, 0.2),
        child: Container(
          height: ScreenUtil().setHeight(730),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.white),
                      color: Colors.black26),
                  height: ScreenUtil().setHeight(700),
                  width: ScreenUtil().setWidth(610),
                  child: ListView(
                    children: <Widget>[
                      RoundWayForm(),
                    ],
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    height: ScreenUtil(allowFontScaling: false).setSp(120),
                    child: Align(
                      alignment: Alignment.lerp(
                          Alignment.centerLeft, Alignment.centerRight, 0.80),
                      child: SizedBox(
                        height: ScreenUtil(allowFontScaling: false).setSp(90),
                        child: RaisedButton(
                          child: Text(
                            roundWay,
                            style: TextStyle(
                                color: Colors.black, fontFamily: "MyriadPro"),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          color: Colors.yellow,
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class RoundWayForm extends StatefulWidget {
  @override
  _RoundWayFormState createState() => _RoundWayFormState();
}

class _RoundWayFormState extends State<RoundWayForm> {
  final _RoundWayForm = GlobalKey<FormState>();
  TextEditingController _arrivalStation = TextEditingController();
  TextEditingController _departureStation = TextEditingController();
  TextEditingController _departureInputDate;
  TextEditingController _returnInputDate;
  Map<String, dynamic> buyTicketData;
  String _arrivalStationVal;
  String _departureStationVal;
  List<String> stationID = [];
  List<String> stationList;
  int passengers;
  bool stationListFetched;

  SharePreferencelogin sh = SharePreferencelogin();
  String departHint = "Enter departure city",
      arrivalHint = "Enter arrival city",
      departCalHint = "Select the departure and return date",
      returnCalHint = "Select the return date",
      numOfpassenger = "Number of passengers:",
      btnSearch = "Search",
      selectDepartureStation = "Please select an departure station",
      selectValidStation = "Please select a valid departure station",
      selectArrivalStation = "Please select an arrival station",
      selectArrivalValidStation = "Please select a valid arrival station",
      selectDifferentStation = "Please select different stations.",
      enterEmptyDepartureDate = "Please input departure date",
      enterEmptyReturnDate = "Please input return date",
      dateLessthan = "Return date less than departure date",
      inputDifferentDate = "Please input different dates";

  @override
  void initState() {
    buyTicketData = Map();
    super.initState();
    this.passengers = 1;
    stationList = [];
    stationListFetched = false;
    stationID = [];
    setInitialDate();
    roundWaylan();
  }

  void roundWaylan() async {
    int b;
    int a = await sh.getshared1();

    setState(() {
      b = a;

      if (b == 1) {
        departHint = "Введіть місто відправлення";
        arrivalHint = "Введіть місто відправлення";
        departCalHint = "Виберіть дату відправлення";
        returnCalHint = "Виберіть дату повернення";
        numOfpassenger = "Кількість пасажирів:";
        btnSearch = "Пошук";
        selectDepartureStation = "Виберіть пункт відправлення";
        selectValidStation = "Виберіть дійсну станцію відправлення";
        selectArrivalStation = "Виберіть станцію прибуття";
        selectArrivalValidStation = "Виберіть дійсну станцію прибуття";
        selectDifferentStation = "Виберіть інші станції.";
        enterEmptyDepartureDate = "Введіть дату відправлення";
        enterEmptyReturnDate = "Введіть дату повернення";
        dateLessthan = "Дата повернення менше дати вильоту";
        inputDifferentDate = "Введіть різні дати";
      } else if (b == 2) {
        departHint = "Enter departure city";
        arrivalHint = "Enter arrival city";
        departCalHint = "Select the departure and return date";
        returnCalHint = "Select the return date";
        numOfpassenger = "Number of passengers:";
        btnSearch = "Search";
        selectDepartureStation = "Please select an departure station";
        selectValidStation = "Please select a valid departure station";
        selectArrivalStation = "Please select an arrival station";
        selectArrivalValidStation = "Please select a valid arrival station";
        selectDifferentStation = "Please select different stations.";
        enterEmptyDepartureDate = "Please input departure date";
        enterEmptyReturnDate = "Please input return date";
        dateLessthan = "Return date less than departure date";
        inputDifferentDate = "Please input different dates";
      } else if (b == 3) {
        departHint = "Введите город отправления";
        arrivalHint = "Введите город прибытия";
        departCalHint = "Выберите дату отъезда";
        returnCalHint = "Выберите дату возвращения";
        numOfpassenger = "Количество пассажиров:";
        btnSearch = "Поиск";
        selectDepartureStation = "Пожалуйста, выберите станцию ​​отправления";
        selectValidStation =
            "Пожалуйста, выберите действующую станцию ​​отправления";
        selectArrivalStation = "Пожалуйста, выберите станцию ​​прибытия";
        selectArrivalValidStation =
            "Пожалуйста, выберите действующую станцию ​​прибытия";
        selectDifferentStation = "Пожалуйста, выберите разные станции.";
        enterEmptyDepartureDate = "Пожалуйста, введите дату отъезда";
        enterEmptyReturnDate = "Пожалуйста, введите дату возврата";
        dateLessthan = "Дата возвращения меньше даты вылета";
        inputDifferentDate = "Пожалуйста, введите разные даты";
      }
    });
  }

  setInitialDate() async {}

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _RoundWayForm,
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.lerp(
              Alignment.topLeft,
              Alignment.topRight,
              0.25,
            ),
            child: OneWayButton(),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: ScreenUtil().setWidth(550),
            child: TypeAheadFormField(
              textFieldConfiguration: TextFieldConfiguration(
                keyboardType: TextInputType.text,
                controller: this._departureStation,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Image(
                    image: locationIcon,
                    height: 10.0,
                  ),
                  hintText: departHint,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              suggestionsCallback: (pattern) {
                return filterStations(pattern);
              },
              itemBuilder: (context, suggestion) {
                return ListTile(
                  title: Text(
                    suggestion,
                  ),
                );
              },
              transitionBuilder: (context, suggestionsBox, controller) {
                return suggestionsBox;
              },
              onSuggestionSelected: (suggestion) {
                this._departureStation.text = suggestion;
              },
              validator: (value) {
                if (value.isEmpty) {
                  return selectDepartureStation;
                } else if (!stationList.contains(value))
                  return selectValidStation;
              },
              onSaved: (value) => this._departureStationVal = value,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: ScreenUtil().setWidth(550),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(
                      () {
                        var temp = this._arrivalStation;
                        this._arrivalStation = this._departureStation;
                        this._departureStation = temp;
                      },
                    );
                  },
                  child: Image(image: swappingIcon, height: 35.0),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: ScreenUtil().setWidth(550),
            child: TypeAheadFormField(
              textFieldConfiguration: TextFieldConfiguration(
                keyboardType: TextInputType.text,
                controller: this._arrivalStation,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Image(
                    image: locationIcon,
                    height: 10.0,
                  ),
                  hintText: arrivalHint,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              suggestionsCallback: (pattern) {
                return filterStations(pattern);
              },
              itemBuilder: (context, suggestion) {
                return ListTile(
                  title: Text(
                    suggestion,
                  ),
                );
              },
              transitionBuilder: (context, suggestionsBox, controller) {
                return suggestionsBox;
              },
              onSuggestionSelected: (suggestion) {
                this._arrivalStation.text = suggestion;
              },
              validator: (value) {
                if (value.isEmpty) {
                  return selectArrivalStation;
                } else if (!stationList.contains(value))
                  return selectArrivalValidStation;
                else if (this._departureStation.text == value)
                  return selectDifferentStation;
              },
              onSaved: (value) => this._arrivalStationVal = value,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: ScreenUtil().setWidth(550),
            child: InkWell(
              onTap: () {
                _selectDepartureDate(context);
              },
              child: AbsorbPointer(
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) return enterEmptyDepartureDate;
                  },
                  style: TextStyle(color: Colors.blue, fontSize: 17.0),
                  keyboardType: TextInputType.datetime,
                  controller: this._departureInputDate,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Image(image: calendarIcon),
                      hintText: departCalHint,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          // Container(
          //   width: ScreenUtil().setWidth(550),
          //   child: InkWell(
          //     onTap: () {
          //       _selectReturnDate(context);
          //     },
          //     child: AbsorbPointer(
          //       child: TextFormField(
          //         validator: (value) {
          //           if (value.isEmpty)
          //             return enterEmptyReturnDate;
          //           else if (buyTicketData['DepartureDay'] ==
          //               buyTicketData['ReturnDay']) {
          //             if (buyTicketData['DepartureMonth'] ==
          //                 buyTicketData['ReturnMonth']) {
          //               if (buyTicketData['DepartureYear'] ==
          //                   buyTicketData['ReturnYear'])
          //                 return inputDifferentDate;
          //             }
          //           } else if (buyTicketData['ReturnDay'] <
          //               buyTicketData['DepartureDay']) {
          //             return dateLessthan;
          //           }
          //         },
          //         style: TextStyle(color: Colors.blue, fontSize: 17.0),
          //         keyboardType: TextInputType.datetime,
          //         controller: this._returnInputDate,
          //         decoration: InputDecoration(
          //             contentPadding: EdgeInsets.symmetric(vertical: 10.0),
          //             fillColor: Colors.white,
          //             filled: true,
          //             prefixIcon: Image(image: calendarIcon),
          //             hintText: returnCalHint,
          //             border: OutlineInputBorder(
          //                 borderRadius: BorderRadius.circular(5.0))),
          //       ),
          //     ),
          //   ),
          // ),

          Container(
            width: ScreenUtil().setWidth(550),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  numOfpassenger,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(24),
                      fontFamily: 'SFProText'),
                ),
                Container(
                  width: ScreenUtil().setWidth(220),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 15.0,
                        ),
                        onPressed: () {
                          setState(() {
                            if (this.passengers < 4) this.passengers++;
                          });
                        },
                      ),
                      SizedBox(width: 7.0),
                      Text(
                        this.passengers.toString(),
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(width: 7.0),
                      IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: Colors.black,
                          size: 15.0,
                        ),
                        onPressed: () {
                          setState(() {
                            if (this.passengers > 1) this.passengers--;
                          });
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          GunselButton(
            btnWidth: 550,
            btnText: btnSearch,
            btnFontFamily: 'Helvetica',
            btnTextColor: gunselColor,
            btnTextFontSize: 40,
            whenPressed: () async {
              if (_RoundWayForm.currentState.validate()) {
                buyTicketData['ArrivalStation'] = this._arrivalStation.text;
                buyTicketData['DepartureStation'] = this._departureStation.text;
                buyTicketData['ArrivalStationId'] = stationID[
                    (stationList.indexOf(buyTicketData['ArrivalStation']))];
                buyTicketData['DepartureStationId'] = stationID[
                    (stationList.indexOf(buyTicketData['DepartureStation']))];
                buyTicketData['PassengerCount'] = this.passengers;
                buyTicketData['SecondLegCheck'] = false;
                buyTicketData['RoundWayCheck'] = true;
                if (stationList.isNotEmpty) {
                  setState(() {
                    Navigator.pushNamed(context, searchTicketScreen,
                        arguments: this.buyTicketData);
                  });
                }
              }
            },
          ),
        ],
      ),
    );
  }

  //Functions
  Future<List<String>> getStationsFromAPI() async {
    http.Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String gunselToken = prefs.getString('Token');
    List<String> list = [];
    try {
      response = await http.get(
        Uri.encodeFull(stationListAPI),
        headers: {
          'token': gunselToken,
        },
      );
    } catch (e) {
      return [];
    }
    Map<String, dynamic> stationMap = {
      'Data': (jsonDecode(jsonDecode(response.body)['Data']))
    };
    for (var station in (StationList.fromJson(stationMap).toJson()['Data'])) {
      list.add(station['StationName']);
      stationID.add(station['StationId']);
    }
    return list;
  }

  Future<bool> setStationList() async {
    this.stationList = await getStationsFromAPI();
    return true;
  }

  Future<List<String>> filterStations(String pattern) async {
    List<String> list = [];
    if (!this.stationListFetched) {
      this.stationListFetched = await setStationList();
      if (this.stationListFetched) {
        for (String station in this.stationList) {
          if ((station.toUpperCase()).contains(pattern))
            list.add(
              station,
            );
        }
      }
    }
    if (this.stationListFetched && stationList != null) {
      pattern = pattern.toUpperCase();
      for (String station in this.stationList) {
        if ((station.toUpperCase()).contains(pattern))
          list.add(
            station,
          );
      }
    }

    return list;
  }

  Future _selectDepartureDate(BuildContext context) async {
    final List<DateTime> picked = await DateRagePicker.showDatePicker(
      context: context,
      initialFirstDate: DateTime.now().add(Duration(days: 0)),
      initialLastDate: DateTime.now().add(Duration(days: 3)),
      firstDate: DateTime.now().add(Duration(days: -1)),
      lastDate: DateTime.now().add(Duration(days: 730)),
    );

    if (picked == null) {}
    // if (picked != null)
    //   setState(() {
    //     this._departureInputDate = new TextEditingController(
    //         text: "${picked.day}.${picked.month}.${picked.year}");
    //     buyTicketData['DepartureDay'] = picked.day;
    //     buyTicketData['DepartureMonth'] = picked.month;
    //     buyTicketData['DepartureYear'] = picked.year;
    //   });
  }

  Future _selectReturnDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(days: 0)),
      firstDate: DateTime.now().add(Duration(days: -1)),
      lastDate: DateTime.now().add(Duration(days: 730)),
    );
    if (picked != null)
      setState(() {
        this._returnInputDate = new TextEditingController(
            text: "${picked.day}.${picked.month}.${picked.year}");
        buyTicketData['ReturnDay'] = picked.day;
        buyTicketData['ReturnMonth'] = picked.month;
        buyTicketData['ReturnYear'] = picked.year;
      });
  }
}

class OneWayButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OneWayButtonState();
  }
}

class OneWayButtonState extends State<OneWayButton> {
  SharePreferencelogin sh = SharePreferencelogin();
  String oneWay = "ONE WAY";
  @override
  void initState() {
    super.initState();
    oneWayButtonlan();
  }

  void oneWayButtonlan() async {
    int b;
    int a = await sh.getshared1();

    setState(() {
      b = a;

      if (b == 1) {
        oneWay = "ОДНОСТОРОННІЙ";
      } else if (b == 2) {
        oneWay = "ONE WAY";
      } else if (b == 3) {
        oneWay = "В ОДНУ СТОРОНУ";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        oneWay,
        style: TextStyle(color: Colors.white, fontFamily: "MyriadPro"),
      ),
      elevation: 0.0,
      splashColor: Colors.yellow,
      highlightElevation: 0.0,
      color: Colors.transparent,
      onPressed: () {
        Navigator.of(context).pushNamedAndRemoveUntil(
            oneWayScreen, (Route<dynamic> route) => false);
      },
    );
  }
}
