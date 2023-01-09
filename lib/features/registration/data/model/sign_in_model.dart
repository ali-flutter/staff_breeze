// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:staff_breeze/core/error/error_model.dart';
part 'sign_in_model.g.dart';

@JsonSerializable()
class SignInModel {
  SignInModel({required this.code, required this.message,required this.data});
  String code;
  SignInMessageModel message;
  User data;

  factory SignInModel.fromJson(Map<String, dynamic> json) =>
      _$SignInModelFromJson(json);
}

@JsonSerializable()
class User {
  int? id;
  int? city_id;
  int? country_id;
  String? name;
  String? email;
  String? email_verified_at;
  String? role_id;
  int? is_male;
  String? about;
  String? location;
  String? phone_number;
  String? profile_image;
  String? device_token;
  int? complete;
  String? token;

  User(
      {required this.id,
      required this.city_id,
      required this.country_id,
      required this.name,
      required this.email,
      required this.email_verified_at,
      required this.role_id,
      required this.is_male,
      required this.about,
      required this.phone_number,
      required this.profile_image,
      required this.device_token,
      required this.complete,
      required this.location});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}


@JsonSerializable()
class SignInMessageModel{
  List<String>error;
  SignInMessageModel({required this.error}) ;
  factory SignInMessageModel.fromJson(Map<String,dynamic>json)=>_$SignInMessageModelFromJson(json);
}
