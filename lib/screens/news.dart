import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:gunsel/data/constants.dart';
import 'package:gunsel/screens/article.dart';
import "package:gunsel/data/newsDataModel.dart";
import 'package:html/parser.dart';
import 'package:gunsel/widgets/scaffold.dart';
import 'package:gunsel/data/sharedPreference.dart';

final Color gunselColor = Color(0xff035EA7);

class News extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewsState();
}

class _NewsState extends State<News> {
  SharePreferencelogin sh = SharePreferencelogin();
  String news = "News";

  void newslan() async {
    int b;
    int a = await sh.getshared1();

    setState(() {
      b = a;

      if (b == 1) {
        news = "Новини";
      } else if (b == 2) {
        news = "News";
      } else if (b == 3) {
        news = "Новости";
      }
    });
  }

  //For hiding HTML tag
  String _parseHtmlString(String htmlString) {
    var document = parse(htmlString);
    String parsedString = parse(document.body.text).documentElement.text;
    return parsedString;
  }

  //Backend
  Map<String, dynamic> stationListMap;
  Map<String, dynamic> stationListMapdata;
  NewDataModel stationListObj = NewDataModel();
  bool dataFetched = false;
  String imageUrl = "https://test-lines-api.gunsel.ua/Files/";
  @override
  void initState() {
    super.initState();
    getData();
    newslan();
  }

  getData() {
    getStationList(context);
  }

  Future getStationList(BuildContext context) async {
    stationListMap = await stationListObj.getStationListFromAPI();
    print(this._parseHtmlString(stationListMap['Data'][0]['ContentName']));
    print(imageUrl + stationListMap['Data'][0]['BigImage']);
  }

  String _parseHtmlStrings(String htmlString) {
    var document = parse(htmlString);
    String parsedString = parse(document.body.text).documentElement.text;
    return "\n" + parsedString;
  }

  @override
  Widget build(BuildContext context) {
    return GunselScaffold(
        appBarIcon: menuIcon,
        appBarIncluded: true,
        appBarTitle: news,
        appBarTitleIncluded: true,
        drawerIncluded: true,
        appBarColor: gunselColor,
        backgroundImage: whiteImage,
        bodyWidget: FutureBuilder(
            future: getStationList(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(
                  child: Image(
                    image: loadingAnim,
                    height: ScreenUtil().setSp(150),
                  ),
                );
              else {
                return CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildListDelegate([
                        Container(
                          height: 200.0,
                          padding:
                              EdgeInsets.only(top: 5.0, right: 5.0, left: 5.0),
                          width: double.infinity,
                          child: Carousel(
                            images: [
                              Image.network(imageUrl +
                                  stationListMap['Data'][0]['BigImage']),
                              Image.network(imageUrl +
                                  stationListMap['Data'][1]['BigImage']),
                              Image.network(imageUrl +
                                  stationListMap['Data'][2]['BigImage']),
                              Image.network(imageUrl +
                                  stationListMap['Data'][3]['BigImage']),
                              Image.network(imageUrl +
                                  stationListMap['Data'][4]['BigImage'])
                            ],
                            autoplay: true,
                            indicatorBgPadding: 10.0,
                            dotColor: Colors.blueAccent,
                            dotBgColor: Colors.transparent,
                            dotSize: 5.0,
                          ),
                        ),
                      ]),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ArticleScreen(
                                              title: _parseHtmlStrings(
                                                  stationListMap['Data'][index]
                                                      ['ContentName']),
                                              text: _parseHtmlStrings(
                                                  stationListMap['Data'][index]
                                                      ['Text']),
                                              imageURL: imageUrl +
                                                  stationListMap['Data'][index]
                                                      ['BigImage'])));
                                },
                                child: Row(
                                  children: <Widget>[
                                    Flexible(
                                        child: Container(
                                            padding: EdgeInsets.only(
                                                left: 5.0, right: 5.0),
                                            child: Image.network(
                                                imageUrl +
                                                    stationListMap['Data']
                                                        [index]['BigImage'],
                                                height: 110.0,
                                                width: 150.0))),
                                    Flexible(
                                      child: Container(
                                          height: 100.0,
                                          child: RichText(
                                              text:
                                                  TextSpan(children: <TextSpan>[
                                            TextSpan(
                                                text: stationListMap['Data']
                                                    [index]['ContentName'],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontFamily: "MyriadPro")),
                                            TextSpan(
                                                text: _parseHtmlStrings(
                                                    stationListMap['Data']
                                                        [index]['Text']),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "MyriadPro"))
                                          ]))),
                                    )
                                  ],
                                )),
                          ],
                        );
                      }, childCount: stationListMap['Data'].length),
                    )
                  ],
                );
              }
            }));
  }
}
