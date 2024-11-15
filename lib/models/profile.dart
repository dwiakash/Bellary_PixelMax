import 'dart:convert';

import 'package:bellaryapp/utilities/extensions/map_extention.dart';

class Profile {
  int? id;
  int? userId;
  String? name;
  String? nickName;
  String? mobile;
  dynamic dob;
  String? gender;
  String? image;
  dynamic latitude;
  dynamic longitude;
  int? cityId;
  int? languageId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Profile({
    this.id,
    this.userId,
    this.name,
    this.nickName,
    this.mobile,
    this.dob,
    this.gender,
    this.image,
    this.latitude,
    this.longitude,
    this.cityId,
    this.languageId,
    this.createdAt,
    this.updatedAt,
  });

  Profile copyWith({
    int? id,
    int? userId,
    dynamic name,
    dynamic nickName,
    dynamic mobile,
    dynamic dob,
    dynamic gender,
    dynamic image,
    dynamic latitude,
    dynamic longitude,
    dynamic cityId,
    dynamic languageId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Profile(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        name: name ?? this.name,
        nickName: nickName ?? this.nickName,
        mobile: mobile ?? this.mobile,
        dob: dob ?? this.dob,
        gender: gender ?? this.gender,
        image: image ?? this.image,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        cityId: cityId ?? this.cityId,
        languageId: languageId ?? this.languageId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Profile.fromRawJson(String str) => Profile.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        userId: json["user_id"],
        name: json['name'],
        nickName: json["nick_name"],
        mobile: json["mobile"],
        dob: json["dob"],
        gender: json["gender"],
        image: json["image"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        cityId: json["city_id"],
        languageId: json["language_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data.addAllIf(name != null, {"name": name});
    data.addAllIf(dob != null, {"dob": dob});
    data.addAllIf(mobile != null, {"mobile": mobile});
    data.addAllIf(gender != null, {"gender": gender});
    data.addAllIf(image != null, {"image": image});
    data.addAllIf(nickName != null, {"nick_name": nickName});
    data.addAllIf(id != null, {"id": id});
    data.addAllIf(userId != null, {"user_id": userId});
    data.addAllIf(latitude != null, {"latitude": latitude});
    data.addAllIf(longitude != null, {"longitude": longitude});
    data.addAllIf(cityId != null, {"city_id": cityId});
    data.addAllIf(languageId != null, {"language_id": languageId});
    data.addAllIf(createdAt != null, {"created_at": createdAt});
    data.addAllIf(updatedAt != null, {"updated_at": updatedAt});
    return data;
  }
}
