// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    required this.accessToken,
    required this.tokenId,
    required this.userId,
    required this.name,
    required this.email,
  });

  String accessToken;
  String tokenId;
  int userId;
  String name;
  String email;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        accessToken: json["access_token"],
        tokenId: json["token_id"],
        userId: json["user_id"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_id": tokenId,
        "user_id": userId,
        "name": name,
        "email": email,
      };
}
