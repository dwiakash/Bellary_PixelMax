import 'dart:convert';

import 'package:bellaryapp/models/image_model.dart';

class Product {
  int? id;
  String? name;
  String? description;
  int? categoryId;
  int? subCategoryId;
  int? localShopId;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Skus>? skus;

  Product({
    this.id,
    this.name,
    this.description,
    this.categoryId,
    this.subCategoryId,
    this.localShopId,
    this.createdAt,
    this.updatedAt,
    this.skus,
  });

  Product copyWith({
    int? id,
    String? name,
    String? description,
    int? categoryId,
    int? subCategoryId,
    int? localShopId,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<Skus>? skus,
  }) =>
      Product(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        categoryId: categoryId ?? this.categoryId,
        subCategoryId: subCategoryId ?? this.subCategoryId,
        localShopId: localShopId ?? this.localShopId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        skus: skus ?? this.skus,
      );

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        categoryId: json["category_id"],
        subCategoryId: json["sub_category_id"],
        localShopId: json["local_shop_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        skus: json["skus"] == null
            ? []
            : List<Skus>.from(json["skus"]!.map((x) => Skus.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "category_id": categoryId,
        "sub_category_id": subCategoryId,
        "local_shop_id": localShopId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "skus": skus == null
            ? []
            : List<dynamic>.from(skus!.map((x) => x.toJson())),
      };

  static List<Product> fromJsonList(List json) =>
      json.map((e) => Product.fromJson(e)).toList();
}

class Skus {
  int? id;
  String? code;
  String? price;
  String? sellingPrice;
  int? stock;
  int? productId;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<AttributeElement>? attributes;
  List<ImageModel>? images;

  Skus({
    this.id,
    this.code,
    this.price,
    this.sellingPrice,
    this.stock,
    this.productId,
    this.createdAt,
    this.updatedAt,
    this.attributes,
    this.images,
  });

  Skus copyWith({
    int? id,
    String? code,
    String? price,
    String? sellingPrice,
    int? stock,
    int? productId,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<AttributeElement>? attributes,
    List<ImageModel>? images,
  }) =>
      Skus(
        id: id ?? this.id,
        code: code ?? this.code,
        price: price ?? this.price,
        sellingPrice: sellingPrice ?? this.sellingPrice,
        stock: stock ?? this.stock,
        productId: productId ?? this.productId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        attributes: attributes ?? this.attributes,
        images: images ?? this.images,
      );

  factory Skus.fromRawJson(String str) => Skus.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Skus.fromJson(Map<String, dynamic> json) => Skus(
        id: json["id"],
        code: json["code"],
        price: json["price"],
        sellingPrice: json["selling_price"],
        stock: json["stock"],
        productId: json["product_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        attributes: json["attributes"] == null
            ? []
            : List<AttributeElement>.from(
                json["attributes"]!.map((x) => AttributeElement.fromJson(x))),
        images: json["images"] == null
            ? []
            : List<ImageModel>.from(
                json["images"]!.map((x) => ImageModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "price": price,
        "selling_price": sellingPrice,
        "stock": stock,
        "product_id": productId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "attributes": attributes == null
            ? []
            : List<dynamic>.from(attributes!.map((x) => x.toJson())),
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
      };
}

class AttributeElement {
  int? id;
  String? value;
  int? attributeId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Pivot? pivot;
  AttributeAttribute? attribute;

  AttributeElement({
    this.id,
    this.value,
    this.attributeId,
    this.createdAt,
    this.updatedAt,
    this.pivot,
    this.attribute,
  });

  AttributeElement copyWith({
    int? id,
    String? value,
    int? attributeId,
    DateTime? createdAt,
    DateTime? updatedAt,
    Pivot? pivot,
    AttributeAttribute? attribute,
  }) =>
      AttributeElement(
        id: id ?? this.id,
        value: value ?? this.value,
        attributeId: attributeId ?? this.attributeId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        pivot: pivot ?? this.pivot,
        attribute: attribute ?? this.attribute,
      );

  factory AttributeElement.fromRawJson(String str) =>
      AttributeElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AttributeElement.fromJson(Map<String, dynamic> json) =>
      AttributeElement(
        id: json["id"],
        value: json["value"],
        attributeId: json["attribute_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
        attribute: json["attribute"] == null
            ? null
            : AttributeAttribute.fromJson(json["attribute"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
        "attribute_id": attributeId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "pivot": pivot?.toJson(),
        "attribute": attribute?.toJson(),
      };
}

class AttributeAttribute {
  int? id;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;

  AttributeAttribute({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  AttributeAttribute copyWith({
    int? id,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      AttributeAttribute(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory AttributeAttribute.fromRawJson(String str) =>
      AttributeAttribute.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AttributeAttribute.fromJson(Map<String, dynamic> json) =>
      AttributeAttribute(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Pivot {
  int? skuId;
  int? attributeOptionId;

  Pivot({
    this.skuId,
    this.attributeOptionId,
  });

  Pivot copyWith({
    int? skuId,
    int? attributeOptionId,
  }) =>
      Pivot(
        skuId: skuId ?? this.skuId,
        attributeOptionId: attributeOptionId ?? this.attributeOptionId,
      );

  factory Pivot.fromRawJson(String str) => Pivot.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        skuId: json["sku_id"],
        attributeOptionId: json["attribute_option_id"],
      );

  Map<String, dynamic> toJson() => {
        "sku_id": skuId,
        "attribute_option_id": attributeOptionId,
      };
}
