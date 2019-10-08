class travelhistory {
  List<Data> data;

  travelhistory({this.data});

  travelhistory.fromJson(Map<String, dynamic> json) {
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
  Null xID;
  String agency;
  String agencyBranch;
  String paymentNo;
  String ticketNo;
  String ticketDate;
  String travelDate;
  String departureDate;
  String departureTime;
  String arrivalDate;
  String arrivalTime;
  String tripCode;
  Null tripName;
  String fromStation;
  String toStation;
  String seatNo;
  String passengerTitle;
  String passengerPhoneNumber;
  String passengerEmail;
  double ticketPrice;
  String currency;
  int ticketStatus;
  VehicleType vehicleType;

  Data(
      {this.xID,
        this.agency,
        this.agencyBranch,
        this.paymentNo,
        this.ticketNo,
        this.ticketDate,
        this.travelDate,
        this.departureDate,
        this.departureTime,
        this.arrivalDate,
        this.arrivalTime,
        this.tripCode,
        this.tripName,
        this.fromStation,
        this.toStation,
        this.seatNo,
        this.passengerTitle,
        this.passengerPhoneNumber,
        this.passengerEmail,
        this.ticketPrice,
        this.currency,
        this.ticketStatus,
        this.vehicleType});

  Data.fromJson(Map<String, dynamic> json) {
    xID = json['XID'];
    agency = json['Agency'];
    agencyBranch = json['AgencyBranch'];
    paymentNo = json['PaymentNo'];
    ticketNo = json['TicketNo'];
    ticketDate = json['TicketDate'];
    travelDate = json['TravelDate'];
    departureDate = json['DepartureDate'];
    departureTime = json['DepartureTime'];
    arrivalDate = json['ArrivalDate'];
    arrivalTime = json['ArrivalTime'];
    tripCode = json['TripCode'];
    tripName = json['TripName'];
    fromStation = json['FromStation'];
    toStation = json['ToStation'];
    seatNo = json['SeatNo'];
    passengerTitle = json['PassengerTitle'];
    passengerPhoneNumber = json['PassengerPhoneNumber'];
    passengerEmail = json['PassengerEmail'];
    ticketPrice = json['TicketPrice'];
    currency = json['Currency'];
    ticketStatus = json['TicketStatus'];
    vehicleType = json['VehicleType'] != null
        ? new VehicleType.fromJson(json['VehicleType'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['XID'] = this.xID;
    data['Agency'] = this.agency;
    data['AgencyBranch'] = this.agencyBranch;
    data['PaymentNo'] = this.paymentNo;
    data['TicketNo'] = this.ticketNo;
    data['TicketDate'] = this.ticketDate;
    data['TravelDate'] = this.travelDate;
    data['DepartureDate'] = this.departureDate;
    data['DepartureTime'] = this.departureTime;
    data['ArrivalDate'] = this.arrivalDate;
    data['ArrivalTime'] = this.arrivalTime;
    data['TripCode'] = this.tripCode;
    data['TripName'] = this.tripName;
    data['FromStation'] = this.fromStation;
    data['ToStation'] = this.toStation;
    data['SeatNo'] = this.seatNo;
    data['PassengerTitle'] = this.passengerTitle;
    data['PassengerPhoneNumber'] = this.passengerPhoneNumber;
    data['PassengerEmail'] = this.passengerEmail;
    data['TicketPrice'] = this.ticketPrice;
    data['Currency'] = this.currency;
    data['TicketStatus'] = this.ticketStatus;
    if (this.vehicleType != null) {
      data['VehicleType'] = this.vehicleType.toJson();
    }
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
