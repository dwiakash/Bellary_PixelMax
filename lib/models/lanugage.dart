import 'dart:convert';

class Language {
  int? id;
  String? code;
  String? name;
  dynamic createdAt;
  dynamic updatedAt;

  Language({
    this.id,
    this.code,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  Language copyWith({
    int? id,
    String? code,
    String? name,
    dynamic createdAt,
    dynamic updatedAt,
  }) =>
      Language(
        id: id ?? this.id,
        code: code ?? this.code,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Language.fromRawJson(String str) =>
      Language.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "language_id": id,
        "code": code,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };

  List<Language> fromJsonList(List json) {
    return json.map((e) => Language.fromJson(e)).toList();
  }
}
