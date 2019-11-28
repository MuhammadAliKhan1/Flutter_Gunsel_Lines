class DataStatusSeperator {
  String data;
  Status status;

  DataStatusSeperator({this.data, this.status});

  DataStatusSeperator.fromJson(Map<String, dynamic> json) {
    data = json['Data'];
    status =
        json['Status'] != null ? new Status.fromJson(json['Status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Data'] = this.data;
    if (this.status != null) {
      data['Status'] = this.status.toJson();
    }
    return data;
  }
}

class Status {
  int endpoint;
  int service;
  String statusCode;
  int statusLevel;
  String statusText;

  Status(
      {this.endpoint,
      this.service,
      this.statusCode,
      this.statusLevel,
      this.statusText});

  Status.fromJson(Map<String, dynamic> json) {
    endpoint = json['Endpoint'];
    service = json['Service'];
    statusCode = json['StatusCode'];
    statusLevel = json['StatusLevel'];
    statusText = json['StatusText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Endpoint'] = this.endpoint;
    data['Service'] = this.service;
    data['StatusCode'] = this.statusCode;
    data['StatusLevel'] = this.statusLevel;
    data['StatusText'] = this.statusText;
    return data;
  }
}
