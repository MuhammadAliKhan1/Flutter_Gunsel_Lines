import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class SharePreferencelogin {
  //For logins data sharedpreference start
  Future<bool> setshared(
      String token1,
      String firstName1,
      String lastName1,
      String picture1,
      String email1,
      String phone1,
      String countryId1,
      String loginCategory1) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("Token", token1);
    prefs.setString("firstname", firstName1);
    prefs.setString("lastname", lastName1);
    prefs.setString("picture", picture1);
    prefs.setString("email", email1);
    prefs.setString("phone", phone1);
    prefs.setString("countryId", countryId1);
    prefs.setString("loginCategory", loginCategory1);
  }

  Future<String> gettokens() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("Token");
  }

  Future<String> getfirstname() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("firstname");
  }

  Future<String> getlastname() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("lastname");
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

  Future<String> getcountryId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("countryId");
  }

  Future<String> getloginCategory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("loginCategory");
  }

  //For logins data sharedpreference end

  //For language change

  Future<bool> setshared1(int num) async {
    final SharedPreferences prefla = await SharedPreferences.getInstance();

    prefla.setInt("languageIndicator", num);
  }

  Future<int> getshared1() async {
    final SharedPreferences prefla = await SharedPreferences.getInstance();
    return prefla.getInt("languageIndicator");
  }
}
