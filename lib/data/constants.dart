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

const AssetImage personImage = AssetImage('assets/person-image.png');
const AssetImage profileScreenBackground = AssetImage('assets/profileBG.jpg');
const AssetImage splashImg = AssetImage("assets/splash_image.jpg");
const AssetImage loginImgBG = AssetImage("assets/loginBG.jpg");
const AssetImage scaffoldImg = AssetImage("assets/BG.jpg");
const AssetImage drawerAccountHeaderImg = AssetImage('assets/DrawerBG.png');
const AssetImage drawerLogoutImg = AssetImage("assets/log_out_icon.png");
const AssetImage userImg = AssetImage('assets/user.png');
const AssetImage polandFlag = AssetImage('assets/poland.png');
const AssetImage czechFlag = AssetImage('assets/czech.png');
const AssetImage ukraineFlag = AssetImage('assets/ukraine.png');
const AssetImage googleLogo = AssetImage('assets/google.png');
const AssetImage facebookLogo = AssetImage('assets/facebook.png');
const AssetImage whiteImage = AssetImage('assets/white.jpg');
const AssetImage profileHolder = AssetImage('assets/profileholder.png');
const AssetImage profileScreenLanguageIcon =
    AssetImage('assets/profileicon.png');
const AssetImage editProfileIcon = AssetImage('assets/profile_edit.png');
const AssetImage smallTicket = AssetImage('assets/st.png');
const AssetImage refreshIcon = AssetImage('assets/news_icon.svg');
const AssetImage wizardOne = AssetImage('assets/1.png');
const AssetImage wizardTwo = AssetImage('assets/2.png');
const AssetImage wizardThree = AssetImage('assets/3.png');
const AssetImage wizardFour = AssetImage('assets/4.png');
const AssetImage bus = AssetImage('assets/bus.png');
const AssetImage swappingIcon = AssetImage("assets/swapping_icon.png");
const AssetImage calendarIcon = AssetImage("assets/calendar_icon_1.png");
const AssetImage aboutCompanyIcon = AssetImage('assets/aboutCompany.png');
const AssetImage news = AssetImage("images/news1.webp");
const AssetImage frontNews = AssetImage("images/front.webp");
const AssetImage newsIcon = AssetImage("assets/newIcon.png");
const AssetImage buyIcon = AssetImage("assets/ticket.png");
const AssetImage cancelIcon = AssetImage("assets/cancelIcon.png");
const AssetImage moneyImage = AssetImage('assets/money.png');
const AssetImage bigTicket = AssetImage('assets/bigticket.png');
const AssetImage purchasedTicket = AssetImage('assets/purchasedticket.png');
const AssetImage locationIcon = AssetImage("assets/map_icon.png");
const AssetImage uncheckedBox = AssetImage("assets/unchecked.png");
const AssetImage aboutImage = AssetImage("assets/about-Image.jpg");
const AssetImage languageIcon = AssetImage("assets/languageIcon.png");
const AssetImage profileIcon = AssetImage("assets/profile_icon.png");
const AssetImage telephone = AssetImage("assets/phone.png");
const AssetImage backArrow = AssetImage("assets/backArrow_2.png");
const AssetImage menuIcon = AssetImage("assets/menu_icon_2.png");

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
const String detailScreen = '/detailScreen';
const String paymentResultScreen = '/paymentresultscreen';
const String sideDrawer = '/sideDrawer';

//Colors
const gunselColor = Color(0xff035EA7);
const darkBlue = Color(0xff000080);
const red = Color(0xffFF0000);
const green = Color(0xff07D603);
