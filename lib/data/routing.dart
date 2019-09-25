import 'package:gunsel/data/facebook_login.dart';
import 'package:gunsel/screens/details.dart';
import 'package:gunsel/screens/payment_result.dart';

import 'constants.dart';
import 'package:gunsel/screens/splash_screen.dart';
import 'package:gunsel/screens/pay.dart';
import 'package:gunsel/screens/login.dart';
import 'package:gunsel/screens/search_ticket.dart';
import 'package:gunsel/screens/select_seat.dart';
import 'package:gunsel/screens/sign_up.dart';
import 'package:gunsel/screens/round_way.dart';
import 'package:gunsel/screens/cancel_ticket.dart';
import 'package:gunsel/screens/travelhistory.dart';
import 'package:gunsel/screens/one_way.dart';
import 'package:gunsel/screens/final_cancelticket.dart';
import 'package:gunsel/screens/news.dart';
import 'package:gunsel/screens/article.dart';
import 'package:gunsel/screens/profile.dart';
import 'package:gunsel/screens/about_company.dart';
import 'package:gunsel/screens/ticket_summary.dart';
import 'package:gunsel/screens/language.dart';
import 'package:gunsel/data/facebook_login.dart';

class CustomRoute<T> extends MaterialPageRoute<T> {
  CustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    return child;
  }
}

class Router {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return CustomRoute(builder: (BuildContext context) => OneWay());
      case detailScreen:
        return CustomRoute(builder: (BuildContext context) => Detail());
      case paymentResultScreen:
        return CustomRoute(builder: (BuildContext context) => PaymentResult());
      case payScreen:
        return CustomRoute(builder: (BuildContext context) => Pay());
      case loginScreen:
        return CustomRoute(builder: (_) => Login());
      case searchTicketScreen:
        return CustomRoute(
            builder: (_) => SearchTicket(oneWayData: settings.arguments));
      case selectSeatScreen:
        return CustomRoute(builder: (_) => SelectSeat());
      case signUpScreen:
        return CustomRoute(builder: (_) => SignUpScreen());
      case roundWayScreen:
        return CustomRoute(builder: (_) => RoundWay());
      case cancelTicketScreen:
        return CustomRoute(builder: (_) => CancelTicketScreen());
      case oneWayScreen:
        return CustomRoute(builder: (_) => OneWay());
      case historyScreen:
        return CustomRoute(builder: (_) => History());
      case finalCancelTicketScreen:
        return CustomRoute(builder: (_) => FinalCancelTicketScreen());
      case newsScreen:
        return CustomRoute(builder: (_) => NewsScreen());
      case articleScreen:
        return CustomRoute(builder: (_) => ArticleScreen());
      case profileScreen:
        return CustomRoute(builder: (_) => Profile());
      case aboutCompanyScreen:
        return CustomRoute(builder: (_) => AboutCompanyScreen());
      case ticketSummaryScreen:
        return CustomRoute(builder: (_) => TicketSummary());
      case splashScreen:
        return CustomRoute(builder: (_) => GunselSplash());
      case languageScreen:
        return CustomRoute(builder: (_) => LanguageScreen());
      case finalCancelTicketScreen:
        return CustomRoute(builder: (_) => FinalCancelTicket());
      case facebookLoginScreen:
        return CustomRoute(builder: (_) => MyApp());

      default:
        return CustomRoute(
          builder: (_) => GunselScaffold(
            appBarIcon: backArrow,
            bodyWidget: Center(
              child: Text(
                'No route defined for ${settings.name}',
              ),
            ),
            appBarIncluded: true,
            backgroundImage: scaffoldImg,
            drawerIncluded: false,
            appBarTitleIncluded: false,
          ),
        );
    }
  }
}
