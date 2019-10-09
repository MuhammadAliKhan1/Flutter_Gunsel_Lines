import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/data/stationlist_model.dart';
import 'package:gunsel/widgets/button.dart';
import 'package:http/http.dart' as http;
import 'package:gunsel/data/sharedPreference.dart';

class OneWay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OneWayState();
  }
}

class OneWayState extends State<OneWay> {
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
                      OneWayForm(),
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
                          Alignment.centerLeft, Alignment.centerRight, 0.20),
                      child: SizedBox(
                        height: ScreenUtil(allowFontScaling: false).setSp(90),
                        child: RaisedButton(
                          child: Text(
                            oneWay,
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

class OneWayForm extends StatefulWidget {
  @override
  _OneWayFormState createState() => _OneWayFormState();
}

class _OneWayFormState extends State<OneWayForm> {
  final _oneWayForm = GlobalKey<FormState>();
  TextEditingController _arrivalStation = TextEditingController();
  TextEditingController _departureStation = TextEditingController();
  TextEditingController _travelInputDate;
  Map<String, dynamic> buyTicketData;
  String _arrivalStationVal;
  String _departureStationVal;
  List<String> stationID = [];
  List<String> stationList;
  int passengers;
  bool stationListFetched;
  DateTime picker;
  SharePreferencelogin sh = SharePreferencelogin();
  String arrivalHint = "Enter arrival station",
      departHint = "Enter departure station",
      calenderHint = "Select the travel date",
      numOfPassengers = "Number of passengers:",
      btnSearch = "Search",
      oneWay = "ONE WAY",
      roundWay = "ROUND WAY",
      selectDepartureStation = "Please select an departure station",
      selectValidStation = "Please select a valid departure station";

  @override
  void initState() {
    buyTicketData = Map();
    super.initState();
    this.passengers = 1;
    stationListFetched = false;
    stationID = [];
    setInitialDate();
    oneWaylan();
  }

  setInitialDate() async {
    picker = DateTime.now();
  }

  void oneWaylan() async {
    int b;
    int a = await sh.getshared1();
    //print("Name is" + nameProfile);

    setState(() {
      b = a;

      if (b == 1) {
        arrivalHint = "Введіть станцію прибуття";
        departHint = "Введіть станцію відправлення";
        calenderHint = "Виберіть дату подорожі";
        numOfPassengers = "Кількість пасажирів:";
        btnSearch = "Пошук";
        selectDepartureStation = "Виберіть пункт відправлення";
        selectValidStation = "Виберіть дійсну станцію відправлення";
      } else if (b == 2) {
        arrivalHint = "Enter arrival station";
        departHint = "Enter departure station";
        calenderHint = "Select the travel date";
        numOfPassengers = "Number of passengers:";
        btnSearch = "Search";
        selectDepartureStation = "Please select an departure station";
        selectValidStation = "Please select a valid departure station";
      } else if (b == 3) {
        arrivalHint = "Введите станцию ​​прибытия";
        departHint = "Введите станцию ​​отправления";
        calenderHint = "Выберите дату поездки";
        numOfPassengers = "Количество пассажиров:";
        btnSearch = "Поиск";
        selectDepartureStation = "Пожалуйста, выберите станцию ​​отправления";
        selectValidStation =
            "Пожалуйста, выберите действующую станцию ​​отправления";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _oneWayForm,
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.lerp(
              Alignment.topLeft,
              Alignment.topRight,
              0.75,
            ),
            child: RoundWayButton(),
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
                else if (this._arrivalStation.text == value)
                  return selectDepartureStation;
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
                  return 'Please select an arrival station';
                } else if (!stationList.contains(value))
                  return 'Please select a valid arrival station';
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
                _travelSelectedDate(context);
              },
              child: AbsorbPointer(
                child: TextFormField(
                  validator: (value) {},
                  style: TextStyle(color: Colors.blue, fontSize: 17.0),
                  keyboardType: TextInputType.datetime,
                  controller: this._travelInputDate,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Image(
                        image: calendarIcon,
                      ),
                      hintText: calenderHint,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: ScreenUtil().setWidth(550),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  numOfPassengers,
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
              if (_oneWayForm.currentState.validate()) {
                if (this._travelInputDate == null) {
                  DateTime picker = await DateTime.now();
                  buyTicketData['DepartureDay'] = picker.day;
                  buyTicketData['DepartureMonth'] = picker.month;
                  buyTicketData['DepartureYear'] = picker.year;
                }
                buyTicketData['ArrivalStation'] = this._arrivalStation.text;
                buyTicketData['DepartureStation'] = this._departureStation.text;
                buyTicketData['ArrivalStationId'] = stationID[
                    (stationList.indexOf(buyTicketData['ArrivalStation']))];
                buyTicketData['DepartureStationId'] = stationID[
                    (stationList.indexOf(buyTicketData['DepartureStation']))];
                buyTicketData['PassengerCount'] = this.passengers;
                buyTicketData['RoundWayCheck'] = false;
                buyTicketData['SecondLegCheck'] = false;
                setState(() {
                  Navigator.pushNamed(context, searchTicketScreen,
                      arguments: this.buyTicketData);
                });
              }
            },
          ),
        ],
      ),
    );
  }

  //Functions
  Future<List<String>> getStationsFromAPI() async {
    print('entered');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String gunselToken = prefs.getString('Token');

    //String gunselToken ="BB7D3752C7184D51A412D08C03EAA585B1DCB425392B5D6FC6DDEB0E29ACFB41D8AFBE9535B6ECC1E4F018B3307ECBCAE07A113740AD83200EFAADEBB70A18FE5DBB4F695991EF6EAF917836C3C00EBAB55C26D33DE1B3B2B763629D092DA63697B944A037A305BACA2D12F79B1726231DD3032B897F79039C10E5008F1BF6D21202279832AA150A3AF5B68AC4BD6EE1FB884BFC2BC0B195A71DCD964F8FF6CC2CBA901668B9199F34C821BEA780E8AEBF7A8A43874948ABC6003A996A74155FBA2BF184A62DA513FD28312E1395ED7BD201B77EB44CEF9EC1D66037B286417FC02F062B1355E81925DE553B8BE2FBCE6D82C05C1D08CBF67763BC43FF15EAD68D08F27E5E021083CE998AED3E156A5AD6E0BBE22AD0A266D88813CD97C8D67CDBA226F20CF75C9104E5F34C96C9C82D70FA0504852AC382BD0F845DB47457AABE26ACA6B2878B09C47C7B1EB43013FD05B6E5E2CD17E5A2F7DFCBF165C5E8F4";

    print("gunsel token is:" + gunselToken);

    List<String> list = [];
    http.Response response = await http.get(
      Uri.encodeFull(stationListAPI),
      headers: {
        'token': gunselToken,
      },
    );
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
    //if list is null{
    pattern = pattern.toUpperCase();
    if (this.stationListFetched) {
      for (String station in this.stationList) {
        if ((station.toUpperCase()).contains(pattern))
          list.add(
            station,
          );
      }
    } else {
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
    return list;
  }

  Future _travelSelectedDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(days: 0)),
      firstDate: DateTime.now().add(Duration(days: -1)),
      lastDate: DateTime.now().add(Duration(days: 730)),
    );
    if (picked != null)
      setState(() {
        this._travelInputDate = new TextEditingController(
            text: "${picked.day}.${picked.month}.${picked.year}");
        buyTicketData['DepartureDay'] = picked.day;
        buyTicketData['DepartureMonth'] = picked.month;
        buyTicketData['DepartureYear'] = picked.year;
      });
  }
}

class RoundWayButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RoundWayScreenState();
  }
}

class RoundWayScreenState extends State<RoundWayButton> {
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
    return RaisedButton(
      child: Text(
        roundWay,
        style: TextStyle(color: Colors.white, fontFamily: "MyriadPro"),
      ),
      elevation: 0.0,
      splashColor: Colors.yellow,
      highlightElevation: 0.0,
      color: Colors.transparent,
      onPressed: () {
        Navigator.of(context).pushNamedAndRemoveUntil(
            roundWayScreen, (Route<dynamic> route) => false);
      },
    );
  }
}
