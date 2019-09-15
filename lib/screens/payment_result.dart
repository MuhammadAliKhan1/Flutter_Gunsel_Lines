import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/widgets/button.dart';

class PaymentResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
      appBarIcon: backArrow,
      appBarIncluded: true,
      backgroundImage: scaffoldImg,
      bodyWidget: PaymentResultScreen(),
      appBarTitle: 'Passenger details',
      appBarTitleIncluded: true,
      drawerIncluded: false,
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
      padding: EdgeInsets.all(5.0),
      children: <Widget>[
        Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Your seat",
                    style: TextStyle(
                        color: Colors.yellow,
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.w600)),
                Text(
                  "Details",
                  style: TextStyle(
                      color: Colors.yellow,
                      fontFamily: 'Helvetica',
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Purchase Details",
                  style: TextStyle(
                      color: Colors.yellow,
                      fontFamily: 'Helvetica',
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Purchase",
                  style: TextStyle(
                      color: Colors.yellow,
                      fontFamily: 'Helvetica',
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            FittedBox(
              alignment: Alignment.center,
              child: Image(
                height: 30,
                width: 310,
                image: wizardFour,
              ),
            ),
          ],
        ),
        PaymentResultTicket(),
        FittedBox(
          child: Center(
            child: Container(
                width: 40,
                height: 20,
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 50,
                        height: 18,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(1))),
                        child: Container(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: 40,
                              height: 14.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    'Payment was sucessfull',
                                    style: TextStyle(
                                        fontSize: 1.7,
                                        fontFamily: 'Helvetica',
                                        color: darkBlue.withOpacity(0.9),
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    'You received an email for download ticket please check your address.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 1.5,
                                      fontFamily: 'MyriadPro',
                                    ),
                                  ),
                                  InkWell(
                                      onTap: () {
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
                                                              if (value
                                                                  .isEmpty) {
                                                                return "Please enter your email";
                                                              }
                                                            },
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            decoration: InputDecoration(
                                                                fillColor:
                                                                    Colors
                                                                        .white,
                                                                filled: true,
                                                                hintText:
                                                                    "Your email",
                                                                border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
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
                                      child: Container(
                                        width: 35,
                                        height: 3.5,
                                        child: Center(
                                          child: Text(
                                            'Send email again.',
                                            style: TextStyle(
                                              fontSize: 2,
                                              color: Colors.yellow,
                                              fontFamily: 'Helvetica',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          color: darkBlue,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(2),
                                            bottomRight: Radius.circular(2),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image(
                        image: paymentThumb,
                        height: 5,
                        width: 30,
                      ),
                    ),
                  ],
                )),
          ),
        )
      ],
    );
  }
}

class PaymentResultTicket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        height: 490,
        margin: EdgeInsets.only(
          top: 10.0,
          bottom: 20.0,
        ),
        child: Stack(
          children: <Widget>[
            Image(
              image: purchasedTicket,
            ),
            Column(
              children: <Widget>[
                Container(
                  height: 400,
                  width: 729,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 80,
                        width: 500,
                        child: Center(
                          child: Text(
                            'Ticket number: 123-AB-1333-45',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontFamily: 'MyriadPro',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 320,
                        width: 700,
                      ),
                    ],
                  ),
                ),
                Container(
                    width: 729,
                    height: 90,
                    child: Center(
                      child: Container(
                        height: 90,
                        width: 649,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            bottomRight: Radius.circular(40.0),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Center(
                              child: Text(
                                'Transfer via Dnipro',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'MyriadPro',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                'The night between Mon. and Tu.',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'MyriadPro',
                                  fontWeight: FontWeight.w600,
                                  color: red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

