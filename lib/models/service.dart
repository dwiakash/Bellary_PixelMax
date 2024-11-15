import 'dart:convert';

import 'package:bellaryapp/models/image_model.dart';

class Service {
  int? id;
  int? categoryId;
  String? name;
  String? description;
  String? price;
  String? sellingPrice;
  String? discount;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<ImageModel>? images;

  Service({
    this.id,
    this.categoryId,
    this.name,
    this.description,
    this.price,
    this.sellingPrice,
    this.discount,
    this.createdAt,
    this.updatedAt,
    this.images,
  });

  Service copyWith({
    int? id,
    int? categoryId,
    String? name,
    String? description,
    String? price,
    String? sellingPrice,
    String? discount,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<ImageModel>? images,
  }) =>
      Service(
        id: id ?? this.id,
        categoryId: categoryId ?? this.categoryId,
        name: name ?? this.name,
        description: description ?? this.description,
        price: price ?? this.price,
        sellingPrice: sellingPrice ?? this.sellingPrice,
        discount: discount ?? this.discount,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        images: images ?? this.images,
      );

  factory Service.fromRawJson(String str) => Service.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        categoryId: json["category_id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        sellingPrice: json["selling_price"],
        discount: json["discount"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        images: json["images"] == null
            ? []
            : List<ImageModel>.from(
                json["images"]!.map((x) => ImageModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "name": name,
        "description": description,
        "price": price,
        "selling_price": sellingPrice,
        "discount": discount,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
      };

  List<Service> fromJsonList(List json) {
    return json.map((e) => Service.fromJson(e)).toList();
  }

  String? get dicountPercent {
    String? result;
    double price = double.parse(this.price ?? '0');
    double sellingPrice = double.parse(this.sellingPrice ?? '0');
    if (price == 0) return null;
    result = ((price - sellingPrice) / price * 100).roundToDouble().toString();
    List<String> temp = result.split('.');
    if (temp.last == '0') result = temp.first;
    return result;
  }
}
