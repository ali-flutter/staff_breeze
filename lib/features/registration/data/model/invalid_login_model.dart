import 'package:json_annotation/json_annotation.dart';
import 'package:staff_breeze/features/registration/data/model/sign_in_model.dart';
part 'invalid_login_model.g.dart';
@JsonSerializable()
class InvalidLoginModel  {
  String code;
  String message;
  InvalidLoginData? data;
  InvalidLoginModel({required this.code, required this.message, this.data});
  factory InvalidLoginModel.fromJson(Map<String, dynamic> json) =>
      _$InvalidLoginModelFromJson(json);
}

@JsonSerializable()
class InvalidLoginData {
  InvalidLoginData();
  factory InvalidLoginData.fromJson(Map<String, dynamic> json) =>
      _$InvalidLoginDataFromJson(json);
}
