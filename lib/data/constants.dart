import 'package:flutter/widgets.dart';
export 'package:flutter/material.dart';
export 'package:gunsel/widgets/scaffold.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'dart:async';
export 'dart:convert';
export 'package:gunsel/data/publictoken_model.dart';
export 'package:gunsel/data/stationlist_model.dart';
export 'package:gunsel/data/data_model.dart';
export 'package:shared_preferences/shared_preferences.dart';

const int defaultScreenWidth = 640;
const int defaultScreenHeight = 1136;
//Images
const AssetImage splashImg = AssetImage("assets/splash_image.jpeg");
const AssetImage loginImgBG = AssetImage("assets/loginBG.jpg");
const AssetImage scaffoldImg = AssetImage("assets/BG.jpg");
const AssetImage drawerAccountHeaderImg =
    AssetImage('assets/DrawerImage/DrawerBG.png');
const AssetImage drawerlogoutImg = AssetImage('assets/logout.png');
const AssetImage userImg = AssetImage('assets/user.png');
const AssetImage polandFlag = AssetImage('assets/poland.png');
const AssetImage czechFlag = AssetImage('assets/czech.png');
const AssetImage ukraineFlag = AssetImage('assets/ukraine.png');
const AssetImage googleLogo = AssetImage('assets/google.png');
const AssetImage facebookLogo = AssetImage('assets/facebook.png');
const AssetImage whiteImage = AssetImage('assets/white.jpg');
const AssetImage profileBG = AssetImage('assets/profileBG.png');
const AssetImage place = AssetImage('assets/profileBG.png');
const AssetImage profileHolder = AssetImage('assets/profileholder.jpg');
const AssetImage profileScreenLanguageIcon =
    AssetImage('assets/profileicon.png');
const AssetImage editProfileIcon = AssetImage('assets/profile_edit.png');
const AssetImage profileScreenPerson = AssetImage('assets/profile_image.jpg');
const AssetImage calenderIcon = AssetImage('assets/calender.png');
const AssetImage smallTicket = AssetImage('assets/smallticket.png');
const countryCode = {
  '+48': polandFlag,
  '+42(0': czechFlag,
  '+38(0': ukraineFlag
};
const facebookAPI = 'https://test-api.gunsel.ua/Public.svc/LoginWithFacebook';
const tokenAPI =
    'https://test-api.gunsel.ua/Public.svc/GetPublicToken?c0=30&c1=0';
const stationListAPI = 'https://test-api.gunsel.ua/Public.svc/GetStationList';

//Routes
const String homeScreen = '/';
const String loginScreen = '/login';
const String searchTicketScreen = '/searchTicket';
const String selectSeatScreen = '/selectSeat';
const String signUpScreen = '/signup';
const String roundWayScreen = '/roundway';
const String cancelTicketScreen = '/cancelticket';
const String oneWayScreen = '/oneway';
const String finalCancelTicketScreen = '/finalCancelTicketScreen';
const String newsScreen = '/newsscreen';
const String articleScreen = '/articlescreen';
const String profileScreen = '/profilescreen';
const String aboutCompanyScreen = '/aboutcompany';
const String ticketSummaryScreen = '/ticketsummary';
const String splashScreen = '/splash';
const String languageScreen = '/languageScreen';

//Colors
const gunselColor = Color(0xff035EA7);
