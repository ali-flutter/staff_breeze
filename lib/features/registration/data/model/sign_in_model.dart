// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:staff_breeze/core/error/error_model.dart';
part 'sign_in_model.g.dart';

@JsonSerializable()
class SignInModel {
  SignInModel({required this.code, required this.message,required this.data});
  String code;
  String message;
  User data;

  factory SignInModel.fromJson(Map<String, dynamic> json) =>
      _$SignInModelFromJson(json);
}

@JsonSerializable()
class User {
  int? id;
  int? cityId;
  int? countryId;
  String? name;
  String? email;
  String? email_verified_at;
  int? role_id;
  int? isMale;
  String? about;
  String? location;
  String? phoneNumber;
  String? profileImage;
  String? deviceToken;
  int? complete;
  String? accessToken;

  User(
      {required this.id,
      required this.cityId,
      required this.countryId,
      required this.name,
      required this.email,
      required this.email_verified_at,
      required this.role_id,
      required this.isMale,
      required this.about,
      required this.phoneNumber,
      required this.profileImage,
      required this.deviceToken,
      required this.complete,
      required this.location});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
