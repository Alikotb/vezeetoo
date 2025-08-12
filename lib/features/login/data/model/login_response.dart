import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.g.dart';
@JsonSerializable()
class LoginResponse {
  String? message;
  bool? status;
  int? code;
  @JsonKey(name: "data")
  UserData? userData;

  LoginResponse({this.message, this.status, this.code});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  String? token;
  @JsonKey(name: "username")
  String? userName;

  UserData({this.token, this.userName});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
