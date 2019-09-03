import 'package:flutter/material.dart';
import 'package:gunsel/screens/payment_result.dart';

class TicketSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/BG.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          height: double.infinity,
          width: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: PaymentScreen(),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text("Payment Info"),
            elevation: 0.0,
            centerTitle: true,
          ),
        )
      ],
    );
  }
}

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      "Your seat",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Details",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Purchase Details",
                      style: TextStyle(color: Colors.yellow),
                    ),
                    Text(
                      "Purchase",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: <Widget>[
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset("images/3.png"),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Center(
          child: Container(
            height: 240.0,
            width: MediaQuery.of(context).size.width - 20,
            child: Stack(
              children: <Widget>[
                Image.asset(
                  "images/bigticket.png",
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
                )
              ],
            ),
          ),
        ),
        Center(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: 200.0,
              child: Image.asset("images/money.png")),
        ),
        Center(
          child: Container(
            child: Center(
              child: Text(
                "Total Price:         1900 UAH",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blue,
                ),
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
        SizedBox(
          height: 30,
        ),
        Center(
          child: ButtonTheme(
            buttonColor: Colors.yellow,
            minWidth: MediaQuery.of(context).size.width - 40,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              )),
              child: Text("Pay",
                  style: TextStyle(color: Colors.blue, fontSize: 18.0)),
              elevation: 3.0,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentResult()),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
