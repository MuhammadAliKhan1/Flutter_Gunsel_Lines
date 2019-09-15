import 'package:gunsel/widgets/button.dart';
import 'package:gunsel/widgets/scaffold.dart';
import 'package:gunsel/data/constants.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
      appBarIcon: menuIcon,
      appBarIncluded: true,
      backgroundImage: loginImgBG,
      appBarTitleIncluded: true,
      appBarTitle: 'Login',
      drawerIncluded: true,
      bodyWidget: SingleChildScrollView(child: LoginScreen()),
      appBarColor: gunselColor,
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: FittedBox(
      alignment: Alignment.center,
      child: Center(
        child: Container(
          height: 740,
          width: 505,
          child: Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  Image(
                    image: gunselLoginLogo,
                    height: 80,
                  ),
                  LoginForm(),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _oneWayForm = GlobalKey<FormState>();
  TextEditingController _number = TextEditingController();
  TextEditingController _password = TextEditingController();
  List<DropdownMenuItem<AssetImage>> _dropDownMenuItems;
  AssetImage _currentFlag;
  String _currentCode = '';
  String data;

  @override
  void initState() {
    super.initState();
    _dropDownMenuItems = getDropDownMenuItems();
    _currentFlag = _dropDownMenuItems[0].value;
    _currentCode = countryCode.keys.firstWhere(
      (k) => countryCode[k] == _currentFlag,
      orElse: () => '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ButtonTheme(
              alignedDropdown: true,
              splashColor: Colors.transparent,
              buttonColor: Colors.transparent,
              height: 50,
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                  elevation: 0,
                  value: _currentFlag,
                  items: _dropDownMenuItems,
                  onChanged: changedDropDownItem,
                ),
              ),
            ),
            Container(
                child: Row(
              children: <Widget>[
                Icon(Icons.phone, color: Colors.white, size: 30),
                Container(
                  width: 250,
                  height: 40,
                  child: TextFormField(
                    controller: this._number,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white, fontSize: 23),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      prefix: Text(
                        "$_currentCode  ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: passwordIcon,
              height: 30,
            ),
            Container(
              width: 300,
              height: 40,
              child: TextFormField(
                obscureText: true,
                controller: this._password,
                style: TextStyle(color: Colors.white, fontSize: 23),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        )),
        Container(
          height: 40,
          width: 325,
          child: InkWell(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot your password?',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          height: 60,
          width: 450,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image(
                image: facebookLogo,
              ),
              GunselButton(
                btnWidth: 320,
                whenPressed: () {},
                btnFontFamily: 'MyriadPro',
                textWeight: FontWeight.w700,
                btnText: 'Sign In',
                btnTextFontSize: 40,
                btnHeight: 45,
              ),
              Image(
                image: googleLogo,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: 400,
          height: 60,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Don't have an account?",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'MyriadPro',
                  color: Colors.white,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    signUpScreen,
                  );
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'MyriadPro',
                    color: Colors.yellow,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  List<DropdownMenuItem<AssetImage>> getDropDownMenuItems() {
    List<DropdownMenuItem<AssetImage>> items = new List();
    for (AssetImage flag in countryCode.values) {
      // here we are creating the drop down menu items, you can customize the item right here
      // but I'll just use a simple text for this
      items.add(
        DropdownMenuItem(
          value: flag,
          child: new Image(
            image: flag,
            height: 30,
          ),
        ),
      );
    }
    return items;
  }

  void changedDropDownItem(AssetImage selectedFlag) {
    setState(
      () {
        _currentFlag = selectedFlag;
        _currentCode = countryCode.keys.firstWhere(
          (k) => countryCode[k] == selectedFlag,
          orElse: () => '',
        );
      },
    );
  }
}

/* import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/data/facebook_login.dart';
import 'package:gunsel/widgets/button.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
      appBarIcon: menuIcon,
      appBarIncluded: true,
      backgroundImage: loginImgBG,
      bodyWidget: SingleChildScrollView(
        padding: EdgeInsets.only(top: ScreenUtil().setHeight(250)),
        child: LoginForm(),
      ),
      drawerIncluded: true,
      appBarTitleIncluded: true,
      appBarTitle: 'Login',
      appBarColor: gunselColor,
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  List<DropdownMenuItem<AssetImage>> _dropDownMenuItems;
  AssetImage _currentFlag;
  String _currentCode = '';
  String data;

  Future<String> getData() async {
    http.Response response = await http.get(
      Uri.encodeFull(facebookAPI),
      headers: {
        'Accept': 'application/json',
      },
    );
    this.setState(
      () => data = response.body,
    );

    print(data);
  }

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
      child: Container(
        height: ScreenUtil().setHeight(500),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Image.asset(
                  "assets/logo_light.png",
                  width: ScreenUtil().setWidth(400),
                ),
                padding: EdgeInsets.only(bottom: 50.0),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                 Container(
                    child: Theme(
                      data: ThemeData(
                        canvasColor: Colors.transparent,
                      ),
                      child: ButtonTheme(
                        alignedDropdown: true,
                        splashColor: Colors.transparent,
                        buttonColor: Colors.transparent,
                        child: DropdownButton(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ),
                          elevation: 0,
                          value: _currentFlag,
                          items: _dropDownMenuItems,
                          onChanged: changedDropDownItem,
                        ),
                      ),
                    ),
                  ),
                  Container(
                      child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      Container(
                        width: ScreenUtil().setWidth(300),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil(
                              allowFontScaling: true,
                            ).setSp(30),
                          ),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            prefix: Text(
                              "$_currentCode  ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ScreenUtil(
                                    allowFontScaling: true,
                                  ).setSp(30)),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
                ],
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.vpn_key,
                      color: Colors.white,
                    ),
                    Container(
                      width: ScreenUtil().setWidth(450),
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil(
                            allowFontScaling: true,
                          ).setSp(30),
                        ),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        obscureText: true,
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.lerp(
                    Alignment.centerLeft, Alignment.centerRight, 0.85),
                child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                backgroundColor: gunselColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                title: Text(
                                  "Forgot your password?",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Container(
                                        padding: EdgeInsets.only(top: 10.0),
                                        child: TextFormField(
                                          validator: (String value) {
                                            if (value.isEmpty) {
                                              return "Please enter your email";
                                            }
                                          },
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                              fillColor: Colors.white,
                                              filled: true,
                                              hintText: "Your email",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0))),
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(top: 30.0),
                                        child: RaisedButton(
                                          child: Text(
                                            "Send",
                                            textScaleFactor: 1.5,
                                            style:
                                                TextStyle(color: gunselColor),
                                          ),
                                          highlightColor: Colors.yellow,
                                          color: Colors.yellow,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(10.0),
                                                  topLeft:
                                                      Radius.circular(10.0))),
                                          onPressed: () {
                                            setState(() {
                                              //TODO: Send mail button
                                              debugPrint(
                                                  "Send button is pressed");
                                            });
                                          },
                                        ))
                                  ],
                                ));
                          });
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(25),
                        color: Colors.blue,
                      ),
                      textAlign: TextAlign.center,
                    )),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image(
                    image: facebookLogo,
                    height: ScreenUtil().setHeight(60),
                    color: Colors.white,
                  ),
                  GunselButton(
                    btnText: 'Sign In',
                    btnTextFontSize: 30,
                    btnWidth: 200,
                    whenPressed: () {},
                  ),
                  Image(
                    height: ScreenUtil().setHeight(60),
                    color: Colors.white,
                    image: googleLogo,
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have a account?          ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil(allowFontScaling: true).setSp(25)),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, signUpScreen);
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize:
                              ScreenUtil(allowFontScaling: true).setSp(30),
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
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
            height: ScreenUtil().setHeight(45),
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
 */
