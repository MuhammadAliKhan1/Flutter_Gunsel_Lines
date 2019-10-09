import 'package:gunsel/data/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PaymentResultModel {
  Data data;

  PaymentResultModel({this.data});

  PaymentResultModel.fromJson(Map<String, dynamic> json) {
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data.toJson();
    }
    return data;
  }

  getPaymentResult(paymentToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('Token');
    http.Response response = await http.get(
      Uri.encodeFull(
          'https://test-api.gunsel.ua/Public.svc/GetPaymentResult/$paymentToken'),
      headers: {
        'token': token,
      },
    );
    Map<String, dynamic> responseData = {
      'Data': jsonDecode(jsonDecode(response.body)['Data']),
    };

    PaymentResultModel paymentResultModelObj =
        PaymentResultModel.fromJson(responseData);
    return paymentResultModelObj.toJson();
  }

  sendEmail(paymentNumber, email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('Token');
    http.Response response = await http.get(
      Uri.encodeFull(
          'https://test-api.gunsel.ua/Public.svc/SendTicketAsEmail?c0=$paymentNumber&c1=$email'),
      headers: {
        'token': token,
      },
    );
    print(
        'https://test-api.gunsel.ua/Public.svc/SendTicketAsEmail?c0=$paymentNumber&c1=$email');
    print(response.body);
  }
}

class Data {
  bool isSuccess;
  String paymentNo;
  int taxScheme;
  double totalTariff;
  double totalServicePrice;
  double totalTax;
  double totalInsurance;
  double totalTicketPrice;
  double totalDiscount;
  double totalPrice;
  String publicToken;
  String customerFirstName;
  String customerMiddleName;
  String customerLastName;
  String customerCountryId;
  String customerAreaCode;
  String customerPhoneNumber;
  String customerEmail;
  List<Tickets> tickets;

  Data(
      {this.isSuccess,
      this.paymentNo,
      this.taxScheme,
      this.totalTariff,
      this.totalServicePrice,
      this.totalTax,
      this.totalInsurance,
      this.totalTicketPrice,
      this.totalDiscount,
      this.totalPrice,
      this.publicToken,
      this.customerFirstName,
      this.customerMiddleName,
      this.customerLastName,
      this.customerCountryId,
      this.customerAreaCode,
      this.customerPhoneNumber,
      this.customerEmail,
      this.tickets});

