class googleApimodel {
  Data data;

  googleApimodel({this.data});

  googleApimodel.fromJson(Map<String, dynamic> json) {
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String token;
  SystemParameters systemParameters;
  String now;
  String memberNo;
  String firstName;
  String lastName;
  bool isEmailVerified;
  bool isPhoneNumberVerified;
  String countryId;
  String phoneNumber;
  String email;
  //String birthDate;
  int gender;
  int language;
  String imageURL;

  Data(
      {this.token,
        this.systemParameters,
        this.now,
        this.memberNo,
        this.firstName,
        this.lastName,
        this.isEmailVerified,
        this.isPhoneNumberVerified,
        this.countryId,
        this.phoneNumber,
        this.email,
       // this.birthDate,
        this.gender,
        this.language,
        this.imageURL});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['Token'];
    systemParameters = json['SystemParameters'] != null
        ? new SystemParameters.fromJson(json['SystemParameters'])
        : null;
    now = json['Now'];
    memberNo = json['MemberNo'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    isEmailVerified = json['IsEmailVerified'];
    isPhoneNumberVerified = json['IsPhoneNumberVerified'];
    countryId = json['CountryId'];
    phoneNumber = json['PhoneNumber'];
    email = json['Email'];
    //birthDate = json['BirthDate'];
    gender = json['Gender'];
    language = json['Language'];
    imageURL = json['ImageURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Token'] = this.token;
    if (this.systemParameters != null) {
      data['SystemParameters'] = this.systemParameters.toJson();
    }
    data['Now'] = this.now;
    data['MemberNo'] = this.memberNo;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['IsEmailVerified'] = this.isEmailVerified;
    data['IsPhoneNumberVerified'] = this.isPhoneNumberVerified;
    data['CountryId'] = this.countryId;
    data['PhoneNumber'] = this.phoneNumber;
    data['Email'] = this.email;
    //data['BirthDate'] = this.birthDate;
    data['Gender'] = this.gender;
    data['Language'] = this.language;
    data['ImageURL'] = this.imageURL;
    return data;
  }
}

class SystemParameters {
  String defaultLanguage;
  String defaultCurrency;
  String companyName;
  String insuranceCompanyName;
  String hostessRole;
  String custMaxSeatBlockCount;
  String custSeatBlockTimeoutSec;
  String custOnPaymentTimeoutSec;
  String officeMaxSeatBlockCount;
  String officeSeatBlockTimeoutSec;
  String gunselAgencyId;
  bool officeCustomerNameRequired;
  bool officeCustomerPhoneNumberRequired;
  bool officeCustomerEmailRequired;
  bool publicCustomerNameRequired;
  bool publicCustomerPhoneNumberRequired;
  bool publicCustomerEmailRequired;
  String officeMaxTicketDayCount;
  String publicMaxTicketDayCount;

  SystemParameters(
      {this.defaultLanguage,
        this.defaultCurrency,
        this.companyName,
        this.insuranceCompanyName,
        this.hostessRole,
        this.custMaxSeatBlockCount,
        this.custSeatBlockTimeoutSec,
        this.custOnPaymentTimeoutSec,
        this.officeMaxSeatBlockCount,
        this.officeSeatBlockTimeoutSec,
        this.gunselAgencyId,
        this.officeCustomerNameRequired,
        this.officeCustomerPhoneNumberRequired,
        this.officeCustomerEmailRequired,
        this.publicCustomerNameRequired,
        this.publicCustomerPhoneNumberRequired,
        this.publicCustomerEmailRequired,
        this.officeMaxTicketDayCount,
        this.publicMaxTicketDayCount});

  SystemParameters.fromJson(Map<String, dynamic> json) {
    defaultLanguage = json['DefaultLanguage'];
    defaultCurrency = json['DefaultCurrency'];
    companyName = json['CompanyName'];
    insuranceCompanyName = json['InsuranceCompanyName'];
    hostessRole = json['HostessRole'];
    custMaxSeatBlockCount = json['CustMaxSeatBlockCount'];
    custSeatBlockTimeoutSec = json['CustSeatBlockTimeoutSec'];
    custOnPaymentTimeoutSec = json['CustOnPaymentTimeoutSec'];
    officeMaxSeatBlockCount = json['OfficeMaxSeatBlockCount'];
    officeSeatBlockTimeoutSec = json['OfficeSeatBlockTimeoutSec'];
    gunselAgencyId = json['GunselAgencyId'];
    officeCustomerNameRequired = json['Office_CustomerNameRequired'];
    officeCustomerPhoneNumberRequired =
    json['Office_CustomerPhoneNumberRequired'];
    officeCustomerEmailRequired = json['Office_CustomerEmailRequired'];
    publicCustomerNameRequired = json['Public_CustomerNameRequired'];
    publicCustomerPhoneNumberRequired =
    json['Public_CustomerPhoneNumberRequired'];
    publicCustomerEmailRequired = json['Public_CustomerEmailRequired'];
    officeMaxTicketDayCount = json['Office_MaxTicketDayCount'];
    publicMaxTicketDayCount = json['Public_MaxTicketDayCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DefaultLanguage'] = this.defaultLanguage;
    data['DefaultCurrency'] = this.defaultCurrency;
    data['CompanyName'] = this.companyName;
    data['InsuranceCompanyName'] = this.insuranceCompanyName;
    data['HostessRole'] = this.hostessRole;
    data['CustMaxSeatBlockCount'] = this.custMaxSeatBlockCount;
    data['CustSeatBlockTimeoutSec'] = this.custSeatBlockTimeoutSec;
    data['CustOnPaymentTimeoutSec'] = this.custOnPaymentTimeoutSec;
    data['OfficeMaxSeatBlockCount'] = this.officeMaxSeatBlockCount;
    data['OfficeSeatBlockTimeoutSec'] = this.officeSeatBlockTimeoutSec;
    data['GunselAgencyId'] = this.gunselAgencyId;
    data['Office_CustomerNameRequired'] = this.officeCustomerNameRequired;
    data['Office_CustomerPhoneNumberRequired'] =
        this.officeCustomerPhoneNumberRequired;
    data['Office_CustomerEmailRequired'] = this.officeCustomerEmailRequired;
    data['Public_CustomerNameRequired'] = this.publicCustomerNameRequired;
    data['Public_CustomerPhoneNumberRequired'] =
        this.publicCustomerPhoneNumberRequired;
    data['Public_CustomerEmailRequired'] = this.publicCustomerEmailRequired;
    data['Office_MaxTicketDayCount'] = this.officeMaxTicketDayCount;
    data['Public_MaxTicketDayCount'] = this.publicMaxTicketDayCount;
    return data;
  }
}