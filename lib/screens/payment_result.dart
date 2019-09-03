import 'package:flutter/material.dart';

final Color gunselColor = Color(0xff035EA7);

class PaymentResult extends StatelessWidget {
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
          body: PaymentResultScreen(),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text("Passenger Details"),
            elevation: 0.0,
            centerTitle: true,
          ),
        )
      ],
    );
  }
}

class PaymentResultScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PaymentResultScreenState();
  }
}

class PaymentResultScreenState extends State<PaymentResultScreen> {
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
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Purchase",
                      style: TextStyle(color: Colors.yellow),
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
                        child: Image.asset("images/4.png"),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Center(
          child: Container(
            height: 270.0,
            width: MediaQuery.of(context).size.width - 20,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Image.asset(
                    "images/bigticket.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    child: Center(
                      child: Text(
                        "Ticket Number: 123-AB-1333-45",
                        style: TextStyle(fontSize: 17.0, color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width - 50,
                    height: 40.0,
                  ),
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
        SizedBox(
          height: 30.0,
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
                                      fontSize: 20.0, color: Colors.blue),
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
                                  buttonColor: Colors.blue,
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
