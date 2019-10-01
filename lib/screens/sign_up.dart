import 'package:flutter/material.dart';
import 'dart:core';
import 'package:gunsel/data/constants.dart';
import 'package:flutter/services.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart';
import 'package:gunsel/data/sharedPreference.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpState();
  }
}

class SignUpState extends State<SignUp> {
  SharePreferencelogin sh = SharePreferencelogin();
  String nameHint = "Name",
      surNameHint = "Surename",
      emailHint = "E-mail",
      passwordHint = "Password",
      rePasswordHint = "Re-password",
      agreementText = "I read and agree with this agreement",
      signUp = "Sign Up",
      backToLogin = "Back to login",
      passwordValidation = "Password and repassword does not match",
      error = "Error",
      oktext = "Ok",
      requiredField = "This field is required",
      emailInvalid = "Email is invalid",
      correctData = "Enter correct data",
      acceptAgreement = "You need to accept this agreement",
      signUpR = "Registration";

  void signUplan() async {
    int b;
    int a = await sh.getshared1();

    setState(() {
      b = a;
      if (b == 1) {
        signUpR = "Реєстрація";
        nameHint = "Ім'я";
        surNameHint = "Прізвище";
        emailHint = "Електронна пошта";
        passwordHint = "Пароль";
        rePasswordHint = "Повторний пароль";
        agreementText = "Я читаю і погоджуюся з цією угодою";
        signUp = "Зареєструйтесь";
        backToLogin = "Назад до входу";
        passwordValidation = "Пароль і повторне слово не збігаються";
        error = "Помилка";
        oktext = "гаразд";
        requiredField = "Це поле є обов'язковим";
        emailInvalid = "Електронна пошта недійсна";
        correctData = "Введіть правильні дані";
        acceptAgreement = "Вам потрібно прийняти цю угоду";
      } else if (b == 2) {
        signUpR = "Registration";
        nameHint = "Name";
        surNameHint = "Surname";
        emailHint = "E-mail";
        passwordHint = "Password";
        rePasswordHint = "Re-password";
        agreementText = "I read and agree with this agreement";
        signUp = "Sign Up";
        backToLogin = "Back to login";
        passwordValidation = "Password and repassword does not match";
        error = "Error";
        oktext = "Ok";
        requiredField = "This field is required";
        emailInvalid = "Email is invalid";
        correctData = "Enter correct data";
        acceptAgreement = "You need to accept this agreement";
      } else if (b == 3) {
        signUpR = "Регистрация";
        nameHint = "имя";
        surNameHint = "Фамилия";
        emailHint = "Эл. почта";
        passwordHint = "пароль";
        rePasswordHint = "Re-пароль";
        agreementText = "Я прочитал и согласен с этим соглашением";
        signUp = "Зарегистрироваться";
        backToLogin = "Вернуться на страницу входа";
        passwordValidation = "Пароль и пароль не совпадают";
        error = "ошибка";
        oktext = "Хорошо";
        requiredField = "Это поле обязательно к заполнению";
        emailInvalid = "адрес электронной почты недействителен";
        correctData = "Введите правильные данные";
        acceptAgreement = "Вы должны принять это соглашение";
      }
    });
  }

  String token =
      "8D77D139A458087F5036B75FE5815ACB229A2326A7B39582321979F9BF709584B610778A1C0EC001B105A91E8AE0A85A1DE193B64074D64691C926614B9ABBB4975FB0197D9C0EF891158FE6124A668C34A514B187DF07F2255AF7B1B69ACD603F0872BFFC405C21A31FCD11A6609DA6FE63CFF2139C6F2D648E365FEEB05722F8D326000528D2CBAC6B321F4FA4BA47F4B0F901D3ECD44C4CDFE651B2B008125298F912E162A3ED9E8FB6FCA191C3D58219152A8466C035DADED9EEAD1938982C1C0EA648E4CE8CA4A5961C8DE732DFE3E5F699428249F35E3210A193052854DD2856121E960AFEC1FB90F7100C5A70FB7C2579D3F90420118C263E2A32666AECEC280F0CBEA7FF9B7D1117A1C1CC7488CF9CE6050551F43C733A9A9CC9F62F54F8316B4D1E7267381DA90157ABC215306F5E0F7D425D4CB7264D794BE44A592CBBE2B6CF5C00F8ED6A73F2FD91DBC67AD90C4326E3840F81E4B39BA2F83FF4";

