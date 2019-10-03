import 'constants.dart';
import 'package:http/http.dart' as http;

class SelectSeatModel {
  Data data;

  SelectSeatModel({this.data});

  SelectSeatModel.fromJson(Map<String, dynamic> json) {
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data.toJson();
    }
    return data;
  }

  Future getSeatsData(String travelVariantId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    http.Response response = await http.get(
      Uri.encodeFull(
          'https://test-api.gunsel.ua/Public.svc/GetTravelVariantDetails/$travelVariantId'),
      headers: {
        'token': prefs.getString('Token'),
      },
    );
    DataStatusSeperator seperator =
        DataStatusSeperator.fromJson(jsonDecode(response.body));
    if ((seperator.toJson()['Data']) != null) {
      Map<String, dynamic> map = {
        'Data': jsonDecode((seperator.toJson())['Data'])
      };
      SelectSeatModel selectSeatModelObj = SelectSeatModel.fromJson(map);
      return selectSeatModelObj.toJson();
    } else
      return seperator.toJson();
  }
}

class Data {
  String fromStationId;
  String fromStationName;
  String toStationId;
  String toStationName;
  String travelDate;
  String travelTime;
  VehicleTypeModel vehicleTypeModel;
  List<TravelStations> travelStations;
  List<dynamic> discountTypes;
  bool officeCustomerNameRequired;
  bool officeCustomerPhoneNumberRequired;
  bool officeCustomerEmailRequired;
  bool publicCustomerNameRequired;
  bool publicCustomerPhoneNumberRequired;
  bool publicCustomerEmailRequired;
  String remainingSaleableSeatCount;
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
  String fromStation;
  String toStation;
  Currency currency;
  String vehicleType;
  int availableSeatCount;
  String travelVariantLeg2;

  Data(
      {this.fromStationId,
      this.fromStationName,
      this.toStationId,
      this.toStationName,
      this.travelDate,
      this.travelTime,
      this.vehicleTypeModel,
      this.travelStations,
      this.discountTypes,
      this.officeCustomerNameRequired,
      this.officeCustomerPhoneNumberRequired,
      this.officeCustomerEmailRequired,
      this.publicCustomerNameRequired,
      this.publicCustomerPhoneNumberRequired,
      this.publicCustomerEmailRequired,
      this.remainingSaleableSeatCount,
      this.travelId,
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
    fromStationId = json['FromStationId'];
    fromStationName = json['FromStationName'];
    toStationId = json['ToStationId'];
    toStationName = json['ToStationName'];
    travelDate = json['TravelDate'];
    travelTime = json['TravelTime'];
    vehicleTypeModel = json['VehicleTypeModel'] != null
        ? new VehicleTypeModel.fromJson(json['VehicleTypeModel'])
        : null;
    if (json['TravelStations'] != null) {
      travelStations = new List<TravelStations>();
      json['TravelStations'].forEach((v) {
        travelStations.add(new TravelStations.fromJson(v));
      });
    }
    if (json['DiscountTypes'] != null) {
      discountTypes = json['DiscountTypes'];
    }
    officeCustomerNameRequired = json['OfficeCustomerNameRequired'];
    officeCustomerPhoneNumberRequired =
        json['OfficeCustomerPhoneNumberRequired'];
    officeCustomerEmailRequired = json['OfficeCustomerEmailRequired'];
    publicCustomerNameRequired = json['PublicCustomerNameRequired'];
    publicCustomerPhoneNumberRequired =
        json['PublicCustomerPhoneNumberRequired'];
    publicCustomerEmailRequired = json['PublicCustomerEmailRequired'];
    remainingSaleableSeatCount = json['RemainingSaleableSeatCount'];
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
    fromStation = json['FromStation'];
    toStation = json['ToStation'];
    currency = json['Currency'] != null
        ? new Currency.fromJson(json['Currency'])
        : null;
    vehicleType = json['VehicleType'];
    availableSeatCount = json['AvailableSeatCount'];
    travelVariantLeg2 = json['TravelVariantLeg2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FromStationId'] = this.fromStationId;
    data['FromStationName'] = this.fromStationName;
    data['ToStationId'] = this.toStationId;
    data['ToStationName'] = this.toStationName;
    data['TravelDate'] = this.travelDate;
    data['TravelTime'] = this.travelTime;
    if (this.vehicleTypeModel != null) {
      data['VehicleTypeModel'] = this.vehicleTypeModel.toJson();
    }
    if (this.travelStations != null) {
      data['TravelStations'] =
          this.travelStations.map((v) => v.toJson()).toList();
    }
    if (this.discountTypes != null) {
      data['DiscountTypes'] = this.discountTypes;
    }
    data['OfficeCustomerNameRequired'] = this.officeCustomerNameRequired;
    data['OfficeCustomerPhoneNumberRequired'] =
        this.officeCustomerPhoneNumberRequired;
    data['OfficeCustomerEmailRequired'] = this.officeCustomerEmailRequired;
    data['PublicCustomerNameRequired'] = this.publicCustomerNameRequired;
    data['PublicCustomerPhoneNumberRequired'] =
        this.publicCustomerPhoneNumberRequired;
    data['PublicCustomerEmailRequired'] = this.publicCustomerEmailRequired;
    data['RemainingSaleableSeatCount'] = this.remainingSaleableSeatCount;
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
    data['FromStation'] = this.fromStation;
    data['ToStation'] = this.toStation;
    if (this.currency != null) {
      data['Currency'] = this.currency.toJson();
    }
    data['VehicleType'] = this.vehicleType;
    data['AvailableSeatCount'] = this.availableSeatCount;
    data['TravelVariantLeg2'] = this.travelVariantLeg2;
    return data;
  }
}

class VehicleTypeModel {
  int rowCount;
  int columnCount;
  List<VehicleTypePlanItems> vehicleTypePlanItems;
  String vehicleTypeId;
  String vehicleTypeName;
  String vehicleTypeCode;
  int vehicleCategory;
  List<dynamic> properties;

