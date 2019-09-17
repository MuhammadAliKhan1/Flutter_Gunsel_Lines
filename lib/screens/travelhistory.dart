import 'package:gunsel/data/constants.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
      appBarIcon: menuIcon,
      appBarIncluded: true,
      backgroundImage: scaffoldImg,
      bodyWidget: HistoryScreen(),
      appBarTitle: 'History',
      appBarTitleIncluded: true,
      drawerIncluded: true,
    );
  }
}

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return HistoryTicket();
      },
    );
  }
}

class HistoryTicket extends StatefulWidget {
  @override
  _HistoryTicketState createState() => _HistoryTicketState();
}

class _HistoryTicketState extends State<HistoryTicket> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, selectSeatScreen);
        },
        child: FittedBox(
            child: Container(
          margin: EdgeInsets.only(top: 10.0),
          height: 112,
          child: Stack(
            children: <Widget>[
              Image(
                image: smallTicket,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 30.0, top: 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      SizedBox(
                        width: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            '13:40',
                            style: TextStyle(
                                color: darkBlue,
                                fontSize: 40,
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'DEPARTURE',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            '09.09.2019',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '15 seats',
                            style: TextStyle(
                              color: darkBlue,
                              fontSize: 15,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            '19:50',
                            style: TextStyle(
                                color: darkBlue,
                                fontSize: 40,
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'ARRIVAL',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            '', //Empty space as to not distur the alignment
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '',
                            style: TextStyle(
                              color: darkBlue,
                              fontSize: 15,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 45),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                height: 43,
                                child: Text(
                                  '420',
                                  style: TextStyle(
                                    color: darkBlue,
                                    fontSize: 50,
                                    fontFamily: 'Helvetica',
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Text(
                                'UAH', //Empty space as to not distur the alignment
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Neoplan TourLine (46)', //Empty space as to not distur the alignment
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 12,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        )));
  }
}
