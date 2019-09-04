import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:gunsel/screens/Drawer/drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gunsel/screens/sign_up.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final Color gunselColor = Color(0xff035EA7);
  final Color forgotPasswordColor = Color(0xff5AB9E2);
  final String fbSVGPath = 'assets/facebook.svg';
  final String googleSVGPath = 'assets/google.svg';
  @override
  Widget build(BuildContext context) {
    final Widget fbSVG = SvgPicture.asset(
      fbSVGPath,
      color: Colors.white,
      height: 40,
      width: 40,
    );
    final Widget googleSVG = SvgPicture.asset(
      googleSVGPath,
      color: Colors.white,
      height: 40,
      width: 40,
    );
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        backgroundColor: gunselColor,
        title: Text("Login"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage("images/logo.jpeg"),
            fit: BoxFit.cover,
            color: Colors.black38,
            colorBlendMode: BlendMode.darken,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CountryCodePicker(
                      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                      initialSelection: 'IT',
                      // optional. Shows only country name and flag
                      showCountryOnly: true,
                      // optional. aligns the flag and the Text left
                      alignLeft: false,
                      showFlag: true,
                    ),
                    Flexible(
                      child: TextFormField(
                          autofocus: false,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              icon: Icon(
                            Icons.phone,
                            color: Colors.white,
                          )),
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          icon: Icon(
                            Icons.vpn_key,
                            color: Colors.white,
                          ),
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.white54)),
                      style: Theme.of(context).textTheme.body1,
                      obscureText: true,
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Align(
                      alignment: Alignment.centerRight,
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
                                              padding:
                                                  EdgeInsets.only(top: 10.0),
                                              child: TextFormField(
                                                validator: (String value) {
                                                  if (value.isEmpty) {
                                                    return "Please enter your email";
                                                  }
                                                },
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                    fillColor: Colors.white,
                                                    filled: true,
                                                    hintText: "Your email",
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    5.0))),
                                              )),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(top: 30.0),
                                              child: RaisedButton(
                                                child: Text(
                                                  "Send",
                                                  textScaleFactor: 1.5,
                                                  style: TextStyle(
                                                      color: gunselColor),
                                                ),
                                                highlightColor: Colors.yellow,
                                                color: Colors.yellow,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10.0),
                                                          topLeft:
                                                              Radius.circular(
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
                                      ));
                                });
                          },
                          child: Text(
                            "Forgot Password?",
                            textScaleFactor: 1.2,
                            style: TextStyle(color: forgotPasswordColor),
                          )),
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      fbSVG,
                      Container(
                        child: ButtonTheme(
                            buttonColor: Colors.yellow,
                            minWidth: 150.0,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              )),
                              child: Text("Sign In",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18.0)),
                              elevation: 3.0,
                              onPressed: () {},
                            )),
                      ),
                      googleSVG,
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.white70, fontSize: 15.0),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUp()),
                            );
                          },
                          child: Text("Sign up",
                              style: TextStyle(
                                  color: Colors.yellow, fontSize: 17.0))),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
