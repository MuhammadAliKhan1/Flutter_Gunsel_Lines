import 'package:gunsel/widgets/button.dart';
import 'package:gunsel/widgets/scaffold.dart';
import 'package:gunsel/data/constants.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
      appBarIcon: menuIcon,
      appBarIncluded: true,
      backgroundImage: loginImgBG,
      appBarTitleIncluded: true,
      appBarTitle: 'Login',
      drawerIncluded: true,
      bodyWidget: SingleChildScrollView(child: LoginScreen()),
      appBarColor: gunselColor,
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: FittedBox(
      alignment: Alignment.center,
      child: Center(
        child: Container(
          height: 740,
          width: 505,
          child: Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  Image(
                    image: gunselLoginLogo,
                    height: 80,
                  ),
                  LoginForm(),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _oneWayForm = GlobalKey<FormState>();
  TextEditingController _number = TextEditingController();
  TextEditingController _password = TextEditingController();
  List<DropdownMenuItem<AssetImage>> _dropDownMenuItems;
  AssetImage _currentFlag;
  String _currentCode = '';
  String data;

  @override
  void initState() {
    super.initState();
    _dropDownMenuItems = getDropDownMenuItems();
    _currentFlag = _dropDownMenuItems[0].value;
    _currentCode = countryCode.keys.firstWhere(
      (k) => countryCode[k] == _currentFlag,
      orElse: () => '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ButtonTheme(
              alignedDropdown: true,
              splashColor: Colors.transparent,
              buttonColor: Colors.transparent,
              height: 50,
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                  elevation: 0,
                  value: _currentFlag,
                  items: _dropDownMenuItems,
                  onChanged: changedDropDownItem,
                ),
              ),
            ),
            Container(
                child: Row(
              children: <Widget>[
                Icon(Icons.phone, color: Colors.white, size: 30),
                Container(
                  width: 250,
                  height: 40,
                  child: TextFormField(
                    controller: this._number,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white, fontSize: 23),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      prefix: Text(
                        "$_currentCode  ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: passwordIcon,
              height: 30,
            ),
            Container(
              width: 300,
              height: 40,
              child: TextFormField(
                obscureText: true,
                controller: this._password,
                style: TextStyle(color: Colors.white, fontSize: 23),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        )),
        Container(
          height: 40,
          width: 325,
          child: InkWell(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot your password?',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          height: 60,
          width: 450,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image(
                image: facebookLogo,
              ),
              GunselButton(
                btnWidth: 320,
                whenPressed: () {},
                btnFontFamily: 'MyriadPro',
                textWeight: FontWeight.w700,
                btnText: 'Sign In',
                btnTextFontSize: 40,
                btnHeight: 45,
              ),
              Image(
                image: googleLogo,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: 400,
          height: 60,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Don't have an account?",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'MyriadPro',
                  color: Colors.white,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    signUpScreen,
                  );
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'MyriadPro',
                    color: Colors.yellow,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }

  List<DropdownMenuItem<AssetImage>> getDropDownMenuItems() {
    List<DropdownMenuItem<AssetImage>> items = new List();
    for (AssetImage flag in countryCode.values) {
      // here we are creating the drop down menu items, you can customize the item right here
      // but I'll just use a simple text for this
      items.add(
        DropdownMenuItem(
          value: flag,
          child: new Image(
            image: flag,
            height: 30,
          ),
        ),
      );
    }
    return items;
  }

  void changedDropDownItem(AssetImage selectedFlag) {
    setState(
      () {
        _currentFlag = selectedFlag;
        _currentCode = countryCode.keys.firstWhere(
          (k) => countryCode[k] == selectedFlag,
          orElse: () => '',
        );
      },
    );
  }
}

