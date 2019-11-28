import 'package:gunsel/data/TransferWayModel.dart';

import 'constants.dart';
import 'package:http/http.dart' as http;

class TravelListOneWayModel {
  List<Data> data;
  TransferWayModel transferWayModelObj;
  TravelListOneWayModel({this.data});

  TravelListOneWayModel.fromJson(Map<String, dynamic> json) {
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

  Future getRoundWayFirstLegList(String arrivalStationID,
      String departureStationID, int year, int month, int day) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //language change
    int languageint =  prefs.getInt("languageIndicator");
    String languageChange = languageint.toString();
    print("language is:"+languageChange);
    print("https://api.gunsel.ua/Public.svc/GetTravelVariantList?c0=$departureStationID&c1=$arrivalStationID&c2=$year-$month-$day&c3=true&c4=true");
    http.Response response = await http.get(
      Uri.encodeFull(
          'https://api.gunsel.ua/Public.svc/GetTravelVariantList?c0=$departureStationID&c1=$arrivalStationID&c2=$year-$month-$day&c4=true'),
      headers: {
        'token': prefs.getString('Token'),
        'language' : languageChange,
      },
    );

    print(response);

    DataStatusSeperator seperator =
        DataStatusSeperator.fromJson(jsonDecode(response.body));
    if ((seperator.toJson()['Data']) != null) {
      Map<String, dynamic> map = {
        'Data': jsonDecode((seperator.toJson())['Data'])
      };
      if (map['Data'][0]['TravelVariantLeg2'] == null) {
        TravelListOneWayModel travelListModelObj =
            TravelListOneWayModel.fromJson(map);

        return travelListModelObj.toJson();
      } else {
        transferWayModelObj = TransferWayModel.fromJson(map);
        return transferWayModelObj.toJson();
      }
    } else
      return seperator.toJson();
  }

  Future getRoundWaySecondLegList(String arrivalStationID,
      String departureStationID, int year, int month, int day) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int languageint =  prefs.getInt("languageIndicator");
    String languageChange = languageint.toString();
    print("language is:"+languageChange);

    http.Response response = await http.get(
      Uri.encodeFull(
          'https://api.gunsel.ua/Public.svc/GetTravelVariantList?c0=$departureStationID&c1=$arrivalStationID&c2=$year-$month-$day&c3=true&c4=true'),
      headers: {
        'token': prefs.getString('Token'),
        'language' : languageChange,
      },
    );
    DataStatusSeperator seperator =
        DataStatusSeperator.fromJson(jsonDecode(response.body));
    if ((seperator.toJson()['Data']) != null) {
      Map<String, dynamic> map = {
        'Data': jsonDecode((seperator.toJson())['Data'])
      };

      if (map['Data'][0]['TravelVariantLeg2'] == null) {
        TravelListOneWayModel travelListModelObj =
            TravelListOneWayModel.fromJson(map);
        return travelListModelObj.toJson();
      } else {
        transferWayModelObj = TransferWayModel.fromJson(map);
        return transferWayModelObj.toJson();
      }
    } else
      return seperator.toJson();
  }
}

class Data {
  String travelId;
  String travelVariantId;
  int travelType;
  String tripCode;
  String tripName;
  String departureDate;
  String departureTime;
  String departureDateTime;
  String arrivalDate;
  String arrivalTime;
  String arrivalDateTime;
  String onTheWay;
  int emptySeatCount;
  double ticketPrice;
  bool isInternational;
  int distanceKM;
  int travelStatus;
  FromStation fromStation;
  FromStation toStation;
  Currency currency;
  VehicleType vehicleType;
  int availableSeatCount;
  Null travelVariantLeg2;

  Data(
      {this.travelId,
      this.travelVariantId,
      this.travelType,
      this.tripCode,
      this.tripName,
      this.departureDate,
      this.departureTime,
      this.departureDateTime,
      this.arrivalDate,
      this.arrivalTime,
      this.arrivalDateTime,
      this.onTheWay,
      this.emptySeatCount,
      this.ticketPrice,
      this.isInternational,
      this.distanceKM,
      this.travelStatus,
      this.fromStation,
      this.toStation,
      this.currency,
      this.vehicleType,
      this.availableSeatCount,
      this.travelVariantLeg2});

