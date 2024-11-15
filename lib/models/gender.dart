import 'dart:convert';

class Gender {
  int? id;
  String? male;
  String? female;

  Gender({
    this.id,
    this.male,
    this.female,
  });

  Gender copyWith({int? id, String? male, String? female}) => Gender(
        id: id ?? this.id,
        male: male ?? this.male,
        female: female ?? this.female,
      );

  factory Gender.fromRawJson(String str) => Gender.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Gender.fromJson(Map<String, dynamic> json) =>
      Gender(id: json["id"], male: json["male"], female: json['female']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "male": male,
        "female": female,
      };

  List<Gender> fromJsonList(List json) {
    return json.map((e) => Gender.fromJson(e)).toList();
  }
}
