// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'sign_up_model.g.dart';

@JsonSerializable()
class SignUpModel {
  String? code;
  String? message;
  Data data;
  SignUpModel({required this.message, required this.data});
  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);
}

@JsonSerializable()
class Data {
  String? name;
  String? email;
  String? role_id;
  int? id;
  String? token;

  Data(
      {required this.name,
      required this.email,
      required this.role_id,
      required this.id,
      required this.token});
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
