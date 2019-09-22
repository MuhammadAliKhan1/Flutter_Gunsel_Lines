import 'package:gunsel/data/constants.dart';
import 'package:gunsel/data/sharedPreference.dart';

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
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();

  TextEditingController _email = TextEditingController();
  TextEditingController _number = TextEditingController();

  SharePreferencelogin shPref = SharePreferencelogin();

  List<DropdownMenuItem<AssetImage>> _dropDownMenuItems;
  AssetImage _currentFlag;
  String _currentCode = '';
  String nameProfile,
      nameProfileset,
      pictureProfile,
      pictureProfileset,
      emailProfile,
      emailProfileset,
      phoneProfile,
      phoneProfileset,
      loginCategory,
      loginCategoryset;
  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentFlag = _dropDownMenuItems[0].value;
    _currentCode = countryCode.keys
        .firstWhere((k) => countryCode[k] == _currentFlag, orElse: () => '');

    profileName();
    profileImage();
    profileemail();
    profileNumber();
    loginCategorys();

    super.initState();
  }

  void profileName() async {
    nameProfile = await shPref.getname();
    print("Name is" + nameProfile);

    setState(() {
      nameProfileset = nameProfile;
    });
  }

  void profileImage() async {
    pictureProfile = await shPref.getpicture();
    print("Name is" + pictureProfile);
    setState(() {
      pictureProfileset = pictureProfile;
    });
  }

  void profileemail() async {
    emailProfile = await shPref.getemail();
    print("Name is" + emailProfile);
    setState(() {
      emailProfileset = emailProfile;
    });
  }

  void profileNumber() async {
    phoneProfile = await shPref.getphone();
    print("Name is" + phoneProfile);

    setState(() {
      phoneProfileset = phoneProfile;
    });
  }

  void loginCategorys() async {
    loginCategory = await shPref.getLoginCategory();
    print("loginCategory" + loginCategory);

    setState(() {
      loginCategoryset = loginCategory;
    });
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
                            editData();
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return SingleChildScrollView(
                                      child: Container(
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
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 15.0),
                                                        child: Text(
                                                          "First Name",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 10.0,
                                                              fontFamily:
                                                                  "Helvetica"),
                                                        )),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 15.0,
                                                                left: 80.0),
                                                        child: Text(
                                                          "Last Name",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 10.0,
                                                              fontFamily:
                                                                  "Helvetica"),
                                                        ))
                                                  ]),
                                                  Row(children: <Widget>[
                                                    Expanded(
                                                        child: TextField(
                                                      controller:
                                                          this._firstName,
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          InputDecoration(
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .white)),
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .white)),
                                                      ),
                                                    )),
                                                    SizedBox(
                                                      width: 5.0,
                                                    ),
                                                    Expanded(
                                                        child: TextField(
                                                      controller:
                                                          this._lastName,
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          InputDecoration(
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .white)),
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                                borderSide: BorderSide(
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
                                                    controller: this._email,
                                                    keyboardType:
                                                        TextInputType.text,
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                    decoration: InputDecoration(
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .white)),
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .white)),
                                                    ),
                                                  ),
                                                  SizedBox(height: 5.0),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 170.0),
                                                      child: Text(
                                                          "Phone Number",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
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
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            child:
                                                                DropdownButtonHideUnderline(
                                                                    child:
                                                                        DropdownButton(
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down,
                                                                color:
                                                                    Colors.grey,
                                                                size:
                                                                    ScreenUtil(
                                                                  allowFontScaling:
                                                                      true,
                                                                ).setHeight(40),
                                                              ),
                                                              elevation: 0,
                                                              value:
                                                                  _currentFlag,
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
                                                            controller:
                                                                this._number,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            decoration:
                                                                InputDecoration(
                                                              focusedBorder: UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Colors.white)),
                                                              prefix: Text(
                                                                "$_currentCode",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              enabledBorder: UnderlineInputBorder(
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
                                                                      Radius.circular(
                                                                          10.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          10.0)),
                                                        ),
                                                        onPressed: () {
                                                          saveChanges();
                                                        },
                                                      ))
                                                ],
                                              ))));
                                });
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
                      '$nameProfile',
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
                        '$emailProfileset',
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
                        '$phoneProfileset',
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
                child: Image.network(
                  pictureProfileset,
                  height: 80.0,
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

  void editData() {
    print(loginCategory);
    if (loginCategory == "facebook") {
      var names = nameProfile.split(" ");

      print("First Name" + names[0]);
      //print("Last Name" + names[1]);
      _firstName.text = names[0];
      _lastName.text = names[1];
      _email.text = emailProfile;
      _number.text = phoneProfile;
    } else if (loginCategory == "custom") {
      var names = nameProfile.split(" ");
      print(names);
      print("First Name" + names[0]);
      print("Last Name" + names[1]);
      _firstName.text = names[0];
      _lastName.text = names[1];
      _email.text = emailProfile;
      _number.text = phoneProfile;
    }
  }

  void saveChanges() {
    shPref.setshared(_firstName.text + " " + _lastName.text, pictureProfile,
        _email.text, _number.text, loginCategory);
    profileName();
    profileImage();
    profileemail();
    profileNumber();
    loginCategorys();
    Navigator.pop(context);
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
