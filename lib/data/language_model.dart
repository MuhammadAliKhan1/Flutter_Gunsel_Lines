class languageModel {
  List<Data> data;

  languageModel({this.data});

  languageModel.fromJson(Map<String, dynamic> json) {
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
  int languageId;
  String cultureName;
  String languageName;
  String shortName;
  bool defaultLanguage;
  String icon;

  Data(
      {this.languageId,
        this.cultureName,
        this.languageName,
        this.shortName,
        this.defaultLanguage,
        this.icon});

  Data.fromJson(Map<String, dynamic> json) {
    languageId = json['LanguageId'];
    cultureName = json['CultureName'];
    languageName = json['LanguageName'];
    shortName = json['ShortName'];
    defaultLanguage = json['DefaultLanguage'];
    icon = json['Icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LanguageId'] = this.languageId;
    data['CultureName'] = this.cultureName;
    data['LanguageName'] = this.languageName;
    data['ShortName'] = this.shortName;
    data['DefaultLanguage'] = this.defaultLanguage;
    data['Icon'] = this.icon;
    return data;
  }
}
