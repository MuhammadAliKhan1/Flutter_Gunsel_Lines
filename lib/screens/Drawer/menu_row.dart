import 'package:gunsel/data/constants.dart';

class MenuRow extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool pngImageAllow;
  final AssetImage pngImage;
  final Function onTap;
  MenuRow({
    Key key,
    @required this.onTap,
    @required this.title,
    @required this.pngImageAllow,
    this.icon,
    this.pngImage,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: ListTile(
        contentPadding: EdgeInsets.only(
            left: ScreenUtil().setSp(120), bottom: ScreenUtil().setSp(5)),
        leading: pngImageAllow
            ? Image(
                image: pngImage,
                color: gunselColor,
                height: ScreenUtil().setSp(40),
              )
            : Icon(
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
                fontFamily: "Helvetica",
                fontWeight: FontWeight.w600,
                color: gunselColor,
                fontSize: ScreenUtil().setSp(37),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
