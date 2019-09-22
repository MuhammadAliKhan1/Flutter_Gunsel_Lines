// class FacebookLogin {
//   String token;
//   String language;

//   FacebookLogin({this.token, this.language});

//   factory FacebookLogin.fromJson(Map<String, dynamic> json) {
//     return FacebookLogin(
//       token: json['Token'],
//       language: json['Language'],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  //bool _isLoggedIn = false;
  Map userProfile;
  final facebookLogin = FacebookLogin();

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
          print("Email is:" + profile["email"]);
          // setState(() {
          //   userProfile = profile;
          //   _isLoggedIn = true;
          // });
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

  // _logout() {
  //   facebookLogin.logOut();
  //   setState(() {
  //   //  _isLoggedIn = false;
  //   });
  //}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
          body:
              //Center(
              //     child: _isLoggedIn
              //         ? Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: <Widget>[
              //               Image.network(
              //                 userProfile["picture"]["data"]["url"],
              //                 height: 50.0,
              //                 width: 50.0,
              //               ),
              //               Text(userProfile["name"]),
              //               OutlineButton(
              //                 child: Text("Logout"),
              //                 onPressed: () {
              //                   _logout();
              //                 },
              //               )
              //             ],
              //           )
              Center(
        child: OutlineButton(
          child: Text("Login with Facebook"),
          onPressed: () {
            _loginWithFB();
          },
        ),
      )),
    );
  }
}
