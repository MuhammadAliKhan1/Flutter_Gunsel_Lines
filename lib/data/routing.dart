import 'package:gunsel/screens/Drawer/drawer.dart';
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

class Router {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(builder: (BuildContext context) => OneWay());
      case detailScreen:
        return MaterialPageRoute(builder: (BuildContext context) => Detail());
      case paymentResultScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => PaymentResult());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case searchTicketScreen:
        return MaterialPageRoute(builder: (_) => SearchTicket());
      case selectSeatScreen:
        return MaterialPageRoute(builder: (_) => SelectSeat());
      case signUpScreen:
        return MaterialPageRoute(builder: (_) => SignUp());
      case roundWayScreen:
        return MaterialPageRoute(builder: (_) => RoundWay());
      case cancelTicketScreen:
        return MaterialPageRoute(builder: (_) => CancelTicket());
      case oneWayScreen:
        return MaterialPageRoute(builder: (_) => OneWay());
      case finalCancelTicketScreen:
        return MaterialPageRoute(builder: (_) => FinalCancelTicket());
      case newsScreen:
        return MaterialPageRoute(builder: (_) => News());
      case articleScreen:
        return MaterialPageRoute(builder: (_) => Article());
      case profileScreen:
        return MaterialPageRoute(builder: (_) => Profile());
      case aboutCompanyScreen:
        return MaterialPageRoute(builder: (_) => AboutCompany());
      case ticketSummaryScreen:
        return MaterialPageRoute(builder: (_) => TicketSummary());
      case splashScreen:
        return MaterialPageRoute(builder: (_) => GunselSplash());
      case languageScreen:
        return MaterialPageRoute(builder: (_) => Language());
      case finalCancelTicketScreen:
        return MaterialPageRoute(builder: (_) => FinalCancelTicket());
      case sideDrawer:
        return MaterialPageRoute(builder: (_) => SideDrawer());

      default:
        return MaterialPageRoute(
          builder: (_) => GunselScaffold(
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
