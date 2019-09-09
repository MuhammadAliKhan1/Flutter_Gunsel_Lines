import 'package:gunsel/data/constants.dart';
import 'package:gunsel/widgets/button.dart';

class RoundWay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
      backgroundImage: scaffoldImg,
      appBarTitleIncluded: true,
      appBarTitle: 'Search Ticket',
      appBarIncluded: true,
      bodyWidget: SearchTicketContainer(),
      drawerIncluded: true,
    );
  }
}

class SearchTicketContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment:
            Alignment.lerp(Alignment.topCenter, Alignment.bottomCenter, 0.2),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.white),
          ),
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width / 1.05,
          child: ListView(
            children: <Widget>[
              SwitchBar(),
              RoundWayForm(),
            ],
          ),
        ));
  }
}

class SwitchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RaisedButton(
          child: Text(
            "ONE WAY",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          elevation: 0.0,
          splashColor: Colors.yellow,
          highlightElevation: 0.0,
          color: Colors.transparent,
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(
              '$oneWayScreen',
            );
          },
        ),
        RaisedButton(
          child: Text(
            "ROUND WAY",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          color: Colors.yellow,
          onPressed: () {},
        ),
      ],
    );
  }
}

class RoundWayForm extends StatefulWidget {
  @override
  _RoundWayFormState createState() => _RoundWayFormState();
}

class _RoundWayFormState extends State<RoundWayForm> {
  String date;
  int passengers;
  Future _selectDate() async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2019),
      lastDate: new DateTime(2050),
    );
    if (picked != null)
      setState(
        () => date = picked.toString(),
      );
  }

  //For number counter
  @override
  void initState() {
    super.initState();
    this.date = "2019/01/01";
    this.passengers = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.2,
              child: TextFormField(
                validator: (String passengers) {
                  if (passengers.isEmpty) {
                    return "Please enter departure city";
                  }
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.location_on),
                  hintText: 'Enter departure city',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.2,
              child: TextFormField(
                validator: (String passengers) {
                  if (passengers.isEmpty) {
                    return "Please enter departure city";
                  }
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.location_on),
                  hintText: 'Enter Arrival city',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.2,
            child: InkWell(
              onTap: () {
                _selectDate();
              },
              child: IgnorePointer(
                child: TextFormField(
                  //validator: validateDob,
                  validator: (String date) {
                    debugPrint("$passengers");
                  },
                  keyboardType: TextInputType.datetime,
                  //controller: ,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.date_range),
                      hintText: "${this.date}",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Number Of Passenger:",
                  textScaleFactor: this.passengers > 10 ? 1.0 : 1.1,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(width: 5.0),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: <Widget>[
                      //Plus icon
                      IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              this.passengers++;
                            },
                          );
                        },
                      ),

                      //Number
                      Text(
                        this.passengers.toString(),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      //Minus icon
                      IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              if (this.passengers > 0) this.passengers--;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GunselButton(
                btnWidth: 250,
                btnText: 'Change Station',
                btnTextFontSize: 27,
                btnTextColor: gunselColor,
                whenPressed: () {},
              ),
              GunselButton(
                whenPressed: () {},
                btnWidth: 250,
                btnText: 'Search',
                btnTextFontSize: 30,
                btnTextColor: gunselColor,
              ),
            ],
          )
        ],
      ),
    );
  }
}
