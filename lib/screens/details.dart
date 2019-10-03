import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/widgets/button.dart';

Map<int, dynamic> formsData;

class Detail extends StatelessWidget {
  Map<String, dynamic> ticketData;
  Detail({
    @required this.ticketData,
  });
  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
      appBarIcon: backArrow,
      appBarIncluded: true,
      backgroundImage: scaffoldImg,
      bodyWidget: DetailScreen(ticketData: this.ticketData),
      appBarTitle: 'Voyagers Information',
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
  static GlobalKey<FormState> _detailForm = new GlobalKey<FormState>();
  String checked = "assets/checked.png";
  bool checkBox1 = false;
  bool checkBox2 = false;
  String path1 = "assets/unchecked.png";
  String path2 = "assets/unchecked.png";
  @override
  void initState() {
    super.initState();
    formsData = Map();
    if (widget.ticketData['BuyTicketData']['SecondLegCheck'])
      for (int i = 0;
          i < (widget.ticketData['SecondLeg']['SelectedSeatsNumber'].length);
          ++i) {
        formsData[(i + 1)] = {
          'Name': 'null',
          'Surname': 'null',
          'Email': 'null',
          'Number': 0,
          'SeatNumber': 'null'
        };
      }
    else
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
                        Text("Your seat",
                            style: TextStyle(
                                color: Colors.white,
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
                        width: 400,
                        image: wizardTwo,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: widget.ticketData['BuyTicketData']
                              ['SecondLegCheck']
                          ? DetailTicket(
                              day: int.parse(widget.ticketData['SecondLeg']
                                      ['TicketData']['DepartureDate']
                                  .substring(8, 10)),
                              month: int.parse(widget.ticketData['SecondLeg']
                                      ['TicketData']['DepartureDate']
                                  .substring(5, 7)),
                              year: int.parse(widget.ticketData['SecondLeg']
                                      ['TicketData']['DepartureDate']
                                  .substring(0, 4)),
                              arrivalStation: widget.ticketData['SecondLeg']
                                  ['TicketData']['ToStation']['StationName'],
                              departureStation: widget.ticketData['SecondLeg']
                                  ['TicketData']['FromStation']['StationName'],
                              departureTime: widget.ticketData['SecondLeg']
                                      ['TicketData']['DepartureTime']
                                  .substring(0, 5),
                              arrivalTime: widget.ticketData['SecondLeg']
                                      ['TicketData']['ArrivalTime']
                                  .substring(0, 5),
                            )
                          : DetailTicket(
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
                              arrivalTime: widget.ticketData['FirstLeg']
                                      ['TicketData']['ArrivalTime']
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
                        return widget.ticketData['BuyTicketData']
                                ['SecondLegCheck']
                            ? DetailForm(
                                index: index + 1,
                                seatNumber: widget.ticketData['SecondLeg']
                                    ['SelectedSeatsNumber'][index],
                              )
                            : DetailForm(
                                index: index + 1,
                                seatNumber: widget.ticketData['FirstLeg']
                                    ['SelectedSeatsNumber'][index],
                              );
                      },
                      childCount: widget.ticketData['BuyTicketData']
                              ['SecondLegCheck']
                          ? widget
                              .ticketData['SecondLeg']['SelectedSeatsNumber']
                              .length
                          : widget.ticketData['FirstLeg']['SelectedSeatsNumber']
                              .length,
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
                      "I read the agreement and I agree",
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
                      "I want to be subscriber",
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
            ],
          ),
        ),
        Align(
          child: GunselButton(
            btnWidth: 500,
            btnText: 'Continue',
            btnTextFontSize: 40,
            whenPressed: () {
              if (_detailForm.currentState.validate() && checkBox1) {
                _detailForm.currentState.save();
                if (widget.ticketData['BuyTicketData']['RoundWayCheck']) {
                  if (widget.ticketData['BuyTicketData']['SecondLegCheck']) {
                    widget.ticketData['SecondLeg']['SeatCount'] =
                        formsData.keys.length;
                    widget.ticketData['SecondLeg']['SeatVoyagerInfo'] =
                        formsData;
                    widget.ticketData['SecondLeg']['AgreementCheckBox'] =
                        checkBox1;
                    widget.ticketData['SecondLeg']['SubscriberCheckBox'] =
                        checkBox2;
                    Navigator.pushNamed(context, ticketSummaryScreen,
                        arguments: widget.ticketData);
                  } else {
                    widget.ticketData['FirstLeg']['SeatCount'] =
                        formsData.keys.length;
                    widget.ticketData['FirstLeg']['SeatVoyagerInfo'] =
                        formsData;
                    widget.ticketData['FirstLeg']['AgreementCheckBox'] =
                        checkBox1;
                    widget.ticketData['FirstLeg']['SubscriberCheckBox'] =
                        checkBox2;
                    widget.ticketData['SecondLeg'] = null;
                    widget.ticketData['SecondLegTickets'] = null;

                    Navigator.pushNamed(context, searchTicketScreen,
                        arguments: widget.ticketData); 
                  }
                } else {
                  widget.ticketData['FirstLeg']['SeatCount'] =
                      formsData.keys.length;
                  widget.ticketData['FirstLeg']['SeatVoyagerInfo'] = formsData;
                  widget.ticketData['FirstLeg']['AgreementCheckBox'] =
                      checkBox1;
                  widget.ticketData['FirstLeg']['SubscriberCheckBox'] =
                      checkBox2;
                  Navigator.pushNamed(context, ticketSummaryScreen,
                      arguments: widget.ticketData);
                }
              }
            },
          ),
          alignment: Alignment.bottomCenter,
        ),
      ],
    );
  }
}

