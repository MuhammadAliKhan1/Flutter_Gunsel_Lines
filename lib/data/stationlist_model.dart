class StationList {
  List<Data> data;

  StationList({this.data});

  StationList.fromJson(Map<String, dynamic> json) {
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
}

class Data {
  String stationId;
  int stationCategory;
  String stationName;
  String stationCode;
  String address;
  String countryId;
  String countryName;
  String cityId;
  String cityName;
  double mapX;
  double mapY;
  String translations;

  Data(
      {this.stationId,
        this.stationCategory,
        this.stationName,
        this.stationCode,
        this.address,
        this.countryId,
        this.countryName,
        this.cityId,
        this.cityName,
        this.mapX,
        this.mapY,
        this.translations});

  Data.fromJson(Map<String, dynamic> json) {
    stationId = json['StationId'];
    stationCategory = json['StationCategory'];
    stationName = json['StationName'];
    stationCode = json['StationCode'];
    address = json['Address'];
    countryId = json['CountryId'];
    countryName = json['CountryName'];
    cityId = json['CityId'];
    cityName = json['CityName'];
    mapX = json['MapX'];
    mapY = json['MapY'];
    translations = json['Translations'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StationId'] = this.stationId;
    data['StationCategory'] = this.stationCategory;
    data['StationName'] = this.stationName;
    data['StationCode'] = this.stationCode;
    data['Address'] = this.address;
    data['CountryId'] = this.countryId;
    data['CountryName'] = this.countryName;
    data['CityId'] = this.cityId;
    data['CityName'] = this.cityName;
    data['MapX'] = this.mapX;
    data['MapY'] = this.mapY;
    data['Translations'] = this.translations;
    return data;
  }
}