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
  //Map<String, dynamic> stationListMapdata;
  List conName = [];
  List conText = [];
  List conImage = [];
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
    conName.clear();
    conText.clear();
    conImage.clear();
    for(int i=0 ; i<stationListMap['Data'].length;i++) {
      if (!(stationListMap['Data'][i]['BigImage'] == "" || stationListMap['Data'][i]['BigImage'] == null ||stationListMap['Data'][i]['ContentName'] == "" || stationListMap['Data'][i]['ContentName'] == null || stationListMap['Data'][i]['Text'] == "" || stationListMap['Data'][i]['Text'] == null )){
        conName.add(_parseHtmlString(stationListMap['Data'][i]['ContentName']));
        conText.add(_parseHtmlString(stationListMap['Data'][i]['Text']));
        conImage.add(stationListMap['Data'][i]['BigImage']);

      print(i);
      }
    }
      print("Con name is:"+conName.length.toString());
      for(int j=0; j<conName.length;j++)
        {
          print(conName[j]);
        }


//    print(this._parseHtmlString(stationListMap['Data'][0]['ContentName']));
//    print(imageUrl + stationListMap['Data'][0]['BigImage']);
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
                              Image.network(
                                  imageUrl +
                                      conImage[0],
                                  fit: BoxFit.fill),
                              Image.network(
                                  imageUrl +
                                      conImage[1],
                                  fit: BoxFit.fill),
                              Image.network(
                                  imageUrl +
                                      conImage[2],
                                  fit: BoxFit.fill),
                              Image.network(
                                  imageUrl +
                                      conImage[3],
                                  fit: BoxFit.fill),
                              Image.network(
                                  imageUrl +
                                      conImage[4],
                                  fit: BoxFit.fill)
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
                                              title: conName[index],
                                              text: conText[index],
                                              imageURL: imageUrl +
                                                  conImage[index])));
                                },
                                child: Row(
                                  children: <Widget>[
                                    Flexible(
                                        child: Container(
                                            padding: EdgeInsets.only(
                                                left: 5.0,
                                                right: 5.0,
                                            top: 3.0,
                                            bottom: 10.0),
                                            child: Image.network(
                                                imageUrl +
                                                    conImage[index],
                                                height: 110.0,
                                                width: 150.0,
                                                fit: BoxFit.fill))),
                                    Flexible(
                                      child: Container(
                                          height: 100.0,
                                          child: RichText(
                                              text:
                                                  TextSpan(children: <TextSpan>[
                                            TextSpan(
                                                text: conName[index],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontFamily: "MyriadPro")),
                                            TextSpan(
                                                text: "\n"+conText[index].trim(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "MyriadPro"))
                                          ]))),
                                    )
                                  ],
                                )),
                          ],
                        );
                      }, childCount: conName.length),
                    )
                  ],
                );
              }
            }));
  }
}
