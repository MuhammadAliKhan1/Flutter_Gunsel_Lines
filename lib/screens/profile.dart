import 'dart:math';

import 'package:gunsel/data/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GunselScaffold(
        appBarIcon: menuIcon,
        appBarIncluded: true,
        appBarColor: gunselColor,
        appBarTitleIncluded: true,
        appBarTitle: 'Profile',
        drawerIncluded: true,
        backgroundImage: profileScreenBackground,
        bodyWidget: SingleChildScrollView(
          child: ProfileScreen(),
          padding: EdgeInsets.only(top: 30.0),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<DropdownMenuItem<AssetImage>> _dropDownMenuItems;
  AssetImage _currentFlag;
  String _currentCode = '';

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentFlag = _dropDownMenuItems[0].value;
    _currentCode = countryCode.keys
        .firstWhere((k) => countryCode[k] == _currentFlag, orElse: () => '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FittedBox(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: MediaQuery.of(context).size.height / 1.3,
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height / 1.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                Radius.circular(10),
              )),
              child: Image(
                image: person,
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width / 1.2 - 46,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 95,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Container(
                                      child: AlertDialog(
                                          backgroundColor: gunselColor,
                                          title: Text(
                                            "Edit Profile Information",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Helvetica",
                                                fontSize: 20.0),
                                            textAlign: TextAlign.center,
                                          ),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Row(children: <Widget>[
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 15.0),
                                                    child: Text(
                                                      "First Name",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 10.0,
                                                          fontFamily:
                                                              "Helvetica"),
                                                    )),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 15.0, left: 80.0),
                                                    child: Text(
                                                      "Last Name",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 10.0,
                                                          fontFamily:
                                                              "Helvetica"),
                                                    ))
                                              ]),
                                              Row(children: <Widget>[
                                                Expanded(
                                                    child: TextField(
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                  keyboardType:
                                                      TextInputType.text,
                                                  decoration: InputDecoration(
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .white)),
                                                  ),
                                                )),
                                                SizedBox(
                                                  width: 5.0,
                                                ),
                                                Expanded(
                                                    child: TextField(
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                  keyboardType:
                                                      TextInputType.text,
                                                  decoration: InputDecoration(
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .white)),
                                                  ),
                                                ))
                                              ]),
                                              SizedBox(
                                                height: 5.0,
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 25.0),
                                                  child: Text(
                                                    "Email                                                                                ",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10.0,
                                                        fontFamily:
                                                            "Helvetica"),
                                                  )),
                                              TextField(
                                                keyboardType:
                                                    TextInputType.text,
                                                style: TextStyle(
                                                    color: Colors.white),
                                                decoration: InputDecoration(
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .white)),
                                                ),
                                              ),
                                              SizedBox(height: 5.0),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 170.0),
                                                  child: Text("Phone Number",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 10.0,
                                                          fontFamily:
                                                              "Helvetica"))),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        height: ScreenUtil()
                                                            .setHeight(50),
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 5.0),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                          color: Colors.white,
                                                        ),
                                                        child:
                                                            DropdownButtonHideUnderline(
                                                                child:
                                                                    DropdownButton(
                                                          icon: Icon(
                                                            Icons
                                                                .keyboard_arrow_down,
                                                            color: Colors.grey,
                                                            size: ScreenUtil(
                                                              allowFontScaling:
                                                                  true,
                                                            ).setHeight(40),
                                                          ),
                                                          elevation: 0,
                                                          value: _currentFlag,
                                                          items:
                                                              _dropDownMenuItems,
                                                          onChanged:
                                                              changedDropDownItem,
                                                        )),
                                                      )),
                                                  SizedBox(width: 5.0),
                                                  Expanded(
                                                      flex: 5,
                                                      child: TextField(
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                        keyboardType:
                                                            TextInputType.text,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              "$_currentCode",
                                                          hintStyle: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                          enabledBorder:
                                                              UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Colors.white)),
                                                        ),
                                                      ))
                                                ],
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 30.0),
                                                  child: RaisedButton(
                                                    child: Text(
                                                      "Save Changes",
                                                      style: TextStyle(
                                                          fontSize: 20.0,
                                                          color: darkBlue),
                                                    ),
                                                    highlightColor:
                                                        Colors.yellow,
                                                    color: Colors.yellow,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          10.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      10.0)),
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        //TODO: Send mail button
                                                        debugPrint(
                                                            "Send button is pressed");
                                                      });
                                                    },
                                                  ))
                                            ],
                                          )));
                                });

                            /* Alert(
                                context: context,
                                title: "Edit Profile Information",
                                content: Container(
                                    color: gunselColor,
                                    child: Column(
                                      children: <Widget>[
                                        TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Username',
                                          ),
                                        ),
                                        TextField(
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            labelText: 'Email',
                                          ),
                                        ),
                                        TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Username',
                                          ),
                                        ),
                                      ],
                                    )),
                                buttons: [
                                  DialogButton(
                                    color: Colors.yellow,
                                    onPressed: () => Navigator.pop(context),
                                    child: Text(
                                      "Save Changes",
                                      style: TextStyle(
                                          color: darkBlue, fontSize: 20),
                                    ),
                                  )
                                ]).show();*/
                          },
                          child: Image(
                            image: editProfileIcon,
                            height: 25,
                          ),
                        ),
                      ),
                    ),
                    Center(
                        child: Text(
                      'Erhan Ozturk',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Helvetica"),
                    )),
                    SizedBox(
                      height: 3,
                    ),
                    Center(
                      child: Text(
                        'eozturk782@gmail.com',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Helvetica",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Center(
                      child: Text(
                        '+380677331606',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Helvetica",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Image(
                                  image: profileScreenLanguageIcon,
                                  height: 35,
                                ),
                                Text('RU',
                                    style: TextStyle(fontFamily: "Helvetica")),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Image(
                                  image: profileScreenLanguageIcon,
                                  height: 35,
                                ),
                                Text('UA',
                                    style: TextStyle(fontFamily: "Helvetica")),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Image(
                                  image: profileScreenLanguageIcon,
                                  height: 35,
                                ),
                                Text('EN',
                                    style: TextStyle(fontFamily: "Helvetica")),
                              ],
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Align(
                alignment: Alignment.topCenter,
                child: Image(
                  image: profileHolder,
                  height: 80,
                )),
          ],
        ),
      ),
    ));
  }

  List<DropdownMenuItem<AssetImage>> getDropDownMenuItems() {
    List<DropdownMenuItem<AssetImage>> items = new List();
    for (AssetImage flag in countryCode.values) {
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

/*
class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: ScreenUtil().setWidth(700),
      height: 550,
      child: Stack(
        children: <Widget>[
          Center(
            child: Image(
              image: personImage,
            ),
          ),
          Align(
            alignment:
                Alignment.lerp(Alignment.topCenter, Alignment.center, 0.01),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(70),
              ),
              child: Image(
                image: profileHolder,
                height: ScreenUtil(
                  allowFontScaling: true,
                ).setSp(130),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: ScreenUtil().setSp(50)),
            height: 60,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Image(
                image: editProfileIcon,
                height: ScreenUtil().setSp(40),
              ),
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(210),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Erhan Ozturk',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(40),
                    fontWeight: FontWeight.bold,
                    fontFamily: "Helvetica"),
              ),
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(235),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'eozturk782@gmail.com',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(20),
                  fontFamily: "Helvetica",
                ),
              ),
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(265),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                '+380677331606',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(20),
                  fontFamily: "Helvetica",
                ),
              ),
            ),
          ),
          SizedBox(
              height: ScreenUtil().setHeight(380),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Image(
                            image: profileScreenLanguageIcon,
                            height:
                                ScreenUtil(allowFontScaling: true).setSp(50),
                          ),
                          Text('RU', style: TextStyle(fontFamily: "Helvetica")),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Image(
                            image: profileScreenLanguageIcon,
                            height:
                                ScreenUtil(allowFontScaling: true).setSp(50),
                          ),
                          Text('UA', style: TextStyle(fontFamily: "Helvetica")),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Image(
                            image: profileScreenLanguageIcon,
                            height:
                                ScreenUtil(allowFontScaling: true).setSp(50),
                          ),
                          Text('EN', style: TextStyle(fontFamily: "Helvetica")),
                        ],
                      ),
                    ],
                  )
                ],
              ))
        ],
      ),
    ));
  }
}
 */
