import 'package:gunsel/widgets/button.dart';
import 'package:gunsel/widgets/scaffold.dart';
import 'package:gunsel/data/constants.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'package:gunsel/data/sharedPreference.dart';
import 'package:gunsel/data/edit_profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gunsel/data/facebookapimodel.dart';
import 'package:gunsel/data/googleapimodel.dart';
import 'package:flutter/services.dart';

import 'package:auto_size_text/auto_size_text.dart';

Map<int, dynamic> formsData;

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  SharePreferencelogin sh = SharePreferencelogin();
  String login = " Login";
  @override
  void initState() {
    loginAppbarlan();
    super.initState();
  }

  void loginAppbarlan() async {
    int b;
    int a = await sh.getshared1();

    setState(() {
      b = a;

      if (b == 0) {
        login = " Login";
      } else if (b == 1) {
        login = " Вхід";
      } else if (b == 2) {
        login = " Вход";
      } else if (b == 3) {
        login = "Wejście";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
        appBarIcon: menuIcon,
        appBarIncluded: true,
        backgroundImage: loginImgBG,
        appBarTitleIncluded: true,
        appBarTitle: login,
        drawerIncluded: true,
        appBarColor: gunselColor,
        bodyWidget: SingleChildScrollView(
            child: Center(
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
        ))));
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
//  final FocusNode _focusNode = FocusNode();
  SharePreferencelogin shPref = SharePreferencelogin();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();

  //String maintoken = "8D77D139A458087F5036B75FE5815ACB229A2326A7B39582321979F9BF709584B610778A1C0EC001B105A91E8AE0A85A1DE193B64074D64691C926614B9ABBB4975FB0197D9C0EF891158FE6124A668C34A514B187DF07F2255AF7B1B69ACD603F0872BFFC405C21A31FCD11A6609DA6FE63CFF2139C6F2D648E365FEEB05722F8D326000528D2CBAC6B321F4FA4BA47F4B0F901D3ECD44C4CDFE651B2B008125298F912E162A3ED9E8FB6FCA191C3D58219152A8466C035DADED9EEAD1938982C1C0EA648E4CE8CA4A5961C8DE732DFE3E5F699428249F35E3210A193052854DD2856121E960AFEC1FB90F7100C5A70FB7C2579D3F90420118C263E2A32666AECEC280F0CBEA7FF9B7D1117A1C1CC7488CF9CE6050551F43C733A9A9CC9F62F54F8316B4D1E7267381DA90157ABC215306F5E0F7D425D4CB7264D794BE44A592CBBE2B6CF5C00F8ED6A73F2FD91DBC67AD90C4326E3840F81E4B39BA2F83FF4";
  String maintoken = "";
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
  int index;
  String number123 = "";
  var phoneNumberFormatter = MaskTextInputFormatter(
    mask: '##)###-##-##',
  );

  Map userProfile;
  final facebookLogin = FacebookLogin();
  //SharePreferencelogin sh = SharePreferencelogin();
  String passwordHint = "Password",
      forgetPassword = "Forgot password?",
      dontHaveAccount = "Don't have an account?",
      signUp = " Sign up",
      emailHint = "Your email",
      btnSend = " Send",
      login = " Login",
      sendPassword = "Sending Password",
      noDatafound = " No data found",
      ok = " Ok",
      error = "Login Error",
      err = "Error",
      passworderr = "Password field should not be empty",
      logError = "Login Error",
      invalidData = "-UserId or Phone Number Required!";
  String enJson = "", uaJson = "", ruJson = "", plJson = "";

  @override
  void initState() {
    super.initState();
    _dropDownMenuItems = getDropDownMenuItems();
    _currentFlag = _dropDownMenuItems[0].value;
    _currentCode = countryCode.keys
        .firstWhere((k) => countryCode[k] == _currentFlag, orElse: () => '');

    _currentId = countryId.keys
        .firstWhere((k) => countryId[k] == _currentFlag, orElse: () => '');

    loginlan();
    publicToken();
    //ye code sara erase hoga
//    _focusNode.addListener(() {
//      number123 = this._number.text.trim();
//      if (this._number.text.length == 9) {
//        // The below code gives a range error if not 10.
//        RegExp phone = RegExp(r'(\d{2})(\d{3})(\d{2})(\d{2})');
//        var matches = phone.allMatches(_number.text);
//        var match = matches.elementAt(0);
//        var newText =
//            '${match.group(1)})${match.group(2)}-${match.group(3)}-${match.group(4)}';
//        number123 = this._number.text.trim();
//        this._number.text = newText;
//      }
//    });
  }

  void loginlan() async {
    enJson = await DefaultAssetBundle.of(context)
        .loadString("languagefiles/en-US.json");
    uaJson = await DefaultAssetBundle.of(context)
        .loadString("languagefiles/ua-UA.json");
    ruJson = await DefaultAssetBundle.of(context)
        .loadString("languagefiles/ru-RU.json");
    plJson = await DefaultAssetBundle.of(context)
        .loadString("languagefiles/pl-PL.json");

    Map<String, dynamic> enData = json.decode(enJson);
    Map<String, dynamic> uaData = json.decode(uaJson);
    Map<String, dynamic> ruData = json.decode(ruJson);
    Map<String, dynamic> plData = json.decode(plJson);

    int b;
    int a = await shPref.getshared1();

    setState(() {
      b = a;
      if (b == 0) {
        passwordHint = enData["password_holder"];
        forgetPassword = enData["forgot_password"];
        login = enData["login"];
        dontHaveAccount = "Don't have an account?";
        signUp = enData["sign_up"];
        emailHint = enData["email"];
        btnSend = enData["forgot_password_button"];
        sendPassword = "Sending Password";
        noDatafound = enData["no_data_found"];
        ok = enData["ok"];
        error = "Login Error";
        err = enData["error"];
        passworderr = "Password field should not be empty";
        logError = "Login Error";
        invalidData = "-UserId or Phone Number Required!";
      }
      if (b == 1) {
        passwordHint = uaData["password_holder"];
        forgetPassword = uaData["forgot_password"];
        login = uaData["login"];
        dontHaveAccount = "У вас немає облікового запису?";
        signUp = uaData["sign_up"];
        emailHint = uaData["email"];
        btnSend = uaData["forgot_password_button"];
        sendPassword = "Відправлення пароля";
        noDatafound = uaData["no_data_found"];
        ;
        ok = uaData["ok"];
        error = "Помилка входу";
        err = uaData["error"];
        passworderr = "Поле пароля не повинно бути порожнім";
        logError = "Помилка входу";
        invalidData = "-Використовується номер або номер телефону!";
      } else if (b == 2) {
        passwordHint = ruData["password_holder"];
        forgetPassword = ruData["forgot_password"];
        login = ruData["login"];
        dontHaveAccount = "У вас нет аккаунта?";
        signUp = ruData["sign_up"];
        emailHint = ruData["email"];
        btnSend = ruData["forgot_password_button"];
        sendPassword = "Отправка пароля";
        noDatafound = ruData["no_data_found"];
        ;
        ok = ruData["ok"];
        error = "Ошибка входа";
        err = ruData["error"];
        passworderr = "Поле пароля не должно быть пустым";
        logError = "Ошибка входа";
        invalidData = "-UserId или номер телефона требуется!";
      } else if (b == 3) {
        passwordHint = plData["password_holder"];
        forgetPassword = plData["forgot_password"];
        login = plData["login"];
        dontHaveAccount = "Nie masz konta?";
        signUp = plData["sign_up"];
        emailHint = plData["email"];
        btnSend = plData["forgot_password_button"];
        sendPassword = "Wysyłanie hasła";
        noDatafound = plData["no_data_found"];
        ok = plData["ok"];
        error = "Błąd logowania";
        err = plData["error"];
        passworderr = "Pole hasła nie powinno być puste";
        logError = "Błąd logowania";
        invalidData = "-UserId lub numer telefonu wymagany!";
      }
    });
  }

  void publicToken() async {
    maintoken = await shPref.gettokens();
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
                    onChanged: (number) {
                      if (number.length > 11) FocusScope.of(context).unfocus();
                      if (number.contains(')') || number.contains('-')) {
                        number = number.replaceAll(')', '');
                        number = number.replaceAll('-', '');
                      }
                      number123 = number.trim();
                    },
                    controller: this._number,
                    //yahan changes krni hain
                    inputFormatters: [phoneNumberFormatter],
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
                  hintText: passwordHint,
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
                          _emailForForgetPassword.text = "",
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
                                      hintText: emailHint,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0))),
                                )),
                            Container(
                                width: 300.0,
                                padding: EdgeInsets.only(top: 30.0),
                                child: RaisedButton(
                                  child: AutoSizeText(
                                    btnSend,
                                    maxLines: 1,
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
                forgetPassword,
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
                btnText: login,
                btnTextFontSize: 45,
                btnHeight: 45,
              ),
              GestureDetector(
                  child: Image(
                    image: googleLogo,
                  ),
                  onTap: () {
                    _signIn(context)
                        .then((FirebaseUser user) => print(user))
                        .catchError((e) => print(e));
                  }),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: 450,
          height: 60,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                dontHaveAccount,
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
                child: Container(
                    width: ScreenUtil().setWidth(250),
                    child: AutoSizeText(
                      signUp,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'SFProText',
                        color: Colors.yellow,
                      ),
                    )),
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

//ya function ha custom login
  void simpleLogin() async {
    // set up POST request arguments
    String url = 'https://api.gunsel.ua/Membership.svc/Login';
    Map<String, String> headers = {"token": maintoken};
    String emailSignins = _emailSignIn.text;
    String passwordSignins = _passwordSignIn.text;
    String numbers = _number.text;
    String imageUrl =
        "https://cdn1.imggmi.com/uploads/2019/10/12/9e27339c3b2b1f184aebaa2d6524b319-full.png";
    String loginCategory = "custom";

//    print("Email:" +
//        numbers +
//        " Password:" +
//        passwordSignins +
//        "Country:" +
//        _currentId);

    // make POST request

    //print("Numbers are:" + number123);

    if (!(number123 == "" || passwordSignins == "")) {
      String json =
          '{"PhoneNumber":"$number123","Password":"$passwordSignins","CountryId":"$_currentId"}';
      Response response = await post(url, headers: headers, body: json);

      // check the status code for the result
      int statusCode = response.statusCode;
      String body = response.body;
      // print("status code:" + statusCode.toString());
      //print("Body is:" + body);

      if (statusCode == 200) {
        Map<String, dynamic> apiDat = {
          'Data': jsonDecode(jsonDecode(response.body)['Data'])
        };
        print(apiDat);
        EditProfileModel editProfileModelObj =
            EditProfileModel.fromJson(apiDat);
        var editProfData = editProfileModelObj.toJson();

//      print("\nToken is:"+editProfData['Data']['Token']);
//      print("\nFirstName is:"+editProfData['Data']['FirstName']);
//      print("\nLastName is:"+editProfData['Data']['LastName']);
//
//      print("\nEmail is:"+editProfData['Data']['Email']);
//      print("\nPhone Number is:"+editProfData['Data']['PhoneNumber']);
//      print("\nCountry Id is:"+editProfData['Data']['CountryId']);

        shPref.setshared(
            editProfData['Data']['Token'],
            editProfData['Data']['FirstName'],
            editProfData['Data']['LastName'],
            imageUrl,
            editProfData['Data']['Email'],
            editProfData['Data']['PhoneNumber'],
            editProfData['Data']['CountryId'],
            loginCategory);

        Navigator.pushNamed(context, oneWayScreen);
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  err,
                ),
                content: Text(error),
                actions: <Widget>[
                  FlatButton(
                    child: Text(ok),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            });
      }
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                logError,
              ),
              content: Text(
                invalidData,
                style: TextStyle(fontSize: 14.0),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text(ok),
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
    final result = await facebookLogin.logIn(['email']);
    String loginCategory = "facebook";
    print(result.status.toString());
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        {
          final fbtoken = result.accessToken.token;
          print("Facebook token is:" + fbtoken);
          final graphResponse = await http.get(
              'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${fbtoken}');
          // set up POST request arguments
          String url =
              'https://api.gunsel.ua/Membership.svc/LoginWithFacebook';
          Map<String, String> headers = {"token": maintoken};
          String json =
              '{"Platform":30,"Language":0,"DeviceToken":null,"Token":"$fbtoken"}';

          // make POST request
          Response response = await post(url, headers: headers, body: json);
          // check the status code for the result
          int statusCode = response.statusCode;
          String body = response.body;
//          print("status code:"+statusCode.toString());
//          print("Body is:"+body);

          if (statusCode == 200) {
            Map<String, dynamic> fbapiData = {
              'Data': jsonDecode(jsonDecode(response.body)['Data'])
            };
            print(fbapiData);
            facebookApimodel fbprofilemodelobj =
                facebookApimodel.fromJson(fbapiData);
            var fbProfData = fbprofilemodelobj.toJson();

            print("Authenticated token is:" + fbProfData['Data']['Token']);
            print("First Name is:" + fbProfData['Data']['FirstName']);
            print("Last Name is:" + fbProfData['Data']['LastName']);
            print("Image is:" + fbProfData['Data']['ImageURL']);
            print("Email is:" + fbProfData['Data']['Email']);
            //  print("Phone Number is:"+fbProfData['Data']['FirstName']);

            if (fbProfData['Data']['PhoneNumber'] == null) {
              shPref.setshared(
                  fbProfData['Data']['Token'],
                  fbProfData['Data']['FirstName'],
                  fbProfData['Data']['LastName'],
                  fbProfData['Data']['ImageURL'],
                  fbProfData['Data']['Email'],
                  "",
                  fbProfData['Data']['CountryId'],
                  loginCategory);
              shPref.setmobileImage("");
            } else if (fbProfData['Data']['PhoneNumber'] != null) {
              shPref.setshared(
                  fbProfData['Data']['Token'],
                  fbProfData['Data']['FirstName'],
                  fbProfData['Data']['LastName'],
                  fbProfData['Data']['ImageURL'],
                  fbProfData['Data']['Email'],
                  fbProfData['Data']['PhoneNumber'],
                  fbProfData['Data']['CountryId'],
                  loginCategory);
              shPref.setmobileImage("");
            }
            Navigator.pushNamed(context, oneWayScreen);
          } else {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      error,
                    ),
                    // content: Text("Error in Facebook Login."),
                    actions: <Widget>[
                      FlatButton(
                        child: Text(ok),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  );
                });
          }

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
    String url = 'https://api.gunsel.ua/Membership.svc/ForgotPassword';
    Map<String, String> headers = {"token": maintoken};
    String emailForForgetPassword = _emailForForgetPassword.text;

    String json = '{"UserId":"$emailForForgetPassword"}';
    print("Email:" + emailForForgetPassword);
//    print("json is:"+json);
    // make POST request
    Response response = await post(url, headers: headers, body: json);

    // check the status code for the result
    int statusCode = response.statusCode;
    String body = response.body;
    print("status code:" + statusCode.toString());
    print("Body is:" + body);

    Map<String, dynamic> statusdata = jsonDecode(body.toString());
    print("Status data:" + statusdata['Status']['StatusText']);

    if (emailForForgetPassword != "") {
      if (statusCode == 200 && statusdata['Status']['StatusText'] == "OK") {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  sendPassword,
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text(ok),
                    onPressed: () {
                      Navigator.pop(context);
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
                  sendPassword,
                ),
                content: Text(noDatafound),
                actions: <Widget>[
                  FlatButton(
                    child: Text(noDatafound),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            });
      }
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(err),
              content: Text(passworderr),
              actions: <Widget>[
                FlatButton(
                  child: Text(ok),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          });
    }
  }

  //Login with google
  Future<FirebaseUser> _signIn(BuildContext context) async {
//    Scaffold.of(context).showSnackBar(new SnackBar(
//      content: new Text('Sign In'),
//    ));
    //debugPrint('-----------------Im here 1');
    //print('--------- ___f_____________________________$nane');

    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    //debugPrint('-----------------Im here 2');

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    //debugPrint('-----------------Im here 3');

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    String googleToken = googleAuth.accessToken;

//print("google token is:"+googleToken.toString());
    String url = 'https://api.gunsel.ua/Membership.svc/LoginWithGoogle';
    Map<String, String> headers = {"token": maintoken};
    String json =
        '{"Platform":30,"Language":0,"DeviceToken":null,"Token":"$googleToken"}';
    Response response = await post(url, headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
    String body = response.body;
    String loginCategory = "google";

    try {
      FirebaseUser user =
          (await _firebaseAuth.signInWithCredential(credential)).user;

//      print('User isbjhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh' +
//          user.toString());

      if (statusCode == 200) {
        Map<String, dynamic> gmapiData = {
          'Data': jsonDecode(jsonDecode(response.body)['Data'])
        };
        print(gmapiData);
        googleApimodel gmprofilemodelobj = googleApimodel.fromJson(gmapiData);
        var gmProfData = gmprofilemodelobj.toJson();

        print("Authenticated token is:" + gmProfData['Data']['Token']);
        print("First Name is:" + gmProfData['Data']['FirstName']);
        print("Last Name is:" + gmProfData['Data']['LastName']);
        print("Image is:" + gmProfData['Data']['ImageURL']);
        print("Email is:" + gmProfData['Data']['Email']);
        //  print("Phone Number is:"+fbProfData['Data']['FirstName']);

        //To check phone number empty or not
        if (gmProfData['Data']['PhoneNumber'] == null) {
          shPref.setshared(
              gmProfData['Data']['Token'],
              gmProfData['Data']['FirstName'],
              gmProfData['Data']['LastName'],
              gmProfData['Data']['ImageURL'],
              gmProfData['Data']['Email'],
              "",
              gmProfData['Data']['CountryId'],
              loginCategory);
          shPref.setmobileImage("");
        } else if (gmProfData['Data']['PhoneNumber'] != null) {
          shPref.setshared(
              gmProfData['Data']['Token'],
              gmProfData['Data']['FirstName'],
              gmProfData['Data']['LastName'],
              gmProfData['Data']['ImageURL'],
              gmProfData['Data']['Email'],
              gmProfData['Data']['PhoneNumber'],
              gmProfData['Data']['CountryId'],
              loginCategory);
          shPref.setmobileImage("");
        }
        Navigator.pushNamed(context, oneWayScreen);
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  error,
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text(ok),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            });
      }

      return user;
    } catch (e) {
      debugPrint(
          '-------------------______________________Firebase User Failed');
    }
  }
}
