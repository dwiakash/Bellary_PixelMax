import 'dart:convert';
import 'package:bellaryapp/models/image_model.dart';
import 'package:bellaryapp/utilities/extensions/string_extenstion.dart';

class Shop {
  int? id;
  String? name;
  int? ownerId;
  int? categoryId;
  String? mobile;
  String? city;
  String? address;
  double? latitude;
  double? longitude;
  String? openingTime;
  String? closingTime;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<ImageModel>? images;

  Shop({
    this.id,
    this.name,
    this.ownerId,
    this.categoryId,
    this.mobile,
    this.city,
    this.address,
    this.latitude,
    this.longitude,
    this.openingTime,
    this.closingTime,
    this.createdAt,
    this.updatedAt,
    this.images,
  });

  Shop copyWith({
    int? id,
    String? name,
    int? ownerId,
    int? categoryId,
    String? mobile,
    String? city,
    String? address,
    double? latitude,
    double? longitude,
    String? openingTime,
    String? closingTime,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<ImageModel>? images,
  }) =>
      Shop(
        id: id ?? this.id,
        name: name ?? this.name,
        ownerId: ownerId ?? this.ownerId,
        categoryId: categoryId ?? this.categoryId,
        mobile: mobile ?? this.mobile,
        city: city ?? this.city,
        address: address ?? this.address,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        openingTime: openingTime ?? this.openingTime,
        closingTime: closingTime ?? this.closingTime,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        images: images ?? this.images,
      );

  factory Shop.fromRawJson(String str) => Shop.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        id: json["id"],
        name: json["name"],
        ownerId: json["owner_id"],
        categoryId: json["category_id"],
        mobile: json["mobile"],
        city: json["city"],
        address: json["address"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        openingTime: json["opening_time"],
        closingTime: json["closing_time"],
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
        "name": name,
        "owner_id": ownerId,
        "category_id": categoryId,
        "mobile": mobile,
        "city": city,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "opening_time": openingTime,
        "closing_time": closingTime,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
      };
  List<Shop> fromJsonList(List json) {
    return json.map((e) => Shop.fromJson(e)).toList();
  }

  String get timings {
    String result = openingTime.toString().formattedNormalTimeStr;
    if (result.isEmpty) return result;
    result += ' - ';
    String to = closingTime ?? '';
    result += to.formattedNormalTimeStr;
    return result;
  }
}
