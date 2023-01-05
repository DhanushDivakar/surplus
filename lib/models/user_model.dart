import 'dart:io';

import 'package:dio/dio.dart';

class User {
  String? phone;
  String? name;
  String? email;
  File? profilePic;
  String? aadhaarNo;
  File? aadhaarPic;
  String? lat;
  String? long;
  User(
      {this.phone,
      this.name,
      this.email,
      this.profilePic,
      this.aadhaarNo,
      this.aadhaarPic,
      this.lat,
      this.long});

  factory User.fromJson(Map<String, dynamic> json) {
    var profilePic = File('${json['profilePic']}').existsSync()
        ? File('${json['profilePic']}')
        : null;

    var aadhaarPic = File('${json['aadhaarPic']}').existsSync()
        ? File('${json['aadhaarPic']}')
        : null;

    return User(
      phone: json['phone'],
      name: json['name'],
      email: json['email'],
      profilePic: profilePic,
      aadhaarNo: json['aadhaarNo'],
      aadhaarPic: aadhaarPic,
      lat: json['lat'],
      long: json['long'],
    );
  }

  Map<String, dynamic> toJson() => {
        'phone': phone,
        'name': name,
        'email': email,
        'profilePic': MultipartFile.fromFile('${profilePic?.path}'),
        //'profilePic': '${profilePic?.path}',
        'aadhaarNo': aadhaarNo,
        'aadhaarPic': MultipartFile.fromFile('${aadhaarPic?.path}'),
        'lat': lat,
        'long': long,
        // 'files' : <MultipartFile>[
        //   MultipartFile.fromBytes(profilePic?.r)
        // ]
      };

  User copyWith({
    String? phone,
    String? name,
    String? email,
    File? profilePic,
    String? aadhaarNo,
    File? aadhaarPic,
    String? lat,
    String? long,
  }) =>
      User(
        phone: phone ?? this.phone,
        name: name ?? this.name,
        email: email ?? this.email,
        profilePic: profilePic ?? this.profilePic,
        aadhaarNo: aadhaarNo ?? this.aadhaarNo,
        aadhaarPic: aadhaarPic ?? this.aadhaarPic,
        lat: lat ?? this.lat,
        long: long ?? this.long,
      );
}