  Data.fromJson(Map<String, dynamic> json) {
    travelId = json['TravelId'];
    travelVariantId = json['TravelVariantId'];
    travelType = json['TravelType'];
    tripCode = json['TripCode'];
    tripName = json['TripName'];
    departureDate = json['DepartureDate'];
    departureTime = json['DepartureTime'];
    departureDateTime = json['DepartureDateTime'];
    arrivalDate = json['ArrivalDate'];
    arrivalTime = json['ArrivalTime'];
    arrivalDateTime = json['ArrivalDateTime'];
    onTheWay = json['OnTheWay'];
    emptySeatCount = json['EmptySeatCount'];
    ticketPrice = json['TicketPrice'];
    isInternational = json['IsInternational'];
    distanceKM = json['DistanceKM'];
    travelStatus = json['TravelStatus'];
    fromStation = json['FromStation'] != null
        ? new FromStation.fromJson(json['FromStation'])
        : null;
    toStation = json['ToStation'] != null
        ? new FromStation.fromJson(json['ToStation'])
        : null;
    currency = json['Currency'] != null
        ? new Currency.fromJson(json['Currency'])
        : null;
    vehicleType = json['VehicleType'] != null
        ? new VehicleType.fromJson(json['VehicleType'])
        : null;
    availableSeatCount = json['AvailableSeatCount'];
    travelVariantLeg2 = json['TravelVariantLeg2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TravelId'] = this.travelId;
    data['TravelVariantId'] = this.travelVariantId;
    data['TravelType'] = this.travelType;
    data['TripCode'] = this.tripCode;
    data['TripName'] = this.tripName;
    data['DepartureDate'] = this.departureDate;
    data['DepartureTime'] = this.departureTime;
    data['DepartureDateTime'] = this.departureDateTime;
    data['ArrivalDate'] = this.arrivalDate;
    data['ArrivalTime'] = this.arrivalTime;
    data['ArrivalDateTime'] = this.arrivalDateTime;
    data['OnTheWay'] = this.onTheWay;
    data['EmptySeatCount'] = this.emptySeatCount;
    data['TicketPrice'] = this.ticketPrice;
    data['IsInternational'] = this.isInternational;
    data['DistanceKM'] = this.distanceKM;
    data['TravelStatus'] = this.travelStatus;
    if (this.fromStation != null) {
      data['FromStation'] = this.fromStation.toJson();
    }
    if (this.toStation != null) {
      data['ToStation'] = this.toStation.toJson();
    }
    if (this.currency != null) {
      data['Currency'] = this.currency.toJson();
    }
    if (this.vehicleType != null) {
      data['VehicleType'] = this.vehicleType.toJson();
    }
    data['AvailableSeatCount'] = this.availableSeatCount;
    data['TravelVariantLeg2'] = this.travelVariantLeg2;
    return data;
  }
}

class FromStation {
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

  FromStation(
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

  FromStation.fromJson(Map<String, dynamic> json) {
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

class Currency {
  String currencyId;
  String currencyCode;
  String currencyName;
  String symbol;
  bool isDefault;

  Currency(
      {this.currencyId,
      this.currencyCode,
      this.currencyName,
      this.symbol,
      this.isDefault});

  Currency.fromJson(Map<String, dynamic> json) {
    currencyId = json['CurrencyId'];
    currencyCode = json['CurrencyCode'];
    currencyName = json['CurrencyName'];
    symbol = json['Symbol'];
    isDefault = json['IsDefault'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CurrencyId'] = this.currencyId;
    data['CurrencyCode'] = this.currencyCode;
    data['CurrencyName'] = this.currencyName;
    data['Symbol'] = this.symbol;
    data['IsDefault'] = this.isDefault;
    return data;
  }
}

class VehicleType {
  String vehicleTypeId;
  String vehicleTypeName;
  String vehicleTypeCode;
  int vehicleCategory;
  List<Properties> properties;

  VehicleType(
      {this.vehicleTypeId,
      this.vehicleTypeName,
      this.vehicleTypeCode,
      this.vehicleCategory,
      this.properties});

  VehicleType.fromJson(Map<String, dynamic> json) {
    vehicleTypeId = json['VehicleTypeId'];
    vehicleTypeName = json['VehicleTypeName'];
    vehicleTypeCode = json['VehicleTypeCode'];
    vehicleCategory = json['VehicleCategory'];
    if (json['Properties'] != null) {
      properties = new List<Properties>();
      json['Properties'].forEach((v) {
        properties.add(new Properties.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['VehicleTypeId'] = this.vehicleTypeId;
    data['VehicleTypeName'] = this.vehicleTypeName;
    data['VehicleTypeCode'] = this.vehicleTypeCode;
    data['VehicleCategory'] = this.vehicleCategory;
    if (this.properties != null) {
      data['Properties'] = this.properties.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Properties {
  String dBPropertyId;
  String propertyName;
  String imageURL;
  bool isSelected;

  Properties(
      {this.dBPropertyId, this.propertyName, this.imageURL, this.isSelected});

  Properties.fromJson(Map<String, dynamic> json) {
    dBPropertyId = json['DBPropertyId'];
    propertyName = json['PropertyName'];
    imageURL = json['ImageURL'];
    isSelected = json['IsSelected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DBPropertyId'] = this.dBPropertyId;
    data['PropertyName'] = this.propertyName;
    data['ImageURL'] = this.imageURL;
    data['IsSelected'] = this.isSelected;
    return data;
  }
}