  VehicleTypeModel(
      {this.rowCount,
      this.columnCount,
      this.vehicleTypePlanItems,
      this.vehicleTypeId,
      this.vehicleTypeName,
      this.vehicleTypeCode,
      this.vehicleCategory,
      this.properties});

  VehicleTypeModel.fromJson(Map<String, dynamic> json) {
    rowCount = json['RowCount'];
    columnCount = json['ColumnCount'];
    if (json['VehicleTypePlanItems'] != null) {
      vehicleTypePlanItems = new List<VehicleTypePlanItems>();
      json['VehicleTypePlanItems'].forEach((v) {
        vehicleTypePlanItems.add(new VehicleTypePlanItems.fromJson(v));
      });
    }
    vehicleTypeId = json['VehicleTypeId'];
    vehicleTypeName = json['VehicleTypeName'];
    vehicleTypeCode = json['VehicleTypeCode'];
    vehicleCategory = json['VehicleCategory'];
    if (json['Properties'] != null) {
      properties = new List<dynamic>();
      json['Properties'] = json['Properties'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RowCount'] = this.rowCount;
    data['ColumnCount'] = this.columnCount;
    if (this.vehicleTypePlanItems != null) {
      data['VehicleTypePlanItems'] =
          this.vehicleTypePlanItems.map((v) => v.toJson()).toList();
    }
    data['VehicleTypeId'] = this.vehicleTypeId;
    data['VehicleTypeName'] = this.vehicleTypeName;
    data['VehicleTypeCode'] = this.vehicleTypeCode;
    data['VehicleCategory'] = this.vehicleCategory;
    if (this.properties != null) {
      data['Properties'] = this.properties;
    }
    return data;
  }
}

class VehicleTypePlanItems {
  String vehicleTypePlanId;
  int rowIndex;
  int columnIndex;
  int pointType;
  String pointTypeDesc;
  int pointNumber;
  int seatStatus;
  String travelSeatBlockId;

  VehicleTypePlanItems(
      {this.vehicleTypePlanId,
      this.rowIndex,
      this.columnIndex,
      this.pointType,
      this.pointTypeDesc,
      this.pointNumber,
      this.seatStatus,
      this.travelSeatBlockId});

  VehicleTypePlanItems.fromJson(Map<String, dynamic> json) {
    vehicleTypePlanId = json['VehicleTypePlanId'];
    rowIndex = json['RowIndex'];
    columnIndex = json['ColumnIndex'];
    pointType = json['PointType'];
    pointTypeDesc = json['PointTypeDesc'];
    pointNumber = json['PointNumber'];
    seatStatus = json['SeatStatus'];
    travelSeatBlockId = json['TravelSeatBlockId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['VehicleTypePlanId'] = this.vehicleTypePlanId;
    data['RowIndex'] = this.rowIndex;
    data['ColumnIndex'] = this.columnIndex;
    data['PointType'] = this.pointType;
    data['PointTypeDesc'] = this.pointTypeDesc;
    data['PointNumber'] = this.pointNumber;
    data['SeatStatus'] = this.seatStatus;
    data['TravelSeatBlockId'] = this.travelSeatBlockId;
    return data;
  }
}

class TravelStations {
  String travelStationId;
  String stationId;
  String stationName;
  String address;
  int stationType;
  String stationTypeDesc;
  int orderIndex;
  String plannedEnterTime;
  String plannedExitTime;

  TravelStations(
      {this.travelStationId,
      this.stationId,
      this.stationName,
      this.address,
      this.stationType,
      this.stationTypeDesc,
      this.orderIndex,
      this.plannedEnterTime,
      this.plannedExitTime});

  TravelStations.fromJson(Map<String, dynamic> json) {
    travelStationId = json['TravelStationId'];
    stationId = json['StationId'];
    stationName = json['StationName'];
    address = json['Address'];
    stationType = json['StationType'];
    stationTypeDesc = json['StationTypeDesc'];
    orderIndex = json['OrderIndex'];
    plannedEnterTime = json['PlannedEnterTime'];
    plannedExitTime = json['PlannedExitTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TravelStationId'] = this.travelStationId;
    data['StationId'] = this.stationId;
    data['StationName'] = this.stationName;
    data['Address'] = this.address;
    data['StationType'] = this.stationType;
    data['StationTypeDesc'] = this.stationTypeDesc;
    data['OrderIndex'] = this.orderIndex;
    data['PlannedEnterTime'] = this.plannedEnterTime;
    data['PlannedExitTime'] = this.plannedExitTime;
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
