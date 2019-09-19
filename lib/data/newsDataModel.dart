import 'dart:convert';

import 'package:http/http.dart' as http;

class NewDataModel {
  List<Data> data;
  String token =
      '8D77D139A458087F5036B75FE5815ACB229A2326A7B39582321979F9BF709584B610778A1C0EC001B105A91E8AE0A85A1DE193B64074D64691C926614B9ABBB4975FB0197D9C0EF891158FE6124A668C34A514B187DF07F2255AF7B1B69ACD603F0872BFFC405C21A31FCD11A6609DA6FE63CFF2139C6F2D648E365FEEB05722F8D326000528D2CBAC6B321F4FA4BA47F4B0F901D3ECD44C4CDFE651B2B008125298F912E162A3ED9E8FB6FCA191C3D58219152A8466C035DADED9EEAD1938982C1C0EA648E4CE8CA4A5961C8DE732DFE3E5F699428249F35E3210A193052854DD2856121E960AFEC1FB90F7100C5A70FB7C2579D3F90420118C263E2A32666AECEC280F0CBEA7FF9B7D1117A1C1CC7488CF9CE6050551F43C733A9A9CC9F62F54F8316B4D1E7267381DA90157ABC215306F5E0F7D425D4CB7264D794BE44A592CBBE2B6CF5C00F8ED6A73F2FD91DBC67AD90C4326E3840F81E4B39BA2F83FF4';
  String StationListAPI =
      'https://test-lines-api.gunsel.ua/Public.svc/GetContentList?c0=1040,1041';
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
    http.Response response = await http.get(
      Uri.encodeFull(
          'https://test-lines-api.gunsel.ua/Public.svc/GetContentList?c0=1040,1041'),
      headers: {
        'token': token,
      },
    );
    Map<String, dynamic> map = {
      'Data': jsonDecode(jsonDecode(response.body)['Data'])
    };

    //print("Map is:" + map.toString());
    NewDataModel stationListObj = NewDataModel.fromJson(map);

    Map<String, dynamic> stationListMap = stationListObj.toJson();

    //print("Stationlistmap" + stationListMap.toString());
    print(
        "Station list map length:" + stationListMap['Data'].length.toString());

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
