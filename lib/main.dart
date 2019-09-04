import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/data/routing.dart';

void main(List<String> args) => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Router().generateRoute,
        initialRoute: splashScreen,
      ),
    );
