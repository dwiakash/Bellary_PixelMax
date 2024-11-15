import 'dart:convert';

class ImageModel {
  int? id;
  String? image;
  int? shopId;
  DateTime? createdAt;
  DateTime? updatedAt;

  ImageModel({
    this.id,
    this.image,
    this.shopId,
    this.createdAt,
    this.updatedAt,
  });

  ImageModel copyWith({
    int? id,
    String? image,
    int? shopId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      ImageModel(
        id: id ?? this.id,
        image: image ?? this.image,
        shopId: shopId ?? this.shopId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory ImageModel.fromRawJson(String str) =>
      ImageModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        id: json["id"],
        image: json["image"],
        shopId: json["shop_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "shop_id": shopId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
