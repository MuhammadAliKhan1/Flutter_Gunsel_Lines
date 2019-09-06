import 'package:gunsel/data/constants.dart';
import 'package:gunsel/screens/Drawer/drawer.dart';

class GunselScaffold extends StatefulWidget {
  final Widget bodyWidget;
  final bool drawerIncluded;
  final bool appBarIncluded;
  final bool appBarTitleIncluded;
  final String appBarTitle;
  final AssetImage backgroundImage;
  final Color appBarColor;
  GunselScaffold({
    Key key,
    @required this.bodyWidget,
    @required this.appBarIncluded,
    @required this.backgroundImage,
    this.drawerIncluded,
    this.appBarColor,
    this.appBarTitle,
    this.appBarTitleIncluded,
  }) : super(key: key);

  @override
  _GunselScaffoldState createState() => _GunselScaffoldState();
}

class _GunselScaffoldState extends State<GunselScaffold> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);
    return SafeArea(
        child: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: widget.backgroundImage,
              fit: BoxFit.cover,
            ),
          ),
          height: double.infinity,
          width: double.infinity,
        ),
        Scaffold(
          drawer: (widget.drawerIncluded && widget.appBarIncluded)
              ? SideDrawer()
              : null,
          backgroundColor: Colors.transparent,
          body: widget.bodyWidget,
          appBar: widget.appBarIncluded
              ? AppBar(
                  backgroundColor: widget.appBarColor == null
                      ? Colors.transparent
                      : widget.appBarColor,
                  title: widget.appBarTitleIncluded
                      ? Text(
                          "${widget.appBarTitle}",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: ScreenUtil().setSp(30)),
                        )
                      : null,
                  elevation: 0.0,
                  centerTitle: true,
                )
              : null,
        )
      ],
    ));
  }
}
