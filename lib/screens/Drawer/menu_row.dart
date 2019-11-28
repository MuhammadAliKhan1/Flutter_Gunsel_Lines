import 'package:gunsel/data/constants.dart';

import 'package:auto_size_text/auto_size_text.dart';

class MenuRow extends StatefulWidget {
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
  _MenuRowState createState() => _MenuRowState();
}

class _MenuRowState extends State<MenuRow> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          widget.onTap();
        },
        child: ListTile(
          contentPadding: EdgeInsets.only(
              left: ScreenUtil().setSp(70), bottom: ScreenUtil().setSp(5)),
          leading: widget.pngImageAllow
              ? Image(
                  image: widget.pngImage,
                  color: gunselColor,
                  height: ScreenUtil().setSp(40),
                )
              : Icon(
                  widget.icon,
                  size: ScreenUtil().setSp(40),
                  color: gunselColor,
                ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  width: ScreenUtil().setWidth(300),
                  child: AutoSizeText(
                    "${widget.title}",
                    maxLines: 1,
                    style: TextStyle(
                      fontFamily: "Helvetica",
                      fontWeight: FontWeight.w600,
                      color: gunselColor,
                      fontSize: ScreenUtil().setSp(40),
                    ),
                  )),
            ],
          ),
        ));
  }
}
