import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/data/stationlist_model.dart';
import 'package:gunsel/widgets/button.dart';
import 'package:http/http.dart' as http;

class OneWay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
      backgroundImage: scaffoldImg,
      appBarTitleIncluded: true,
      appBarTitle: 'Search Ticket',
      appBarIncluded: true,
      bodyWidget: SingleChildScrollView(child: SearchTicketContainer()),
      drawerIncluded: true,
    );
  }
}

class SearchTicketContainer extends StatelessWidget {
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
                          Alignment.centerLeft, Alignment.centerRight, 0.25),
                      child: SizedBox(
                        height: ScreenUtil(allowFontScaling: false).setSp(90),
                        child: RaisedButton(
                          child: Text(
                            "ONE WAY",
                            style: TextStyle(color: Colors.black),
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
  String _arrivalStationVal;
  String _departureStationVal;
  List<String> stationList;
  int passengers;
  bool stationListFetched = false;
  @override
  void initState() {
    super.initState();
    this.passengers = 1;
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
                controller: this._arrivalStation,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Image(
                    image: locationIcon,
                    height: 10.0,
                  ),
                  hintText: "Enter departure city",
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
                }
              },
              onSaved: (value) => this._arrivalStationVal = value,
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
                controller: this._departureStation,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Image(
                    image: locationIcon,
                    height: 10.0,
                  ),
                  hintText: "Enter arrival city",
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
                  return 'Please select an departure station';
                }
              },
              onSaved: (value) => this._departureStationVal = value,
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
                  style: TextStyle(color: Colors.lightBlue),
                  keyboardType: TextInputType.datetime,
                  controller: this._travelInputDate,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Image(
                        image: calendarIcon,
                      ),
                      hintText: "Select the travel date",
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
                  'Number of passengers:',
                  style: TextStyle(
                      color: Colors.white, fontSize: ScreenUtil().setSp(24),fontFamily: 'SFProText'),
                ),
                Container(
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
                        ),
                        onPressed: () {
                          setState(() {
                            if (this.passengers < 4) this.passengers++;
                          });
                        },
                      ),
                      Text(
                        this.passengers.toString(),
                        style: TextStyle(color: Colors.black),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: Colors.black,
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
            btnWidth: 500,
            btnText: 'Search',
            btnTextColor: gunselColor,
            btnTextFontSize: 35,
            whenPressed: () {
              setState(() {
                if (_oneWayForm.currentState.validate()) {
                  Navigator.pushNamed(context, searchTicketScreen);
                }
              });
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
    }
    return list;
  }

  Future<bool> setStationList() async {
    this.stationList = await getStationsFromAPI();
    return true;
  }

  Future<List<String>> filterStations(String pattern) async {
    List<String> list = [];
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
        initialDate: DateTime.now(),
        firstDate: new DateTime(2019),
        lastDate: new DateTime(2020));
    if (picked != null)
      setState(() {
        this._travelInputDate = new TextEditingController(
            text: "${picked.month}.${picked.day}.${picked.year}");
      });
  }
}

class RoundWayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        "ROUND WAY",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      elevation: 0.0,
      splashColor: Colors.yellow,
      highlightElevation: 0.0,
      color: Colors.transparent,
      onPressed: () {
        Navigator.of(context).pushReplacementNamed(
          roundWayScreen,
        );
      },
    );
  }
}
