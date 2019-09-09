import 'package:http/http.dart' as http;
import 'package:gunsel/data/constants.dart';

class Token {
  String token;
  SystemParameters systemParameters;

  Token({this.token, this.systemParameters});

  Token.fromJson(Map<String, dynamic> json) {
    token = json['Token'];
    systemParameters = json['SystemParameters'] != null
        ? new SystemParameters.fromJson(json['SystemParameters'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Token'] = this.token;
    if (this.systemParameters != null) {
      data['SystemParameters'] = this.systemParameters.toJson();
    }
    return data;
  }

  Future<void> getToken() async {
    Map<String, dynamic> seperator;
    Token token;
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    http.Response response = await http.get(
      Uri.encodeFull(tokenAPI),
      headers: {
        'Accept': 'application/json',
      },
    );
    seperator = (DataStatusSeperator.fromJson(
      jsonDecode(response.body),
    ))
        .toJson();
    print(seperator['Data']);
    /* seperator = seperator
    token = Token.fromJson(jsonDecode(seperator.data));
    prefs.s */
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
