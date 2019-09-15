import 'package:gunsel/screens/details.dart';
import 'package:gunsel/screens/payment_result.dart';

import 'constants.dart';
import 'package:gunsel/screens/splash_screen.dart';
import 'package:gunsel/screens/login.dart';
import 'package:gunsel/screens/search_ticket.dart';
import 'package:gunsel/screens/select_seat.dart';
import 'package:gunsel/screens/sign_up.dart';
import 'package:gunsel/screens/round_way.dart';
import 'package:gunsel/screens/cancel_ticket.dart';
import 'package:gunsel/screens/one_way.dart';
import 'package:gunsel/screens/final_cancelticket.dart';
import 'package:gunsel/screens/news.dart';
import 'package:gunsel/screens/article.dart';
import 'package:gunsel/screens/profile.dart';
import 'package:gunsel/screens/about_company.dart';
import 'package:gunsel/screens/ticket_summary.dart';
import 'package:gunsel/screens/language.dart';

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
      case loginScreen:
        return CustomRoute(builder: (_) => Login());
      case searchTicketScreen:
        return CustomRoute(builder: (_) => SearchTicket());
      case selectSeatScreen:
        return CustomRoute(builder: (_) => SelectSeat());
      case signUpScreen:
        return CustomRoute(builder: (_) => SignUp());
      case roundWayScreen:
        return CustomRoute(builder: (_) => RoundWay());
      case cancelTicketScreen:
        return CustomRoute(builder: (_) => CancelTicket());
      case oneWayScreen:
        return CustomRoute(builder: (_) => OneWay());
      case finalCancelTicketScreen:
        return CustomRoute(builder: (_) => FinalCancelTicket());
      case newsScreen:
        return CustomRoute(builder: (_) => News());
      case articleScreen:
        return CustomRoute(builder: (_) => Article());
      case profileScreen:
        return CustomRoute(builder: (_) => Profile());
      case aboutCompanyScreen:
        return CustomRoute(builder: (_) => AboutCompany());
      case ticketSummaryScreen:
        return CustomRoute(builder: (_) => TicketSummary());
      case splashScreen:
        return CustomRoute(builder: (_) => GunselSplash());
      case languageScreen:
        return CustomRoute(builder: (_) => Language());
      case finalCancelTicketScreen:
        return CustomRoute(builder: (_) => FinalCancelTicket());

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
