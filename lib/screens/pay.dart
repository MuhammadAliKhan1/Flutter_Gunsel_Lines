import 'package:gunsel/data/constants.dart';

final _payForm = GlobalKey<FormState>();

class Pay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
      appBarIncluded: false,
      backgroundImage: scaffoldImg,
      appBarIcon: backArrow,
      bodyWidget: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20.0),
          child: PayScreen(),
        ),
      ),
      appBarTitleIncluded: false,
      drawerIncluded: false,
    );
  }
}

class PayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: FittedBox(
      alignment: Alignment.center,
      child: Center(
          child: Container(
        width: MediaQuery.of(context).size.width - 60,
        height: MediaQuery.of(context).size.height-60,
        decoration: BoxDecoration(
          //shadow here
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: MediaQuery.of(context).size.width - 50,
                color: Colors.yellow,
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: gunselLoginLogo,
                      height: 50,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '420 UAH',
                      style: TextStyle(
                        color: darkBlue.withOpacity(0.8),
                        fontFamily: 'MyriadPro',
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Odessa - Kyiv / 23.08.2019 13:30',
                      style: TextStyle(
                        fontFamily: 'MyriadPro',
                        fontSize: 15,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Order ID ',
                          style: TextStyle(
                            fontFamily: 'MyriadPro',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: darkBlue,
                          ),
                        ),
                        Text('9D337493',
                            style: TextStyle(
                              fontFamily: 'MyriadPro',
                              fontSize: 15,
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              width: MediaQuery.of(context).size.width - 50,
              height: 420,
              child: PayForm(),
            ),
            Flexible(
              child: Container(
                  color: Colors.yellow,
                  child: Row(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 10.0,
                            height: double.infinity,
                          ),
                          Image(
                            image: englandFlag,
                            height: 15,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Image(
                            image: ukraineFlag,
                            height: 15,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Image(
                            image: russiaFlag,
                            height: 15,
                          ),
                        ],
                      ),
                      SizedBox(width: 50.0,),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Go Back',
                          style: TextStyle(
                              color: darkBlue.withOpacity(0.8),
                              fontSize: 20.0,
                              fontFamily: 'MyriadPro'),
                        ),
                      ),
                      SizedBox(width: 20.0,),
                      Container(
                        height: 500,
                        width: 100,
                        color: darkBlue,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, paymentResultScreen);
                          },
                          child: Center(
                              child: Text(
                            'Proceed',
                            style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 20.0,
                                fontFamily: 'MyriadPro'),
                          )),
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      )),
    ));
  }
}

class PayForm extends StatefulWidget {
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<PayForm> {
  TextEditingController cardholder = TextEditingController();
  TextEditingController cardnumber = TextEditingController();
  TextEditingController cvc = TextEditingController();
  String selectedMonth = '01';
  String selectedYear = '2019';

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _payForm,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 60,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Card holder's name",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'MyriadPro',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: this.cardholder,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10.0),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 60,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Card Number",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'MyriadPro',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: this.cardnumber,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10.0),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 60,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Expiration month & year",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'MyriadPro',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black54),
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.white),
                          child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton<String>(
                                    value: this.selectedMonth,
                                    onChanged: (String newValue) {
                                      setState(() {
                                        this.selectedMonth = newValue;
                                      });
                                    },
                                    items: <String>[
                                      "01",
                                      "02",
                                      "03",
                                      "04",
                                      "05",
                                      "06",
                                      "07",
                                      "08",
                                      "09",
                                      "10",
                                      "11",
                                      "12"
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ))),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          width: 120,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black54),
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.white),
                          child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton<String>(
                                    value: this.selectedYear,
                                    onChanged: (String newValue) {
                                      setState(() {
                                        this.selectedYear = newValue;
                                      });
                                    },
                                    items: <String>[
                                      '2019',
                                      '2020',
                                      '2021',
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ))),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 150.0),
              width: double.infinity,
              height: 60,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "CVC",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'MyriadPro',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Flexible(
                    child: Row(
                      children: <Widget>[
                        Flexible(
                            child: TextFormField(
                          controller: this.cvc,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        )),
                        SizedBox(
                          width: 40.0,
                        ),
                        Tooltip(
                            message: 'Tooltip message here',
                            child: Text(
                              '?',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'MyriadPro',
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Image(
                    image: visaLogo,
                    height: 50,
                  ),
                ),
                Container(
                  child: Image(
                    image: mastercardLogo,
                    height: 50,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                '08:12',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'MyriadPro',
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Email:  ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'MyriadPro',
                  ),
                ),
                Text(
                  'info@gunsel.com',
                  style: TextStyle(
                    color: darkBlue,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'MyriadPro',
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
