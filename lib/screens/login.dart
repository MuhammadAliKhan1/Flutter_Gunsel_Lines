import 'package:gunsel/widgets/button.dart';
import 'package:gunsel/widgets/scaffold.dart';
import 'package:gunsel/data/constants.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'package:gunsel/data/sharedPreference.dart';
import 'package:gunsel/data/edit_profile_model.dart';

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
                    height: 190,
                  ),
                  Image(
                    image: gunselLoginLogo,
                    height: 90,
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
  SharePreferencelogin shPref = SharePreferencelogin();

  String token =
      "8D77D139A458087F5036B75FE5815ACB229A2326A7B39582321979F9BF709584B610778A1C0EC001B105A91E8AE0A85A1DE193B64074D64691C926614B9ABBB4975FB0197D9C0EF891158FE6124A668C34A514B187DF07F2255AF7B1B69ACD603F0872BFFC405C21A31FCD11A6609DA6FE63CFF2139C6F2D648E365FEEB05722F8D326000528D2CBAC6B321F4FA4BA47F4B0F901D3ECD44C4CDFE651B2B008125298F912E162A3ED9E8FB6FCA191C3D58219152A8466C035DADED9EEAD1938982C1C0EA648E4CE8CA4A5961C8DE732DFE3E5F699428249F35E3210A193052854DD2856121E960AFEC1FB90F7100C5A70FB7C2579D3F90420118C263E2A32666AECEC280F0CBEA7FF9B7D1117A1C1CC7488CF9CE6050551F43C733A9A9CC9F62F54F8316B4D1E7267381DA90157ABC215306F5E0F7D425D4CB7264D794BE44A592CBBE2B6CF5C00F8ED6A73F2FD91DBC67AD90C4326E3840F81E4B39BA2F83FF4";
  final _oneWayForm = GlobalKey<FormState>();
  TextEditingController _number = TextEditingController();

  TextEditingController _emailSignIn = TextEditingController();
  TextEditingController _passwordSignIn = TextEditingController();

  TextEditingController _emailForForgetPassword = TextEditingController();

  List<DropdownMenuItem<AssetImage>> _dropDownMenuItems;
  AssetImage _currentFlag;
  String _currentCode = '';
  String _currentId = '';
  String data;

  Map userProfile;
  final facebookLogin = FacebookLogin();

  @override
  void initState() {
    super.initState();
    _dropDownMenuItems = getDropDownMenuItems();
    _currentFlag = _dropDownMenuItems[0].value;
    _currentCode = countryCode.keys
        .firstWhere((k) => countryCode[k] == _currentFlag, orElse: () => '');

    _currentId = countryId.keys
        .firstWhere((k) => countryId[k] == _currentFlag, orElse: () => '');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: <Widget>[
        SizedBox(
          height: 80,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Spacer(),
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
                Icon(Icons.phone, color: Colors.white, size: 35),
                Container(
                  width: 220,
                  height: 40,
                  child: TextFormField(
                    maxLength: 9,
                    controller: this._number,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.white),
                      contentPadding: EdgeInsets.all(7),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      prefix: Text(
                        "$_currentCode",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  //  child: TextFormField(
                  //   controller: this._emailSignIn,
                  //   keyboardType: TextInputType.emailAddress,
                  //   style: TextStyle(color: Colors.white, fontSize: 25),
                  //   decoration: InputDecoration(
                  //     hintStyle: TextStyle(color: Colors.white),
                  //     contentPadding: EdgeInsets.all(7),
                  //     enabledBorder: UnderlineInputBorder(
                  //       borderSide: BorderSide(color: Colors.white),
                  //     ),
                  //     prefix: Text(
                  //       "$_currentCode",
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 25,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                )
              ],
            )),
            Spacer()
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
              width: 350,
              height: 40,
              child: TextFormField(
                obscureText: true,
                controller: this._passwordSignIn,
                style: TextStyle(color: Colors.white, fontSize: 25),
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.white, fontSize: 25.0),
                  contentPadding: EdgeInsets.all(7),
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
          width: 360,
          child: GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        backgroundColor: gunselColor,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        title: Text(
                          "Forgot your password?",
                          style: TextStyle(
                              color: Colors.white, fontFamily: "MyriadPro"),
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
                                  keyboardType: TextInputType.emailAddress,
                                  controller: this._emailForForgetPassword,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 15.0, horizontal: 10.0),
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: "Your email",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0))),
                                )),
                            Container(
                                width: 300.0,
                                padding: EdgeInsets.only(top: 30.0),
                                child: RaisedButton(
                                  child: Text(
                                    "Send",
                                    style: TextStyle(
                                        color: gunselColor,
                                        fontFamily: "SFProText",
                                        fontSize: 20.0),
                                  ),
                                  highlightColor: Colors.yellow,
                                  color: Colors.yellow,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topLeft: Radius.circular(10))),
                                  onPressed: () {
                                    setState(() {
                                      //TODO: Send mail button
                                      debugPrint("Send button is pressed");
                                      forgotPassword();
                                    });
                                  },
                                ))
                          ],
                        ));
                  });
            },
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 60,
          width: 450,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                  child: Image(
                    image: facebookLogo,
                  ),
                  onTap: () {
                    _loginWithFB();
                  }),
              GunselButton(
                btnWidth: 320,
                whenPressed: () {
                  simpleLogin();
                },
                btnFontFamily: 'SFProText',
                textWeight: FontWeight.w500,
                btnText: 'Sign In',
                btnTextFontSize: 45,
                btnHeight: 45,
              ),
              Image(
                image: googleLogo,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
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
                  fontFamily: 'SFProText',
                  color: Color.fromRGBO(196, 193, 193, 10),
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
                    fontFamily: 'SFProText',
                    color: Colors.yellow,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ));
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

        _currentId = countryId.keys
            .firstWhere((j) => countryId[j] == selectedFlag, orElse: () => '');
      },
    );
  }

