import 'dart:convert';

import 'package:flutter/material.dart';

class Category {
  int? id;
  UniqueKey? key;
  String? name;
  String? title;
  String? subTitle;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  Category({
    this.id,
    this.key,
    this.name,
    this.title,
    this.subTitle,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  Category copyWith({
    int? id,
    int? key,
    String? name,
    String? title,
    String? subTitle,
    String? image,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        title: title ?? this.title,
        subTitle: subTitle ?? this.subTitle,
        image: image ?? this.image,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        key: UniqueKey(),
        name: json["name"],
        title: json["title"],
        subTitle: json["sub_title"],
        image: json["image"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "category_id": id,
        'key': key,
        "name": name,
        "title": title,
        "sub_title": subTitle,
        "image": image,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
  List<Category> fromJsonList(List json) {
    return json.map((e) => Category.fromJson(e)).toList();
  }
}
