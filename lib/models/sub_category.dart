import 'dart:convert';

class SubCategory {
  int? id;
  int? categoryId;
  String? name;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  SubCategory({
    this.id,
    this.categoryId,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  SubCategory copyWith({
    int? id,
    int? categoryId,
    String? name,
    String? image,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      SubCategory(
        id: id ?? this.id,
        categoryId: categoryId ?? this.categoryId,
        name: name ?? this.name,
        image: image ?? this.image,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory SubCategory.fromRawJson(String str) =>
      SubCategory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["id"],
        categoryId: json["category_id"],
        name: json["name"],
        image: json["image"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "name": name,
        "image": image,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
