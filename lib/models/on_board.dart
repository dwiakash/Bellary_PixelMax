import 'dart:convert';

class OnBoard {
  String desc1;
  String desc2;
  String title;
  String image;

  OnBoard({
    required this.title,
    required this.desc1,
    required this.image,
    required this.desc2,
  });

  factory OnBoard.fromRawJson(String str) => OnBoard.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OnBoard.fromJson(Map<String, dynamic> json) => OnBoard(
        title: json['title'],
        image: json["image"],
        desc1: json["desc1"],
        desc2: json['desc2'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        "image": image,
        "desc1": desc1,
        "desc2": desc2,
      };

  static List<OnBoard> fromJsonList(List data) {
    return data.map((e) => OnBoard.fromJson(e)).toList();
  }
}
