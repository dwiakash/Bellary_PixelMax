import 'dart:convert';

class PrivacyModel {
  String? title;
  List<String>? desc;

  PrivacyModel({this.desc, this.title});

  factory PrivacyModel.fromRawJson(String str) =>
      PrivacyModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PrivacyModel.fromJson(Map<String, dynamic> json) => PrivacyModel(
        title: json["title"],
        desc: json['desc'],
      );

  Map<String, dynamic> toJson() => {
        "desc": desc,
        "title": title,
      };

  static List<PrivacyModel> fromJsonList(List data) {
    return data.map((e) => PrivacyModel.fromJson(e)).toList();
  }
}
