import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/widgets/button.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
      appBarIcon: backArrow,
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
    return ListView(
      padding: EdgeInsets.all(5.0),
      children: <Widget>[
        Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Your seat",
                    style: TextStyle(
                        color: Colors.yellow,
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.w600)),
                Text(
                  "Details",
                  style: TextStyle(
                      color: Colors.yellow,
                      fontFamily: 'Helvetica',
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Purchase Details",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Helvetica',
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Purchase",
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
                width: 310,
                image: wizardTwo,
              ),
            ),
            DetailTicket(),
            ListTile(
              contentPadding: EdgeInsets.all(20),
              title: Text(
                '1.Voyager Information:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: 'Helvetica',
                ),
              ),
              trailing: Text(
                'Seat 34',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: 'Helvetica',
                ),
              ),
            ),
          ],
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
        Center(
          child: GunselButton(
            btnWidth: 500,
            btnText: 'Continue',
            btnTextFontSize: 40,
            whenPressed: () {
              Navigator.pushNamed(
                context,
                ticketSummaryScreen,
              );
            },
          ),
        )
      ],
    );
  }
}

class DetailTicket extends StatelessWidget {
  bool checkOneVal = false;
  bool checkTwoVal = false;
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
              padding: EdgeInsets.only(left: 75.0, bottom: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 120,
                        width: 130,
                        child: Text(
                          '13',
                          style: TextStyle(
                              fontSize: 120,
                              color: Colors.black,
                              fontFamily: 'SFProText',
                              fontWeight: FontWeight.w900,
                              letterSpacing: -15),
                        ),
                      ),
                      Text(
                        '08 2019',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 90,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(right: 150),
                          child: Text(
                            'Kyiv',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                      Text(
                        '23:00',
                        style: TextStyle(
                          fontSize: 80,
                          color: darkBlue,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'DEPARTURE',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(right: 150),
                          child: Text(
                            'Odessa',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                      Text(
                        '06:20',
                        style: TextStyle(
                          fontSize: 80,
                          color: darkBlue,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'ARRIVAL',
                        style: TextStyle(
                          fontSize: 25,
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
                                    ' ${this._currentCode} ',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  elevation: 0,
                                  value: _currentFlag,
                                  items: _dropDownMenuItems,
                                  onChanged: changedDropDownItem,
                                )),
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
                                    border: InputBorder.none,
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
            height: 25,
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
