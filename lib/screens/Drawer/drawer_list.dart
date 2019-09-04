import 'package:gunsel/data/constants.dart';
import 'package:gunsel/screens/Drawer/menu_row.dart';

class DrawerList extends StatefulWidget {
  @override
  _DrawerListState createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
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
          title: 'History of Travels',
          icon: Icons.history,
          routeTo: null,
        ),
        MenuRow(
          title: 'News',
          icon: Icons.new_releases,
          routeTo: newsScreen,
        ),
        MenuRow(
          title: 'About Company',
          icon: Icons.access_alarms,
          routeTo: aboutCompanyScreen,
        ),
      ],
    );
  }
}
