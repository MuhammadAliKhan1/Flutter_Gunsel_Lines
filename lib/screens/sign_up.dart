import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/screens/Drawer/drawer.dart';

final Color gunselColor = Color(0xff035EA7);

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpState();
  }
}

class SignUpState extends State<SignUp> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<DropdownMenuItem<AssetImage>> _dropDownMenuItems;
  AssetImage _currentFlag;
  String _currentCode = '';
  final _signUpForm = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _surename = TextEditingController();
  TextEditingController _number = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _repassword = TextEditingController();

  int value;
  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentFlag = _dropDownMenuItems[0].value;
    _currentCode = countryCode.keys
        .firstWhere((k) => countryCode[k] == _currentFlag, orElse: () => '');
    super.initState();
    this.value = 0;
  }

  bool switchValue = false;

  void switchButton(bool value) {
    setState(() {
      switchValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: scaffoldImg,
              fit: BoxFit.cover,
            ),
          ),
          height: double.infinity,
          width: double.infinity,
        ),
        Scaffold(
          key: _scaffoldKey,
          resizeToAvoidBottomPadding: false,
          drawer: SideDrawer(),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: GestureDetector(
                child: Image(
                  image: menuIcon,
                ),
                onTap: () {
                  _scaffoldKey.currentState.openDrawer();
                }),
            backgroundColor: Colors.transparent,
            title: Text("Registration",
                style: TextStyle(fontFamily: "SFProText", fontSize: 22.0)),
            elevation: 0.0,
            centerTitle: true,
          ),
          body: Form(
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
                                return "This field is required";
                              }
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 15.0),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "  Name",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                          )),

                      //Surname
                      Padding(
                          padding: EdgeInsets.only(
                              right: 10.0, left: 10.0, top: 10.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return "This field is required";
                              }
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 15.0),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "  Surname",
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
                                height: 50,
                                margin: EdgeInsets.only(
                                    left: 10.0, right: 10.0, top: 10.0),
                                padding: EdgeInsets.only(bottom: 7.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Colors.white),
                                child: TextFormField(
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "This field is required";
                                      }
                                    },
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 15.0),
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: "  $_currentCode",
                                    )),
                              )),
                        ],
                      ),

                      //Email
                      Padding(
                          padding: EdgeInsets.only(
                              right: 10.0, left: 10.0, top: 10.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return "This field is required";
                              }
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 15.0),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "  E-mail",
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
                                return "This field is required";
                              }
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 15.0),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "  Password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                          )),

                      //Re-password
                      Padding(
                          padding: EdgeInsets.only(
                              right: 10.0, left: 10.0, top: 10.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return "This field is required";
                              }
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 15.0),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "  Re-password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                          )),
                      Row(
                        children: <Widget>[
                          Switch(
                            activeColor: Colors.green,
                            value: switchValue,
                            onChanged: (bool value) {
                              switchButton(switchValue);
                            },
                          ),
                          Text(
                            "I read and agree with this agreement",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ])),
                Container(
                  width: 340.0,
                  margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                  child: RaisedButton(
                    child: Text(
                      "Sign Up",
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
                      setState(() {
                        if (_signUpForm.currentState.validate()) {
                          debugPrint("Signned Up");
                        }
                      });
                    },
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Back to login",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ))
                //
              ])),
        )
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
