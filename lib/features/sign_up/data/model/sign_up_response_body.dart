
import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_up_response_body.g.dart';
@JsonSerializable()
class SignUpResponse {
  String? message;
  bool? status;
  int? code;
  @JsonKey(name: "data")
  UserData? userData;

  SignUpResponse({this.message, this.status, this.code});

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);
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
