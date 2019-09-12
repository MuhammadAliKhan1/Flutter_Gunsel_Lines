import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/screens/details.dart';
import 'package:gunsel/widgets/button.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
      appBarIncluded: true,
      backgroundImage: scaffoldImg,
      bodyWidget: DetailScreen(),
      appBarTitle: 'Voyagers Information',
      appBarTitleIncluded: true,
      drawerIncluded: false,
    );
  }
}

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool checkOneVal = false;
  bool checkTwoVal = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "Your seat",
                        style: TextStyle(color: Colors.yellow),
                      ),
                      Text(
                        "Details",
                        style: TextStyle(color: Colors.yellow),
                      ),
                      Text(
                        "Purchase Details",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Purchase",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: wizardTwo,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: Ticket(),
              ),
              ListTile(
                contentPadding: EdgeInsets.only(
                  top: 10.0,
                  left: 15.0,
                  right: 15.0,
                ),
                leading: Text(
                  "1.Voyager Information",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
                trailing: Text(
                  "Seat: 34",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              DetailForm(),
              CheckboxListTile(
                title: Text(
                  "I read the agreement and I agree",
                  style: TextStyle(color: Colors.red),
                ),
                onChanged: (bool value) {
                  setState(() {
                    checkTwoVal = value;
                  });
                },
                value: checkTwoVal,
              ),
              CheckboxListTile(
                title: Text("I want to be subscriber",
                    style: TextStyle(color: Colors.red)),
                onChanged: (bool value) {
                  setState(() {
                    checkOneVal = value;
                  });
                },
                value: checkOneVal,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(100),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: GunselButton(
                  whenPressed: () {
                    Navigator.pushNamed(context, ticketSummaryScreen);
                  },
                  btnWidth: 500,
                  btnText: 'Continue',
                  btnTextFontSize: 40,
                ),
              )
            ]),
      ],
    );
  }
}

class Ticket extends StatefulWidget {
  @override
  _TicketState createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Stack(
        children: <Widget>[
          Image(
            image: smallTicket,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              child: Center(
                child: Text(
                  'i',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil(allowFontScaling: true).setSp(35),
                  ),
                ),
              ),
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                  color: darkBlue.withOpacity(0.92),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(8),
                  )),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 60,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '13',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    '08 2019',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              SizedBox(
                width: 38,
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    color: Colors.grey,
                    height: 100,
                    width: 1,
                  )
                ],
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Column(children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 90),
                          child: Text(
                            'Kyiv',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Text(
                          '23:00',
                          style: TextStyle(
                              color: darkBlue,
                              fontSize: 40,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'DEPARTURE',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ]),
                      SizedBox(
                        height: 50,
                        width: 25,
                      ),
                      Column(children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 70),
                          child: Text(
                            'Odessa',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Text(
                          '06:20',
                          style: TextStyle(
                              color: darkBlue,
                              fontSize: 40,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'ARRIVAL',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ]),
                    ],
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class DetailForm extends StatefulWidget {
  List<DropdownMenuItem<AssetImage>> _dropDownMenuItems;
  AssetImage _currentFlag;
  String _currentCode = '';
  @override
  _DetailFormState createState() => _DetailFormState();
}

class _DetailFormState extends State<DetailForm> {
  final _detailForm = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _surname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _number = TextEditingController();
  List<DropdownMenuItem<AssetImage>> _dropDownMenuItems;
  AssetImage _currentFlag;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentFlag = _dropDownMenuItems[0].value;
    _currentCode = countryCode.keys
        .firstWhere((k) => countryCode[k] == _currentFlag, orElse: () => '');
    super.initState();
  }

  String _currentCode = '';
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _detailForm,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(300),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your name.';
                      }
                    },
                    controller: this._name,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: " Name",
                    ),
                  ),
                ),
                Container(
                  width: ScreenUtil().setWidth(300),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your surname.';
                      }
                    },
                    controller: this._surname,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: " Surname",
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
                        return 'Please enter your email.';
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    controller: this._email,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: " Email",
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: ScreenUtil().setWidth(300),
                      height: 39,
                      color: Colors.white,
                      child: ButtonTheme(
                          alignedDropdown: true,
                          child: Row(
                            children: <Widget>[
                              FittedBox(
                                child: DropdownButton(
                                  icon: Text(
                                    ' ${this._currentCode} ',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  elevation: 0,
                                  value: _currentFlag,
                                  items: _dropDownMenuItems,
                                  onChanged: changedDropDownItem,
                                ),
                              ),
                              Flexible(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter your number.';
                                    }
                                  },
                                  controller: this._number,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 10.0),
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
        ));
  }

  List<DropdownMenuItem<AssetImage>> getDropDownMenuItems() {
    List<DropdownMenuItem<AssetImage>> items = new List();
    for (AssetImage flag in countryCode.values) {
      // here we are creating the drop down menu items, you can customize the item right here
      // but I'll just use a simple text for this
      items.add(DropdownMenuItem(
          value: flag,
          child: new Image(
            image: flag,
            height: 20,
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
