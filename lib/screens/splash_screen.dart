import 'package:gunsel/data/constants.dart';
import 'package:gunsel/data/sharedPreference.dart';

class GunselSplash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GunselSplashState();
}

class _GunselSplashState extends State<GunselSplash> {
SharePreferencelogin shPref = SharePreferencelogin();
  TokenGetter token = TokenGetter();
  @override
  void initState() {
    super.initState();
    getToken();

  }

  Future<Timer> getToken() async {
   // if != logged in call below
String category="";
category = await shPref.getloginCategory();

if(category == "custom" || category == "facebook" || category == "google")
  {
         print("Category is:"+category);
         return Timer(Duration(seconds: 3), navigateToHome);
  }

  else{
  token.getToken();
  return Timer(Duration(seconds: 3), navigateToHome);
  }


    //public token


  }

  navigateToHome() async {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(homeScreen, (Route<dynamic> route) => false);
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
}
