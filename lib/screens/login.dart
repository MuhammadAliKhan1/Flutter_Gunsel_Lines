import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/data/facebook_login.dart';
import 'package:gunsel/widgets/button.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
      appBarIncluded: true,
      backgroundImage: loginImgBG,
      bodyWidget: SingleChildScrollView(
        padding: EdgeInsets.only(top: 50.0),
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: ScreenUtil().setWidth(130),
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
                            size: ScreenUtil(
                              allowFontScaling: true,
                            ).setHeight(45),
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
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(25),
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                ),
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
