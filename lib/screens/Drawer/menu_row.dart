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
      onTap: () => Navigator.pushReplacementNamed(context, '$routeTo'),
      child: ListTile(
        contentPadding: EdgeInsets.only(
            left: ScreenUtil().setSp(120), bottom: ScreenUtil().setSp(5)),
        leading: Icon(
          icon,
          size: ScreenUtil().setSp(40),
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
                fontSize: ScreenUtil().setSp(30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