  List<DropdownMenuItem<AssetImage>> _dropDownMenuItems;
  AssetImage _currentFlag;
  String _currentCode = '';
  String _currentId = '';
  String selectedCountryId;
  final _signUpForm = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _surname = TextEditingController();
  TextEditingController _number = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _repassword = TextEditingController();

  int value;
  @override
  void initState() {
    signUplan();
    _dropDownMenuItems = getDropDownMenuItems();
    _currentFlag = _dropDownMenuItems[0].value;
    _currentCode = countryCode.keys
        .firstWhere((k) => countryCode[k] == _currentFlag, orElse: () => '');

    _currentId = countryId.keys
        .firstWhere((k) => countryId[k] == _currentFlag, orElse: () => '');

    super.initState();
    this.value = 0;
  }

  bool switchValue = false;
  bool switchOnoff = false;

  void switchButton(bool value) {
    setState(() {
      switchValue = value;
      print("Switch Value is:" + switchValue.toString());
      signSwitched();
    });
  }

  void signSwitched() {
    setState(() {
      switchOnoff = switchValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
      appBarIcon: menuIcon,
      appBarIncluded: true,
      appBarTitle: signUpR,
      appBarTitleIncluded: true,
      drawerIncluded: true,
      backgroundImage: scaffoldImg,
      bodyWidget: SingleChildScrollView(
          child: Form(
              key: _signUpForm,
              child: Column(children: <Widget>[
                Container(
                    height: ScreenUtil().setHeight(850),
                    margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListView(children: <Widget>[
                      //Name
                      Padding(
                          padding: EdgeInsets.only(
                              right: 10.0, left: 10.0, top: 10.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return requiredField;
                              }
                            },
                            controller: this._name,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                errorStyle: TextStyle(color: Colors.white),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 10),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: nameHint,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                          )),

                      //Surname
                      Padding(
                          padding: EdgeInsets.only(
                              right: 10.0, left: 10.0, top: 10.0),
                          child: TextFormField(
                            controller: this._surname,
                            validator: (value) {
                              if (value.isEmpty) {
                                return requiredField;
                              }
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                errorStyle: TextStyle(color: Colors.white),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 10.0),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: surNameHint,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                          )),
                      Row(
                        children: <Widget>[
                          Expanded(
                              flex: 2,
                              child: Container(
                                margin: EdgeInsets.only(top: 10.0, left: 10.0),
                                padding: EdgeInsets.only(left: 10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.white,
                                ),
                                child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.grey,
                                    size: ScreenUtil(
                                      allowFontScaling: true,
                                    ).setHeight(42),
                                  ),
                                  elevation: 0,
                                  value: _currentFlag,
                                  items: _dropDownMenuItems,
                                  onChanged: changedDropDownItem,
                                )),
                              )),
                          Expanded(
                              flex: 6,
                              child: Container(
                                height: 48,
                                margin: EdgeInsets.only(
                                    left: 10.0, right: 10.0, top: 10.0),
                                padding: EdgeInsets.only(
                                  bottom: 7.0,
                                  left: 5.0,
                                  right: 5.0,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Colors.white),
                                child: TextFormField(
                                    controller: this._number,
                                    keyboardType: TextInputType.phone,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(9)
                                    ],
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 15.0),
                                      fillColor: Colors.white,
                                      filled: true,
                                      prefix: Text(
                                        "$_currentCode",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    )),
                              )),
                        ],
                      ),
                      //Email
                      Padding(
                          padding: EdgeInsets.only(
                              right: 10.0, left: 10.0, top: 10.0),
                          child: TextFormField(
                            controller: this._email,
                            validator: (value) {
                              final bool isValid =
                                  EmailValidator.validate(value);
                              if (isValid == false) {
                                return emailInvalid;
                              }
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                errorStyle: TextStyle(color: Colors.white),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 10.0),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: emailHint,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                          )),

                      //Password
                      Padding(
                          padding: EdgeInsets.only(
                              right: 10.0, left: 10.0, top: 10.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return requiredField;
                              }
                            },
                            keyboardType: TextInputType.text,
                            controller: _password,
                            obscureText: true,
                            decoration: InputDecoration(
                                errorStyle: TextStyle(color: Colors.white),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 10.0),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: passwordHint,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                          )),

