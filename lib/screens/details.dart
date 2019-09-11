import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DetailState();
  }
}

class DetailState extends State<Detail> {
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
          body: DetailScreen(),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text("Voyagers Information"),
            elevation: 0.0,
            centerTitle: true,
          ),
        )
      ],
    );
  }
}

class DetailScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DetailScreenState();
  }
}

class DetailScreenState extends State<DetailScreen> {
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
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: <Widget>[
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset("images/2.png"),
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
        Container(
          height: 55.0,
          child: ListTile(
            contentPadding: EdgeInsets.only(
              top: 10.0,
              left: 15.0,
              right: 15.0,
            ),
            leading: Text(
              "1.Voyager Information",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
            trailing: Text(
              "Seat: 34",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
          ),
        ),
        DetailForm(),
      ],
    );
  }
}

class DetailForm extends StatefulWidget {
  @override
  DetailFormState createState() {
    return DetailFormState();
  }
}

class DetailFormState extends State<DetailForm> {
  final _formKey = GlobalKey<FormState>();
  bool checkOneVal = false;
  bool checkTwoVal = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 40.0,
                width: MediaQuery.of(context).size.width / 2.05,
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    hintText: "Name",
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0.0)),
                  ),
                ),
              ),
              Container(
                height: 40.0,
                width: MediaQuery.of(context).size.width / 2.05,
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    hintText: "Surname",
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0.0)),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 40.0,
                width: MediaQuery.of(context).size.width / 2.05,
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0.0)),
                  ),
                ),
              ),
              Container(
                height: 40.0,
                width: MediaQuery.of(context).size.width / 2.05,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    icon: Container(
                      width: 50.0,
                      color: Colors.white,
                    ),
                    contentPadding: EdgeInsets.all(10.0),
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0.0)),
                  ),
                ),
              ),
            ],
          ),
          CheckboxListTile(
            title: Text(
              "I read the agreement and I agree",
              style: TextStyle(color: Colors.red),
            ),
            onChanged: (bool value) {
              setState(() {
                checkTwoVal = value;
              });
            },
            value: checkTwoVal,
          ),
          CheckboxListTile(
            title: Text("I want to be subscriber",
                style: TextStyle(color: Colors.red)),
            onChanged: (bool value) {
              setState(() {
                checkOneVal = value;
              });
            },
            value: checkOneVal,
          ),
          Padding(
            child: Align(
              alignment: Alignment.topCenter,
              child: ButtonTheme(
                minWidth: MediaQuery.of(context).size.width - 50,
                child: RaisedButton(
                  child: Text(
                    "Search",
                    textScaleFactor: 1.5,
                  ),
                  highlightColor: Colors.yellow,
                  color: Colors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0)),
                  ),
                  onPressed: () {
                    setState(
                      () {
                        Navigator.pushNamed(context, "TicketSummaryScreen");
                      },
                    );
                  },
                ),
              ),
            ),
            padding: EdgeInsets.only(top: 50.0),
          ),
        ],
      ),
    );
  }
}
