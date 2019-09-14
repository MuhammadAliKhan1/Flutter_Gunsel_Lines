import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/widgets/scaffold.dart';

class PaymentResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
      appBarIcon: backArrow,
      appBarIncluded: true,
      backgroundImage: scaffoldImg,
      appBarTitle: 'Passenger Details',
      appBarTitleIncluded: true,
      drawerIncluded: false,
      bodyWidget: PaymentResultScreen(),
    );
  }
}

class PaymentResultScreen extends StatefulWidget {
  @override
  _PaymentResultScreenState createState() => _PaymentResultScreenState();
}

class _PaymentResultScreenState extends State<PaymentResultScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(left: 5.0, right: 5.0),
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Your seat",
                  style: TextStyle(color: Colors.yellow),
                ),
                Text(
                  "Details",
                  style: TextStyle(color: Colors.yellow),
                ),
                Text(
                  "Purchase Details",
                  style: TextStyle(color: Colors.yellow),
                ),
                Text(
                  "Purchase",
                  style: TextStyle(color: Colors.yellow),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: wizardFour,
                  height: ScreenUtil().setSp(50),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          height: 260.0,
          width: MediaQuery.of(context).size.width - 20,
          child: Stack(
            children: <Widget>[
              Image(
                image: purchasedTicket,
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                  color: Colors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0),
                    ),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 70,
                    child: ListTile(
                      trailing: Text(
                        "The night between Mon. and Tu.",
                        style: TextStyle(fontSize: 12.0, color: Colors.red),
                      ),
                      title: Text(
                        "Transfer via Dnipro",
                        style: TextStyle(fontSize: 13.0, color: Colors.black),
                      ),
                    ),
                  ),
                  elevation: 3.0,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Center(
          child: Container(
            height: 210,
            width: MediaQuery.of(context).size.width - 10,
            child: Stack(
              children: <Widget>[
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 140.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Center(
                                child: Text(
                                  "Payment was successfull",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: darkBlue.withOpacity(0.9)),
                                ),
                              ),
                              Center(
                                child: Container(
                                  child: Text(
                                    "You received an email for download ticket please check your address.",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Center(
                                child: ButtonTheme(
                                  buttonColor: darkBlue,
                                  minWidth:
                                      MediaQuery.of(context).size.width - 40,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                    )),
                                    child: Text("Send email again",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 18.0)),
                                    elevation: 3.0,
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                                backgroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10.0))),
                                                title: Text(
                                                  "Send ticket to email",
                                                  style: TextStyle(
                                                      color: gunselColor),
                                                  textAlign: TextAlign.center,
                                                ),
                                                content: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Text(
                                                        "Please write your email address"),
                                                    Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 10.0),
                                                        child: TextFormField(
                                                          validator:
                                                              (String value) {
                                                            if (value.isEmpty) {
                                                              return "Please enter your email";
                                                            }
                                                          },
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                          decoration: InputDecoration(
                                                              fillColor:
                                                                  Colors.white,
                                                              filled: true,
                                                              hintText:
                                                                  "Your email",
                                                              border: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5.0))),
                                                        )),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 20.0),
                                                        child: RaisedButton(
                                                          child: Text(
                                                            "Send email",
                                                            textScaleFactor:
                                                                1.5,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .yellow),
                                                          ),
                                                          color: gunselColor,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.only(
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        10.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10.0)),
                                                          ),
                                                          onPressed: () {
                                                            setState(() {
                                                              //TODO: Send mail button
                                                              debugPrint(
                                                                  "Send button is pressed");
                                                            });
                                                          },
                                                        ))
                                                  ],
                                                ));
                                          });
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      height: 180.0,
                      padding: EdgeInsets.only(top: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                    )),
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset("images/thumbIcon.png"),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
