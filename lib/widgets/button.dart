import 'package:gunsel/data/constants.dart';

class GunselButton extends StatelessWidget {
  final double btnWidth;
  final double btnHeight;
  @required
  final double btnTextFontSize;
  final String btnText;
  final Color btnTextColor;
  Function whenPressed;
  GunselButton({
    Key key,
    @required this.btnWidth,
    @required this.whenPressed,
    this.btnHeight,
    this.btnText,
    this.btnTextColor,
    this.btnTextFontSize,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: btnWidth == null
          ? 100.0
          : (MediaQuery.of(context).size.width / btnWidth),
      height: btnHeight,
      child: ButtonTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
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
                  : MediaQuery.of(context).size.height / btnTextFontSize,
              color: btnTextColor,
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
