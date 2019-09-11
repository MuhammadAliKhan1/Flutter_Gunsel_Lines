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
        ),
        MenuRow(
          title: 'Buy Ticket',
          icon: Icons.credit_card,
          routeTo: oneWayScreen,
        ),
        MenuRow(
          title: 'Cancel Ticket',
          icon: Icons.cancel,
          routeTo: cancelTicketScreen,
        ),
        MenuRow(
          title: 'History Of travels',
          icon: Icons.timer,
          routeTo: null,
        ),
        MenuRow(
          title: 'News',
          icon: Icons.new_releases,
          routeTo: newsScreen,
        ),
        MenuRow(
          title: 'About Gunsel Lines',
          icon: Icons.access_alarms,
          routeTo: aboutCompanyScreen,
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
        ),
        MenuRow(
          title: 'Buy Ticket',
          icon: Icons.credit_card,
          routeTo: oneWayScreen,
        ),
        MenuRow(
          title: 'Cancel Ticket',
          icon: Icons.cancel,
          routeTo: cancelTicketScreen,
        ),
        MenuRow(
          title: 'News',
          icon: Icons.new_releases,
          routeTo: newsScreen,
        ),
        MenuRow(
          title: 'Language',
          icon: Icons.language,
          routeTo: languageScreen,
        ),
        MenuRow(
          title: 'About Gunsel Lines',
          icon: Icons.subject,
          routeTo: aboutCompanyScreen,
        ),
      ],
    );
  }
}
