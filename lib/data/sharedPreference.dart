import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePreferencelogin {
  Future<bool> setshared(String name1, String picture1, String email1,
      String phone1, String loginCategory1) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("name", name1);
    prefs.setString("picture", picture1);
    prefs.setString("email", email1);
    prefs.setString("phone", phone1);
    // print("phone is" + name1);
    prefs.setString("loginCategory", loginCategory1);

    // print("Facebook is:" + loginCategory1);
  }

  Future<String> getname() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("name");
  }

  Future<String> getpicture() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("picture");
  }

  Future<String> getemail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("email");
  }

  Future<String> getphone() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("phone");
  }

  Future<String> getLoginCategory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("loginCategory");
  }
}
