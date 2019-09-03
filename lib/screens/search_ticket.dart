import 'package:flutter/material.dart';
import 'package:gunsel/screens/ticket_container.dart';

final Color gunselColor = Color(0xff035EA7);

class SearchTicket extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchTicketState();
  }
}

class SearchTicketState extends State<SearchTicket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gunselColor,
      appBar: AppBar(
        backgroundColor: gunselColor,
        title: Text("Search Ticket"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: TicketView(),
    );
  }
}

class TicketView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TicketViewState();
  }
}

class TicketViewState extends State<TicketView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(left: 5.0, right: 5.0),
      children: <Widget>[
        Stack(
          children: <Widget>[
            getTicketContainer(),
            Align(
              alignment: Alignment.topLeft,
              child: getSliderLeft(),
            ),
            Align(
              alignment: Alignment.topRight,
              child: getSliderRight(),
            )
          ],
        ),
        TicketContainer(),
        TicketContainer(),
        TicketContainer(),
        TicketContainer(),
        TicketContainer(),
        TicketContainer(),
      ],
    );
  }

  getSliderLeft() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ButtonTheme(
            height: 80.0,
            minWidth: 80.0,
            child: RaisedButton.icon(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              color: Colors.yellow,
              icon: Icon(
                Icons.arrow_back_ios,
                color: gunselColor,
                size: 40.0,
              ),
              label: Text(""),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  getSliderRight() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ButtonTheme(
            height: 80.0,
            minWidth: 70.0,
            child: RaisedButton.icon(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              color: Colors.yellow,
              icon: Icon(
                Icons.arrow_forward_ios,
                color: gunselColor,
                size: 40.0,
              ),
              label: Text(""),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  getTicketContainer() {
    return Center(
      child: Container(
        width: 400,
        height: 80.0,
        color: Colors.black.withOpacity(0.4),
        alignment: Alignment.center,
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 5.0,
            ),
            Text(
              "Odessa->Kyiv",
              style: TextStyle(color: Colors.white),
            ),
            Container(
              height: 20.0,
            ),
            Text(
              "23.08.2019",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
