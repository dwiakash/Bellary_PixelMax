import 'dart:convert';

class City {
  int? id;
  String? name;
  dynamic createdAt;
  dynamic updatedAt;

  City({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  City copyWith({
    int? id,
    String? name,
    dynamic createdAt,
    dynamic updatedAt,
  }) =>
      City(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory City.fromRawJson(String str) => City.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "city_id": id,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };

  List<City> fromJsonList(List json) {
    return json.map((e) => City.fromJson(e)).toList();
  }
}
