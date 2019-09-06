export 'package:flutter/material.dart';
export 'package:gunsel/widgets/scaffold.dart';
import 'package:flutter/widgets.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';

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
const List<AssetImage> loginFlags = [
  AssetImage('assets/poland.png'),
  AssetImage('assets/czech.png'),
  AssetImage('assets/ukraine.png')
];
//Routes
const String homeScreen = '/';
const String loginScreen = '/login';
const String searchTicketScreen = '/searchTicket';
const String selectSeatScreen = '/selectSeat';
const String signUpScreen = '/signup';
const String roundWayScreen = '/roundway';
const String cancelTicketScreen = '/cancelticket';
const String oneWayScreen = '/oneway';
const String finalCancelTicketScreen = '/finalCancelTicket';
const String newsScreen = '/newsscreen';
const String articleScreen = '/articlescreen';
const String profileScreen = '/profilescreen';
const String aboutCompanyScreen = '/aboutcompany';
const String ticketSummaryScreen = '/ticketsummary';
const String splashScreen = '/splash';

//Colors
const gunselColor = Color(0xff035EA7);
