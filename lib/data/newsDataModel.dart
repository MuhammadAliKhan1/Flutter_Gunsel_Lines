import 'dart:convert';

import 'package:http/http.dart' as http;
import 'sharedPreference.dart';

class NewDataModel {
  SharePreferencelogin shPref = SharePreferencelogin();
  List<Data> data;
  String token = "";
  String StationListAPI = 'https://'
      'lines-api.gunsel.ua/Public.svc/GetContentList?c0=1040,1041';
  NewDataModel({this.data});

  NewDataModel.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = new List<Data>();
      json['Data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Future<Map<String, dynamic>> getStationListFromAPI() async {
    token = await shPref.gettokens();
    int languageint = await shPref.getshared1();
    String languageChange = languageint.toString();

    print("news token is:" + token.toString());
    print("Language is:" + languageChange);

    http.Response response = await http.get(
      Uri.encodeFull(
          'https://lines-api.gunsel.ua/Public.svc/GetContentList?c0=1040,1041'),
      headers: {
        'token': token,
        'language': languageChange,
      },
    );
    Map<String, dynamic> map = {
      'Data': jsonDecode(jsonDecode(response.body)['Data'])
    };

    //print("Map is:" + map.toString());
    NewDataModel stationListObj = NewDataModel.fromJson(map);

    Map<String, dynamic> stationListMap = stationListObj.toJson();

    //print("Stationlistmap" + stationListMap.toString());

    return stationListObj.toJson();
  }
}

class Data {
  String contentId;
  int contentType;
  String contentName;
  String startDate;
  Null endDate;
  String clickAction;
  String title;
  String text;
  String tags;
  int smallImageFileLocation;
  String smallImage;
  int bigImageFileLocation;
  String bigImage;
  bool showInWeb;
  bool showInResponsive;
  bool showInMobileApp;

  Data(
      {this.contentId,
      this.contentType,
      this.contentName,
      this.startDate,
      this.endDate,
      this.clickAction,
      this.title,
      this.text,
      this.tags,
      this.smallImageFileLocation,
      this.smallImage,
      this.bigImageFileLocation,
      this.bigImage,
      this.showInWeb,
      this.showInResponsive,
      this.showInMobileApp});

  Data.fromJson(Map<String, dynamic> json) {
    contentId = json['ContentId'];
    contentType = json['ContentType'];
    contentName = json['ContentName'];
    startDate = json['StartDate'];
    endDate = json['EndDate'];
    clickAction = json['ClickAction'];
    title = json['Title'];
    text = json['Text'];
    tags = json['Tags'];
    smallImageFileLocation = json['SmallImageFileLocation'];
    smallImage = json['SmallImage'];
    bigImageFileLocation = json['BigImageFileLocation'];
    bigImage = json['BigImage'];
    showInWeb = json['ShowInWeb'];
    showInResponsive = json['ShowInResponsive'];
    showInMobileApp = json['ShowInMobileApp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ContentId'] = this.contentId;
    data['ContentType'] = this.contentType;
    data['ContentName'] = this.contentName;
    data['StartDate'] = this.startDate;
    data['EndDate'] = this.endDate;
    data['ClickAction'] = this.clickAction;
    data['Title'] = this.title;
    data['Text'] = this.text;
    data['Tags'] = this.tags;
    data['SmallImageFileLocation'] = this.smallImageFileLocation;
    data['SmallImage'] = this.smallImage;
    data['BigImageFileLocation'] = this.bigImageFileLocation;
    data['BigImage'] = this.bigImage;
    data['ShowInWeb'] = this.showInWeb;
    data['ShowInResponsive'] = this.showInResponsive;
    data['ShowInMobileApp'] = this.showInMobileApp;
    return data;
  }
}
