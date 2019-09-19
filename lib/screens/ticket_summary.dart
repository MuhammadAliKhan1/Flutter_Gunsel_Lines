import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/widgets/button.dart';

class TicketSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
      appBarIcon: backArrow,
      appBarIncluded: true,
      backgroundImage: scaffoldImg,
      bodyWidget: TicketSummaryScreen(),
      appBarTitle: 'Payment Info',
      appBarTitleIncluded: true,
      drawerIncluded: false,
    );
  }
}

class TicketSummaryScreen extends StatefulWidget {
  @override
  _TicketSummaryScreenState createState() => _TicketSummaryScreenState();
}

class _TicketSummaryScreenState extends State<TicketSummaryScreen> {
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
                        color: Colors.white,
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.w600)),
                Text(
                  "Details",
                  style: TextStyle(
                      color: Colors.white,
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
                      color: Colors.white,
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
                image: wizardThree,
              ),
            ),
          ],
        ),
        TicketSummaryTicket(),
        FittedBox(
          child: Container(
            width: 380,
            height: 180,
            child: Image(
              image: moneyImage,
            ),
          ),
        ),
        FittedBox(
          child: SizedBox(
            height: 3,
            width: 100,
          ),
        ),
        FittedBox(
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.only(top: 0.5),
            height: 4.0,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.all(
                Radius.circular(1),
              ),
            ),
            child: Center(
                child: Text(
              'Total Price:          1900 UAH',
              style: TextStyle(
                fontFamily: 'MyriadPro',
                color: darkBlue,
                fontWeight: FontWeight.w700,
                fontSize: 2.5,
              ),
            )),
          ),
        ),
        SizedBox(
          height: 14,
        ),
        Center(
            child: GunselButton(
          btnWidth: 600,
          btnFontFamily: 'Helvetica',
          btnText: 'Pay',
          textWeight: FontWeight.w800,
          btnTextFontSize: 40,
          btnTextColor: darkBlue,
          whenPressed: () {
            //Navigator.pushNamed(context, payScreen);
            Navigator.pushNamed(context, paymentResultScreen);
          },
        )),
      ],
    );
  }
}

class TicketSummaryTicket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        margin: EdgeInsets.only(
          top: 10.0,
          bottom: 10.0,
        ),
        height: 850,
        child: Stack(
          children: <Widget>[
            Image(
              image: bigTicket,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: 700,
                      width: 1380,
                    ),
                    Container(
                      height: 150,
                      width: 1380,
                      child: Center(
                        child: Container(
                          height: 150,
                          width: 1300,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(70.0),
                              bottomRight: Radius.circular(70.0),
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
                                      fontSize: 45,
                                      fontFamily: 'MyriadPro',
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Center(
                                child: Text(
                                  'The night between Mon. and Tu.',
                                  style: TextStyle(
                                    fontSize: 45,
                                    fontFamily: 'MyriadPro',
                                    fontWeight: FontWeight.w600,
                                    color: red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
