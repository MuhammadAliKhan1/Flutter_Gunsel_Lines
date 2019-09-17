import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/data/routing.dart';

Future main(List<String> args) async {
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
