import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/data/routing.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

Future main(List<String> args) async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Router().generateRoute,
      initialRoute: splashScreen,
      theme: ThemeData(
        primaryColor: gunselColor,
        accentColor: gunselColor,
      ),
    ),
  );
}
