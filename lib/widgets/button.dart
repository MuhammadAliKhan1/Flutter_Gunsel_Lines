import 'package:gunsel/data/constants.dart';

class GunselButton extends StatelessWidget {
  final String btnFontFamily;
  final int btnWidth;
  final double btnHeight;
  final int btnTextFontSize;
  final String btnText;
  final Color btnTextColor;
  final FontWeight textWeight;
  Function whenPressed;
  GunselButton(
      {Key key,
      @required this.btnWidth,
      @required this.whenPressed,
      this.btnHeight,
      this.btnText,
      this.btnTextColor,
      this.btnTextFontSize,
      this.btnFontFamily,
      this.textWeight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: btnWidth == null
          ? ScreenUtil().setWidth(50)
          : ScreenUtil().setWidth(btnWidth),
      height: btnHeight,
      child: ButtonTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(15.0),
            topLeft: Radius.circular(15.0),
          ),
        ),
        buttonColor: Colors.yellow,
        child: RaisedButton(
          child: Text(
            "$btnText",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: btnTextFontSize == null
                  ? 5.0
                  : ScreenUtil(allowFontScaling: true).setSp(btnTextFontSize),
              color: btnTextColor,
              fontFamily: btnFontFamily,
              fontWeight: this.textWeight,
            ),
          ),
          onPressed: () {
            whenPressed();
          },
        ),
      ),
    );
  }
}
