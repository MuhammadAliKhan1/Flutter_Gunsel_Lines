import 'package:flutter/material.dart';
import 'package:gunsel/screens/about_company.dart';
import 'package:gunsel/screens/article.dart';
import 'package:gunsel/screens/news.dart';
import 'package:gunsel/screens/profile.dart';
import 'package:gunsel/screens/ticket_summary.dart';
import './screens/final_cancelticket.dart';
import 'package:gunsel/screens/cancel_ticket.dart';
import 'package:gunsel/screens/login.dart';
import 'package:gunsel/screens/one_way.dart';
import 'package:gunsel/screens/round_way.dart';
import 'package:gunsel/screens/search_ticket.dart';
import 'package:gunsel/screens/select_seat.dart';
import 'package:gunsel/screens/sign_up.dart';
import 'screens/splash_screen.dart';

void main(List<String> args) => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GunselSplash(),
      routes: <String, WidgetBuilder>{
        'LoginScreen': (BuildContext context) => Login(),
        'SearchTicketScreen': (BuildContext context) => SearchTicket(),
        'SelectSeatScreen': (BuildContext context) => SelectSeat(),
        'SignUpScreen': (BuildContext context) => SignUp(),
        'RoundWayScreen': (BuildContext context) => RoundWay(),
        'CancelTicketScreen': (BuildContext context) => CancelTicket(),
        'OneWayScreen': (BuildContext context) => OneWay(),
        'FinalCancelTicketScreen': (BuildContext context) =>
            FinalCancelTicket(),
        'NewsScreen': (BuildContext context) => News(),
        "ArticleScreen": (BuildContext context) => Article(),
        'ProfileScreen': (BuildContext context) => Profile(),
        'AboutCompanyScreen': (BuildContext context) => AboutCompany(),
        "TicketSummaryScreen": (BuildContext contect) => TicketSummary()
      },
    ));