  Data.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    paymentNo = json['PaymentNo'];
    taxScheme = json['TaxScheme'];
    totalTariff = json['TotalTariff'];
    totalServicePrice = json['TotalServicePrice'];
    totalTax = json['TotalTax'];
    totalInsurance = json['TotalInsurance'];
    totalTicketPrice = json['TotalTicketPrice'];
    totalDiscount = json['TotalDiscount'];
    totalPrice = json['TotalPrice'];
    publicToken = json['PublicToken'];
    customerFirstName = json['CustomerFirstName'];
    customerMiddleName = json['CustomerMiddleName'];
    customerLastName = json['CustomerLastName'];
    customerCountryId = json['CustomerCountryId'];
    customerAreaCode = json['CustomerAreaCode'];
    customerPhoneNumber = json['CustomerPhoneNumber'];
    customerEmail = json['CustomerEmail'];
    if (json['Tickets'] != null) {
      tickets = new List<Tickets>();
      json['Tickets'].forEach((v) {
        tickets.add(new Tickets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsSuccess'] = this.isSuccess;
    data['PaymentNo'] = this.paymentNo;
    data['TaxScheme'] = this.taxScheme;
    data['TotalTariff'] = this.totalTariff;
    data['TotalServicePrice'] = this.totalServicePrice;
    data['TotalTax'] = this.totalTax;
    data['TotalInsurance'] = this.totalInsurance;
    data['TotalTicketPrice'] = this.totalTicketPrice;
    data['TotalDiscount'] = this.totalDiscount;
    data['TotalPrice'] = this.totalPrice;
    data['PublicToken'] = this.publicToken;
    data['CustomerFirstName'] = this.customerFirstName;
    data['CustomerMiddleName'] = this.customerMiddleName;
    data['CustomerLastName'] = this.customerLastName;
    data['CustomerCountryId'] = this.customerCountryId;
    data['CustomerAreaCode'] = this.customerAreaCode;
    data['CustomerPhoneNumber'] = this.customerPhoneNumber;
    data['CustomerEmail'] = this.customerEmail;
    if (this.tickets != null) {
      data['Tickets'] = this.tickets.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tickets {
  String xID;
  String paymentNo;
  bool isCheckPrinted;
  int paymentChannel;
  String ticketId;
  String agencyId;
  String agencyName;
  String agencyBranchId;
  String agencyBranchName;
  String travelSeatBlockId;
  String tripName;
  String ticketNo;
  String securityCode;
  String ticketDate;
  String routeName;
  String travelDate;
  String travelTime;
  String departureDate;
  String departureTime;
  String arrivalDate;
  String arrivalTime;
  int totalTravelTime;
  String tripCode;
  String vehicleTypePlanId;
  String seatNumber;
  String firstName;
  String middleName;
  String lastName;
  String email;
  String phoneNumberCountryId;
  String areaCode;
  String phoneNumber;
  Null formattedPhoneNumber;
  double tariff;
  double servicePrice;
  int taxScheme;
  double taxRate;
  double totalTax;
  double totalInsurance;
  double ticketPrice;
  bool isDiscounted;
  int discountType;
  double discountRate;
  double totalDiscount;
  double totalPrice;
  Currency currency;
  VehicleType vehicleType;
  FromStation fromStation;
  FromStation toStation;
  int fromStationOrderIndex;
  int toStationOrderIndex;
  double distanceKM;
  int ticketStatus;
  int platform;

  Tickets(
      {this.xID,
      this.paymentNo,
      this.isCheckPrinted,
      this.paymentChannel,
      this.ticketId,
      this.agencyId,
      this.agencyName,
      this.agencyBranchId,
      this.agencyBranchName,
      this.travelSeatBlockId,
      this.tripName,
      this.ticketNo,
      this.securityCode,
      this.ticketDate,
      this.routeName,
      this.travelDate,
      this.travelTime,
      this.departureDate,
      this.departureTime,
      this.arrivalDate,
      this.arrivalTime,
      this.totalTravelTime,
      this.tripCode,
      this.vehicleTypePlanId,
      this.seatNumber,
      this.firstName,
      this.middleName,
      this.lastName,
      this.email,
      this.phoneNumberCountryId,
      this.areaCode,
      this.phoneNumber,
      this.formattedPhoneNumber,
      this.tariff,
      this.servicePrice,
      this.taxScheme,
      this.taxRate,
      this.totalTax,
      this.totalInsurance,
      this.ticketPrice,
      this.isDiscounted,
      this.discountType,
      this.discountRate,
      this.totalDiscount,
      this.totalPrice,
      this.currency,
      this.vehicleType,
      this.fromStation,
      this.toStation,
      this.fromStationOrderIndex,
      this.toStationOrderIndex,
      this.distanceKM,
      this.ticketStatus,
      this.platform});

  Tickets.fromJson(Map<String, dynamic> json) {
    xID = json['XID'];
    paymentNo = json['PaymentNo'];
    isCheckPrinted = json['IsCheckPrinted'];
    paymentChannel = json['PaymentChannel'];
    ticketId = json['TicketId'];
    agencyId = json['AgencyId'];
    agencyName = json['AgencyName'];
    agencyBranchId = json['AgencyBranchId'];
    agencyBranchName = json['AgencyBranchName'];
    travelSeatBlockId = json['TravelSeatBlockId'];
    tripName = json['TripName'];
    ticketNo = json['TicketNo'];
    securityCode = json['SecurityCode'];
    ticketDate = json['TicketDate'];
    routeName = json['RouteName'];
    travelDate = json['TravelDate'];
    travelTime = json['TravelTime'];
    departureDate = json['DepartureDate'];
    departureTime = json['DepartureTime'];
    arrivalDate = json['ArrivalDate'];
    arrivalTime = json['ArrivalTime'];
    totalTravelTime = json['TotalTravelTime'];
    tripCode = json['TripCode'];
    vehicleTypePlanId = json['VehicleTypePlanId'];
    seatNumber = json['SeatNumber'];
    firstName = json['FirstName'];
    middleName = json['MiddleName'];
    lastName = json['LastName'];
    email = json['Email'];
    phoneNumberCountryId = json['PhoneNumberCountryId'];
    areaCode = json['AreaCode'];
    phoneNumber = json['PhoneNumber'];
    formattedPhoneNumber = json['FormattedPhoneNumber'];
    tariff = json['Tariff'];
    servicePrice = json['ServicePrice'];
    taxScheme = json['TaxScheme'];
    taxRate = json['TaxRate'];
    totalTax = json['TotalTax'];
    totalInsurance = json['TotalInsurance'];
    ticketPrice = json['TicketPrice'];
    isDiscounted = json['IsDiscounted'];
    discountType = json['DiscountType'];
    discountRate = json['DiscountRate'];
    totalDiscount = json['TotalDiscount'];
    totalPrice = json['TotalPrice'];
    currency = json['Currency'] != null
        ? new Currency.fromJson(json['Currency'])
        : null;
    vehicleType = json['VehicleType'] != null
        ? new VehicleType.fromJson(json['VehicleType'])
        : null;
    fromStation = json['FromStation'] != null
        ? new FromStation.fromJson(json['FromStation'])
        : null;
    toStation = json['ToStation'] != null
        ? new FromStation.fromJson(json['ToStation'])
        : null;
    fromStationOrderIndex = json['FromStationOrderIndex'];
    toStationOrderIndex = json['ToStationOrderIndex'];
    distanceKM = json['DistanceKM'];
    ticketStatus = json['TicketStatus'];
    platform = json['Platform'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['XID'] = this.xID;
    data['PaymentNo'] = this.paymentNo;
    data['IsCheckPrinted'] = this.isCheckPrinted;
    data['PaymentChannel'] = this.paymentChannel;
    data['TicketId'] = this.ticketId;
    data['AgencyId'] = this.agencyId;
    data['AgencyName'] = this.agencyName;
    data['AgencyBranchId'] = this.agencyBranchId;
    data['AgencyBranchName'] = this.agencyBranchName;
    data['TravelSeatBlockId'] = this.travelSeatBlockId;
    data['TripName'] = this.tripName;
    data['TicketNo'] = this.ticketNo;
    data['SecurityCode'] = this.securityCode;
    data['TicketDate'] = this.ticketDate;
    data['RouteName'] = this.routeName;
    data['TravelDate'] = this.travelDate;
    data['TravelTime'] = this.travelTime;
    data['DepartureDate'] = this.departureDate;
    data['DepartureTime'] = this.departureTime;
    data['ArrivalDate'] = this.arrivalDate;
    data['ArrivalTime'] = this.arrivalTime;
    data['TotalTravelTime'] = this.totalTravelTime;
    data['TripCode'] = this.tripCode;
    data['VehicleTypePlanId'] = this.vehicleTypePlanId;
    data['SeatNumber'] = this.seatNumber;
    data['FirstName'] = this.firstName;
    data['MiddleName'] = this.middleName;
    data['LastName'] = this.lastName;
    data['Email'] = this.email;
    data['PhoneNumberCountryId'] = this.phoneNumberCountryId;
    data['AreaCode'] = this.areaCode;
    data['PhoneNumber'] = this.phoneNumber;
    data['FormattedPhoneNumber'] = this.formattedPhoneNumber;
    data['Tariff'] = this.tariff;
    data['ServicePrice'] = this.servicePrice;
    data['TaxScheme'] = this.taxScheme;
    data['TaxRate'] = this.taxRate;
    data['TotalTax'] = this.totalTax;
    data['TotalInsurance'] = this.totalInsurance;
    data['TicketPrice'] = this.ticketPrice;
    data['IsDiscounted'] = this.isDiscounted;
    data['DiscountType'] = this.discountType;
    data['DiscountRate'] = this.discountRate;
    data['TotalDiscount'] = this.totalDiscount;
    data['TotalPrice'] = this.totalPrice;
    if (this.currency != null) {
      data['Currency'] = this.currency.toJson();
    }
    if (this.vehicleType != null) {
      data['VehicleType'] = this.vehicleType.toJson();
    }
    if (this.fromStation != null) {
      data['FromStation'] = this.fromStation.toJson();
    }
    if (this.toStation != null) {
      data['ToStation'] = this.toStation.toJson();
    }
    data['FromStationOrderIndex'] = this.fromStationOrderIndex;
    data['ToStationOrderIndex'] = this.toStationOrderIndex;
    data['DistanceKM'] = this.distanceKM;
    data['TicketStatus'] = this.ticketStatus;
    data['Platform'] = this.platform;
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
  int rowCount;
  int columnCount;
  List<VehicleTypePlanItems> vehicleTypePlanItems;
  String vehicleTypeId;
  String vehicleTypeName;
  String vehicleTypeCode;
  int vehicleCategory;
  List<Properties> properties;

  VehicleType(
      {this.rowCount,
      this.columnCount,
      this.vehicleTypePlanItems,
      this.vehicleTypeId,
      this.vehicleTypeName,
      this.vehicleTypeCode,
      this.vehicleCategory,
      this.properties});

  VehicleType.fromJson(Map<String, dynamic> json) {
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
      properties = new List<Properties>();
      json['Properties'].forEach((v) {
        properties.add(new Properties.fromJson(v));
      });
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
      data['Properties'] = this.properties.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VehicleTypePlanItems {
  String vehicleTypePlanId;
  int rowIndex;
  int columnIndex;
  int pointType;
  Null pointTypeDesc;
  int pointNumber;
  Null seatStatus;
  Null travelSeatBlockId;

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
