import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Post {
  final int Platform;
  final int Language;
  final String DeviceToken;
  final String UserId;
  final String FirstName;
  final String MiddleName;
  final String LastName;
  final String PhoneNumber;
  final String BirthDate;
  final String Gender;
  final String Password;
  final String CountryId;

  Post(
      {this.Platform,
      this.Language,
      this.DeviceToken,
      this.UserId,
      this.FirstName,
      this.MiddleName,
      this.LastName,
      this.PhoneNumber,
      this.BirthDate,
      this.Gender,
      this.Password,
      this.CountryId});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        Platform: json['Platform'],
        Language: json['Language'],
        DeviceToken: json['DeviceToken'],
        UserId: json['UserId'],
        FirstName: json['FirstName'],
        MiddleName: json['MiddleName'],
        LastName: json['LastName'],
        PhoneNumber: json['Phone'],
        BirthDate: json['BirthDate'],
        Gender: json['Gender'],
        Password: json['Password'],
        CountryId: json['CountryId']);
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["Platform"] = Platform;
    map["Language"] = Language;
    map['DeviceToken'] = DeviceToken;
    map["UserId"] = UserId;
    map['FirstName'] = FirstName;
    map['MiddleName'] = MiddleName;
    map['LastName'] = LastName;
    map['PhoneNumber'] = PhoneNumber;
    map['BirthDate'] = BirthDate;
    map['Gender'] = Gender;
    map['Password'] = Password;
    map['CountryId'] = CountryId;

    return map;
  }

  Future<Post> createPost(String url, {Map body}) async {
    return http.post(url, body: body).then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return Post.fromJson(json.decode(response.body));
    });
  }
}
