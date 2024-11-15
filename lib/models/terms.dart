import 'dart:convert';

class TermsModel {
  String? title;
  List<String>? desc;

  TermsModel({this.desc, this.title});

  factory TermsModel.fromRawJson(String str) =>
      TermsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TermsModel.fromJson(Map<String, dynamic> json) => TermsModel(
        title: json["title"],
        desc: json['desc'],
      );

  Map<String, dynamic> toJson() => {
        "desc": desc,
        "title": title,
      };

  static List<TermsModel> fromJsonList(List 
  data) {
    return data.map((e) => TermsModel.fromJson(e)).toList();
  }
}
