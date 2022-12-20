// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:staff_breeze/core/error/error_entity.dart';
import 'package:staff_breeze/core/error/error_model.dart';

class SignInEntity extends Equatable {
  UserEntity data;
  String? code;
  String? message;

  SignInEntity({required this.data, required this.code,required this.message});
  @override
  List<Object?> get props => [data, message,code];
}

class UserEntity extends Equatable {
  int? id;
  int? cityId;
  int? countryId;
  String? name;
  String? email;
  String? email_verified_at;
  int? role_id;
  int? isMale;
  String? location;
  String? about;
  String? phoneNumber;
  String? profileImage;
  String? deviceToken;
  int? complete;
  String? accessToken;

  UserEntity({
    required this.id,
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
    required this.location,
    required this.accessToken,
  });
  @override
  List<Object?> get props => [
        id,
        cityId,
        countryId,
        name,
        email,
        email_verified_at,
        role_id,
        isMale,
        about,
        phoneNumber,
        profileImage,
        deviceToken,
        complete,
        location,
        accessToken,
      ];
}
