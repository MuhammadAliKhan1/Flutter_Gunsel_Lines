import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/widgets/button.dart';
import 'package:gunsel/data/publictoken_model.dart';
import 'package:gunsel/data/stationlist_model.dart';
import 'package:gunsel/data/data_model.dart';
import 'package:http/http.dart' as http;

class OneWay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
      backgroundImage: scaffoldImg,
      appBarTitleIncluded: true,
      appBarTitle: 'Search Ticket',
      appBarIncluded: true,
      bodyWidget: SearchTicketContainer(),
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.white),
          ),
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width / 1.05,
          child: ListView(
            children: <Widget>[
              SwitchBar(),
              OneWayForm(),
            ],
          ),
        ));
  }
}

class SwitchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RaisedButton(
          child: Text(
            "ONE WAY",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          color: Colors.yellow,
          onPressed: () {},
        ),
        RaisedButton(
          child: Text(
            "ROUND WAY",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0.0,
          splashColor: Colors.yellow,
          highlightElevation: 0.0,
          color: Colors.transparent,
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(
              '$roundWayScreen',
            );
          },
        ),
      ],
    );
  }
}

class OneWayForm extends StatefulWidget {
  @override
  _OneWayFormState createState() => _OneWayFormState();
}

class _OneWayFormState extends State<OneWayForm> {
  String date;
  int passengers;
  Map<String, dynamic> data;
  Token gunselToken;
  StationList stationList;
  DataStatusSeperator gunselDataToken;
  DataStatusSeperator gunselDataStation;
  final TextEditingController _typeAheadController = TextEditingController();
  String _selectedStation;
  Future<void> _getToken() async {
    http.Response response = await http.get(
      Uri.encodeFull(tokenAPI),
      headers: {
        'Accept': 'application/json',
      },
    );
    gunselDataToken = DataStatusSeperator.fromJson(jsonDecode(response.body));
    gunselToken = Token.fromJson(jsonDecode(gunselDataToken.data));
  }

  Future<void> _getStationList() async {
    http.Response response = await http.get(
      Uri.encodeFull(stationListAPI),
      headers: {
        'token': gunselToken.token,
      },
    );

    var stations = jsonDecode(jsonDecode(response.body)['Data']);
    var stationMap = {'Data': stations};
    stationList = StationList.fromJson(stationMap);
  }

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2019),
      lastDate: new DateTime(2050),
    );
    if (picked != null)
      setState(
        () => date = picked.toString(),
      );
  }

  //For number counter
  @override
  void initState() {
    // _getData();
    //print_token();
    super.initState();
    this.date = "2019/01/01";
    this.passengers = 0;
  }

  void print_token() {
    Token a;
    a.getToken();
  }

  void _getData() async {
    await _getToken();
    _getStationList();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.2,
              child: TextFormField(
                validator: (String passengers) {
                  if (passengers.isEmpty) {
                    return "Please enter departure city";
                  }
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.location_on),
                  hintText: 'Enter departure city',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.2,
              child: TypeAheadFormField(
                textFieldConfiguration: TextFieldConfiguration(
                  controller: this._typeAheadController,
                ),
                validator: (String passengers) {
                  if (passengers.isEmpty) {
                    return "Please enter departure city";
                  }
                },
                suggestionsCallback: (String pattern) {
                  return _getSuggestion(pattern);
                },
                itemBuilder: (BuildContext context, itemData) {
                  return ListTile(
                    title: Text(itemData),
                  );
                },
                transitionBuilder: (context, suggestionsBox, controller) {
                  return suggestionsBox;
                },
                onSuggestionSelected: (suggestion) {
                  this._typeAheadController.text = suggestion;
                },
                onSaved: (value) => this._selectedStation = value,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.2,
            child: InkWell(
              onTap: () {
                _selectDate();
              },
              child: IgnorePointer(
                child: TextFormField(
                  //validator: validateDob,
                  validator: (String date) {
                    debugPrint("$passengers");
                  },
                  keyboardType: TextInputType.datetime,
                  //controller: ,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.date_range),
                      hintText: "${this.date}",
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
            width: MediaQuery.of(context).size.width / 1.2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Number Of Passenger:",
                  textScaleFactor: this.passengers > 10 ? 1.0 : 1.1,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(width: 5.0),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: <Widget>[
                      //Plus icon
                      IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              this.passengers++;
                            },
                          );
                        },
                      ),

                      //Number
                      Text(
                        this.passengers.toString(),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      //Minus icon
                      IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              if (this.passengers > 0) this.passengers--;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GunselButton(
                btnWidth: 250,
                btnText: 'Change Station',
                btnTextFontSize: 27,
                btnTextColor: gunselColor,
                whenPressed: () {},
              ),
              GunselButton(
                whenPressed: () {},
                btnWidth: 250,
                btnText: 'Search',
                btnTextFontSize: 30,
                btnTextColor: gunselColor,
              ),
            ],
          )
        ],
      ),
    );
  }

  _getSuggestion(String pattern) {
    pattern = pattern.toUpperCase();
    Map<String, dynamic> stationMap = stationList.toJson();
    var list = [];
    for (var station in stationMap['Data']) {
      if ((station['StationName'].toUpperCase()).contains(pattern))
        list.add(station['StationName']);
    }
    return list;
  }
}