//ya function ha
  void simpleLogin() async {
    // set up POST request arguments
    String url = 'https://test-api.gunsel.ua/Membership.svc/Login';
    Map<String, String> headers = {"token": token};
    String emailSignins = _emailSignIn.text;
    String passwordSignins = _passwordSignIn.text;
    String numbers = _number.text;

    String json =
        '{"PhoneNumber":"$numbers","Password":"$passwordSignins","CountryId":"$_currentId"}';
    print("Email:" +
        numbers +
        " Password:" +
        passwordSignins +
        "Country:" +
        _currentId);

    // make POST request
    Response response = await post(url, headers: headers, body: json);
    Map<String, dynamic> apiDat = {
      'Data': jsonDecode(jsonDecode(response.body)['Data'])
    };
    print(apiDat);
    EditProfileModel editProfileModelObj = EditProfileModel.fromJson(apiDat);
    var editProfData = editProfileModelObj.toJson();
    print(editProfData['Data']['FirstName']);
    print(editProfData['Data']['LastName']);
    print(editProfData['Data']['Email']);
    print(editProfData['Data']['PhoneNumber']);
    print(editProfData['Data']['CountryId']);

    shPref.setshared(
        editProfData['Data']['FirstName'] +
            " " +
            editProfData['Data']['LastName'],
        "",
        editProfData['Data']['Email'],
        editProfData['Data']['PhoneNumber'],
        "custom");

    // check the status code for the result
    int statusCode = response.statusCode;
    String body = response.body;
    // print("status code:" + statusCode.toString());
    //print("Body is:" + body);

    if (statusCode == 200) {
      Navigator.pushNamed(context, oneWayScreen);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                "Error",
              ),
              content: Text("Invalid Username or Password"),
              actions: <Widget>[
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          });
    }
  }

//Login With Facebook

  _loginWithFB() async {
    final result = await facebookLogin.logInWithReadPermissions(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        {
          final token = result.accessToken.token;
          final graphResponse = await http.get(
              'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
          final profile = JSON.jsonDecode(graphResponse.body);
          print("\nProfile is: " + profile.toString());
          print("Image url is:" + profile["picture"]["data"]["url"]);
          print("Name is:" + profile["name"]);

          shPref.setshared(profile["name"], profile["picture"]["data"]["url"],
              "", "", "facebook");

          // print("Email is:" + profile["email"]);
          // setState(() {
          //   userProfile = profile;
          //   _isLoggedIn = true;
          // });

          Navigator.pushNamed(context, oneWayScreen);

          break;
        }
      case FacebookLoginStatus.cancelledByUser:
        print("error");
        break;
      case FacebookLoginStatus.error:
        print("error");
        break;
    }
  }

  void forgotPassword() async {
    // set up POST request arguments
    String url = 'https://test-api.gunsel.ua/Membership.svc/ForgotPassword';
    Map<String, String> headers = {"token": token};
    String emailForForgetPassword = _emailForForgetPassword.text;

    String json = '{"UserId":"$emailForForgetPassword"}';
    print("Email:" + emailForForgetPassword);

    // make POST request
    Response response = await post(url, headers: headers, body: json);

    // check the status code for the result
    int statusCode = response.statusCode;
    String body = response.body;
    print("status code:" + statusCode.toString());
    print("Body is:" + body);

    Map<String, dynamic> statusdata = jsonDecode(body.toString());
    // print("Status data:" + statusdata["Status"][]);

    if (statusCode == 200) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                "Sending password",
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                "Error",
              ),
              content: Text("Something is wrong."),
              actions: <Widget>[
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          });
    }
  }
}