                      //Re-password
                      Padding(
                          padding: EdgeInsets.only(
                              right: 10.0, left: 10.0, top: 10.0),
                          child: TextFormField(
                            controller: _repassword,
                            validator: (value) {
                              if (value.isEmpty) {
                                return requiredField;
                              }
                            },
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                errorStyle: TextStyle(color: Colors.white),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 10.0),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: rePasswordHint,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                          )),
                      Row(
                        children: <Widget>[
                          Switch(
                            activeColor: Colors.green,
                            value: switchValue,
                            onChanged: (bool value) {
                              switchButton(value);
                            },
                          ),
                          Text(
                            agreementText,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),

                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 60.0),
                            child: switchOnoff
                                ? Text("")
                                : Text(
                                    acceptAgreement,
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 15.0),
                                  ),
                          ),
                        ],
                      ),
                    ])),
                Container(
                  width: 340.0,
                  margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                  child: RaisedButton(
                      child: Text(
                        signUp,
                        style: TextStyle(
                            color: gunselColor,
                            fontSize: 20.0,
                            fontFamily: "SFProText",
                            fontWeight: FontWeight.w600),
                      ),
                      highlightColor: Colors.yellow,
                      color: Colors.yellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0)),
                      ),
                      onPressed: () {
                        //_makePostRequest();

                        if (_password == _repassword) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    error,
                                  ),
                                  content: Text(passwordValidation),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text(oktext),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                                );
                              });
                          if (_signUpForm.currentState.validate()) {}
                        } else {
                          _makePostRequest();
                        }
                      }),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      backToLogin,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ))
                //
              ]))),
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

      _currentId = countryId.keys
          .firstWhere((j) => countryId[j] == selectedFlag, orElse: () => '');
      this.selectedCountryId = _currentId;
    });
  }

  _makePostRequest() async {
    if (switchOnoff == true) {
      // set up POST request arguments
      String url = 'https://test-api.gunsel.ua/Membership.svc/SignUp';
      Map<String, String> headers = {"token": token};
      String emails = _email.text;
      String numbers = _number.text;
      String passwords = _password.text;
      String names = _name.text;
      String surnames = _surname.text;

      String json =
          '{"Platform":34,"Language":0,"DeviceToken":null,"UserId":"$emails","FirstName":"$names","MiddleName":"","LastName":"$surnames","PhoneNumber":"$numbers","BirthDate":null,"Gender":"","Password":"$passwords","CountryId": "$_currentId"}';
      print("${_currentId}");

      // make POST request
      Response response = await post(url, headers: headers, body: json);

      // check the status code for the result
      int statusCode = response.statusCode;
      String body = response.body;
      print("status code:" + statusCode.toString());
      print("Body is:" + body);

      if (statusCode == 200) {
        Navigator.pushNamed(context, oneWayScreen);
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  error,
                ),
                content: Text(correctData),
                actions: <Widget>[
                  FlatButton(
                    child: Text(oktext),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            });
      }
    } else if (switchOnoff == false) {
      signSwitched();
    }
  }
}
