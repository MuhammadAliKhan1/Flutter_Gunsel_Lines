import 'package:gunsel/data/facebook_login.dart';
import 'package:gunsel/screens/DetailsRoundWay.dart';
import 'package:gunsel/screens/DetailsRoundWay_TransferWay.dart';
import 'package:gunsel/screens/RoundWaySearchTicket.dart';
import 'package:gunsel/screens/SelectSeatRoundWay.dart';
import 'package:gunsel/screens/SelectSeatRoundWay_TransferWay.dart';
import 'package:gunsel/screens/TransferWayDetails.dart';
import 'package:gunsel/screens/TransferWaySelectSeat.dart';
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
      case searchTicketRoundWay:
        return CustomRoute(
            builder: (BuildContext context) => SearchTicket_RoundWay(
                  userData: settings.arguments,
                ));
      case detailScreen:
        return CustomRoute(
            builder: (BuildContext context) => Detail(
                  ticketData: settings.arguments,
                ));
      case paymentResultScreen:
        return CustomRoute(
            builder: (BuildContext context) => PaymentResult(
                  userData: settings.arguments,
                ));
      case selectSeatRoundWay:
        return CustomRoute(
            builder: (BuildContext context) => SelectSeat_RoundWay(
                  ticketData: settings.arguments,
                ));
      case detailsRoundWay:
        return CustomRoute(
            builder: (BuildContext context) => DetailRoundWay(
                  ticketData: settings.arguments,
                ));
      case payScreen:
        return CustomRoute(
            builder: (BuildContext context) => Pay(
                  userData: settings.arguments,
                ));
      case loginScreen:
        return CustomRoute(builder: (_) => LoginScreen());
      case searchTicketScreen:
        return CustomRoute(
            builder: (_) =>
                new SearchTicket(buyTicketData: settings.arguments));
      case selectSeatScreen:
        return CustomRoute(
            builder: (_) => SelectSeat(
                  ticketData: settings.arguments,
                ));
      case signUpScreen:
        return CustomRoute(builder: (_) => SignUp());

      case roundWayScreen:
        return CustomRoute(builder: (_) => RoundWay());
      case selectSeats_TransferWay:
        return CustomRoute(
            builder: (_) => SelectSeat_TransferWay(
                  ticketData: settings.arguments,
                ));
      case cancelTicketScreen:
        return CustomRoute(builder: (_) => CancelTicket());
      case oneWayScreen:
        return CustomRoute(builder: (_) => OneWay());
      case selectSeatRoundWay_TransferWay:
        return CustomRoute(
            builder: (_) => SelectSeat_TransferWay_RoundWay(
                  ticketData: settings.arguments,
                ));
      case detailsRoundWay_TransferWay:
        return CustomRoute(
            builder: (_) => DetailRoundWay_TransferWay(
                  ticketData: settings.arguments,
                ));
      case historyScreen:
        return CustomRoute(builder: (_) => History());
      case finalCancelTicketScreen:
        return CustomRoute(builder: (_) => FinalCancelTicket());
      case newsScreen:
        return CustomRoute(builder: (_) => News());
      case articleScreen:
        return CustomRoute(builder: (_) => ArticleScreen());
      case details_TransferWay:
        return CustomRoute(
            builder: (_) => DetailTransferWay(
                  ticketData: settings.arguments,
                ));
      case profileScreen:
        return CustomRoute(builder: (_) => ProfileScreen());
      case aboutCompanyScreen:
        return CustomRoute(builder: (_) => AboutCompany());
      case ticketSummaryScreen:
        return CustomRoute(
            builder: (_) => TicketSummary(
                  ticketData: settings.arguments,
                ));
      case splashScreen:
        return CustomRoute(builder: (_) => GunselSplash());
      case languageScreen:
        return CustomRoute(builder: (_) => Language());
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
