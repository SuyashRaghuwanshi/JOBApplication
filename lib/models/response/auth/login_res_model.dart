import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  String id;
  String profile;
  String token;

  LoginResponseModel({
    required this.id,
    required this.profile,
    required this.token,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        id: json["_id"],
        profile: json["profile"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "profile": profile,
    "token": token,
  };
}
