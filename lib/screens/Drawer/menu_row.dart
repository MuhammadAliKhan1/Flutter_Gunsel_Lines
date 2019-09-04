import 'package:gunsel/data/constants.dart';

class MenuRow extends StatelessWidget {
  final String title;
  final IconData icon;
  final String routeTo;
  MenuRow(
      {Key key,
      @required this.title,
      @required this.icon,
      @required this.routeTo})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, routeTo),
      child: ListTile(
        contentPadding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / 6, top: 10.0),
        leading: Icon(
          icon,
          size: MediaQuery.of(context).size.height / 25,
          color: gunselColor,
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "$title",
              style: TextStyle(
                color: gunselColor,
                fontSize: MediaQuery.of(context).size.height / 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
