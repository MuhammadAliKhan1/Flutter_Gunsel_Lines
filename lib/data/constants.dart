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
const AssetImage person = AssetImage('assets/person.png');
const AssetImage profileScreenBackground = AssetImage('assets/profileBG.png');
const AssetImage splashImg = AssetImage("assets/splash_image.jpeg");
const AssetImage loginImgBG = AssetImage("assets/loginBG.jpg");
const AssetImage scaffoldImg = AssetImage("assets/BG.jpg");
const AssetImage drawerAccountHeaderImg = AssetImage('assets/DrawerBG.png');
const AssetImage drawerlogoutImg = AssetImage('assets/logout.png');
const AssetImage userImg = AssetImage('assets/user.png');
const AssetImage polandFlag = AssetImage('assets/poland.png');
const AssetImage czechFlag = AssetImage('assets/czech.png');
const AssetImage ukraineFlag = AssetImage('assets/ukraine.png');
const AssetImage googleLogo = AssetImage('assets/google.png');
const AssetImage facebookLogo = AssetImage('assets/facebook.png');
const AssetImage whiteImage = AssetImage('assets/white.jpg');
const AssetImage profileHolder = AssetImage('assets/profileholder.jpg');
const AssetImage profileScreenLanguageIcon =
    AssetImage('assets/profileicon.png');
const AssetImage editProfileIcon = AssetImage('assets/profile_edit.png');
const AssetImage calenderIcon = AssetImage('assets/calender.png');
const AssetImage smallTicket = AssetImage('assets/st.png');
const AssetImage refreshIcon = AssetImage('assets/news_icon.svg');
const AssetImage wizardOne = AssetImage('assets/1.png');
const AssetImage wizardTwo = AssetImage('assets/2.png');
const AssetImage wizardThree = AssetImage('assets/3.png');
const AssetImage wizardFour = AssetImage('assets/4.png');
const AssetImage swappingIcon = AssetImage("assets/swapping_icon.png");
const AssetImage calendarIcon = AssetImage("assets/calender.png");
const AssetImage frontNews = AssetImage("images/front.webp");
const AssetImage news = AssetImage("images/news1.webp");
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
const darkBlue = Color(0xff000080);
