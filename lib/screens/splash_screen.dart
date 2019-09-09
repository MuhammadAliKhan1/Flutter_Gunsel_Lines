import 'package:gunsel/data/constants.dart';


class GunselSplash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GunselSplashState();
}

class _GunselSplashState extends State<GunselSplash> {
  @override
  void initState() {
    super.initState();
    getToken();
  }

  Future<Timer> getToken() async {
    return Timer(Duration(seconds: 3), onReceivingToken);
  }

  onReceivingToken() async {
    Navigator.of(context).pushReplacementNamed(homeScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: splashImg,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

 /*  _getAndSaveToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await _getTokenFromHttp();
    await prefs.setString('token', token);
  } */

}