class DetailTicket extends StatelessWidget {
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
                            '$day',
                            style: TextStyle(
                              fontSize: 120,
                              color: Colors.black,
                              fontFamily: 'SFProText',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        padding: EdgeInsets.only(left: (day > 9 ? 0.0 : 30.0)),
                      ),
                      Padding(
                        child: Text(
                          '$month $year',
                          style: TextStyle(
                            fontSize: 35,
                            color: Colors.black,
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        padding: EdgeInsets.only(left: (day > 9 ? 0.0 : 30.0)),
                      )
                    ],
                  ),
                  SizedBox(
                    width: (day > 9 ? 55.0 : 130.0),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(right: 100),
                          child: Text(
                            '$departureStation',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                      Text(
                        '$departureTime',
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
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(right: 130),
                          child: Text(
                            '$arrivalStation',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                      Text(
                        '$arrivalTime',
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
  int index;
  int seatNumber;
  DetailForm({
    @required this.index,
    @required this.seatNumber,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ListTile(
          contentPadding: EdgeInsets.all(20),
          title: Text(
            '${widget.index}.Voyager Information:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontFamily: 'Helvetica',
            ),
          ),
          trailing: Text(
            'Seat ${widget.seatNumber}',
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
                    return 'Please enter your name.';
                  }
                },
                controller: this._name,
                onSaved: (name) {
                  formsData[widget.index]['Name'] = name.trim();
                  formsData[widget.index]['SeatNumber'] = widget.seatNumber;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10.0,
                  ),
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
                onSaved: (surname) {
                  formsData[widget.index]['Surname'] = surname.trim();
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10.0,
                  ),
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
                onSaved: (email) {
                  formsData[widget.index]['Email'] = email.trim();
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
                              onSaved: (number) {
                                var code;
                                if (this._currentCode != '+48')
                                  code = this._currentCode.substring(0, 3) +
                                      this._currentCode.substring(4);
                                else
                                  code = this._currentCode;
                                formsData[widget.index]['Number'] =
                                    ('$code$number');
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return;
                                }
                              },
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly
                              ],
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
    );
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
