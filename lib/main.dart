import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/data/routing.dart';
import 'package:flutter/services.dart';

main(List<String> args) {
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
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
