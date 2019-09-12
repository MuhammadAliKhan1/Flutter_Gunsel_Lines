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
          routeTo: profileScreen,
          pngImageAllow: true,
          pngImage: profileIcon,
        ),
        MenuRow(
          title: 'Buy Ticket',
          routeTo: oneWayScreen,
          pngImageAllow: true,
          pngImage: buyIcon,
        ),
        MenuRow(
          title: 'Cancel Ticket',
          routeTo: cancelTicketScreen,
          pngImageAllow: true,
          pngImage: cancelIcon,
        ),
        MenuRow(
          title: 'History Of travels',
          icon: Icons.timer,
          routeTo: null,
          pngImageAllow: false,
        ),
        MenuRow(
          title: 'News',
          routeTo: newsScreen,
          pngImageAllow: true,
          pngImage: newsIcon,
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

  accountNotIncluded() {
    return Column(
      children: <Widget>[
        MenuRow(
          title: 'My Profile',
          pngImage: profileIcon,
          routeTo: profileScreen,
          pngImageAllow: true,
        ),
        MenuRow(
          title: 'Buy Ticket',
          routeTo: oneWayScreen,
          pngImageAllow: true,
          pngImage: buyIcon,
        ),
        MenuRow(
          title: 'Cancel Ticket',
          routeTo: cancelTicketScreen,
          pngImageAllow: true,
          pngImage: cancelIcon,
        ),
        MenuRow(
          title: 'News',
          icon: Icons.new_releases,
          routeTo: newsScreen,
          pngImageAllow: true,
          pngImage: newsIcon,
        ),
        MenuRow(
          title: 'Language',
          routeTo: languageScreen,
          pngImageAllow: true,
          pngImage: languageIcon,
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
