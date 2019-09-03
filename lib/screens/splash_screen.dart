import 'dart:async';
import 'package:flutter/material.dart';

class GunselSplash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GunselSplashState();
}

class _GunselSplashState extends State<GunselSplash> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, 'OneWayScreen'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image(
          image: AssetImage("images/logo.jpeg"),
          fit: BoxFit.cover,
        ),
      ],
    ));
  }
}
