import 'package:gunsel/data/constants.dart';
import 'package:gunsel/screens/Drawer/menu_row.dart';

class DrawerList extends StatefulWidget {
  final bool accountIncluded;
  DrawerList({Key key, @required this.accountIncluded}) : super(key: key);
  @override
  _DrawerListState createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  @override
  Widget build(BuildContext context) {
    return widget.accountIncluded ? accountIncluded() : accountNotIncluded();
  }

  accountIncluded() {
    return Column(
      children: <Widget>[
        MenuRow(
          title: 'My Profile',
          icon: Icons.person,
          routeTo: profileScreen,
          pngImageAllow: false,
        ),
        MenuRow(
          title: 'Buy Ticket',
          icon: Icons.credit_card,
          routeTo: oneWayScreen,
          pngImageAllow: false,
        ),
        MenuRow(
          title: 'Cancel Ticket',
          icon: Icons.cancel,
          routeTo: cancelTicketScreen,
          pngImageAllow: false,
        ),
        MenuRow(
          title: 'History Of travels',
          icon: Icons.timer,
          routeTo: null,
          pngImageAllow: false,
        ),
        MenuRow(
          title: 'News',
          icon: Icons.new_releases,
          routeTo: newsScreen,
          pngImageAllow: false,
        ),
        MenuRow(
          title: 'About Gunsel Lines',
          routeTo: aboutCompanyScreen,
          pngImageAllow: false,
          icon: Icons.date_range,
        ),
      ],
    );
  }

  accountNotIncluded() {
    return Column(
      children: <Widget>[
        MenuRow(
          title: 'My Profile',
          icon: Icons.person,
          routeTo: profileScreen,
          pngImageAllow: false,
        ),
        MenuRow(
          title: 'Buy Ticket',
          icon: Icons.credit_card,
          routeTo: oneWayScreen,
          pngImageAllow: false,
        ),
        MenuRow(
          title: 'Cancel Ticket',
          icon: Icons.cancel,
          routeTo: cancelTicketScreen,
          pngImageAllow: false,
        ),
        MenuRow(
          title: 'News',
          icon: Icons.new_releases,
          routeTo: newsScreen,
          pngImageAllow: false,
        ),
        MenuRow(
          title: 'Language',
          icon: Icons.language,
          routeTo: languageScreen,
          pngImageAllow: false,
        ),
        MenuRow(
          title: 'About Gunsel Lines',
          routeTo: aboutCompanyScreen,
          pngImageAllow: true,
          pngImage: aboutCompanyIcon,
        ),
      ],
    );
  }
}
