import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';

class TicketSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
      appBarIcon: backArrow,
      appBarIncluded: true,
      backgroundImage: scaffoldImg,
      appBarTitle: 'Payment info',
      appBarTitleIncluded: true,
      bodyWidget: TicketSummaryScreen(),
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
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "Purchase",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: wizardThree,
                  height: ScreenUtil().setSp(40),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          height: ScreenUtil().setSp(400),
          child: Stack(
            children: <Widget>[
              Image.asset(
                "assets/bigticket.png",
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
        Image(
          image: moneyImage,
          height: ScreenUtil().setSp(300),
        ),
        Center(
          child: Container(
            child: Center(
              child: Text(
                "Total Price:         1900 UAH",
                style: TextStyle(
                    fontSize: 20.0,
                    color: darkBlue,
                    fontWeight: FontWeight.w600),
              ),
            ),
            width: MediaQuery.of(context).size.width - 20,
            height: 50.0,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
        ),
        Center(
          child: ButtonTheme(
            buttonColor: Colors.yellow,
            minWidth: MediaQuery.of(context).size.width - 40,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              )),
              child: Text("Pay",
                  style: TextStyle(color: darkBlue, fontSize: 18.0)),
              elevation: 3.0,
              onPressed: () {
                Navigator.pushNamed(context, paymentResultScreen);
              },
            ),
          ),
        )
      ],
    );
  }
}
