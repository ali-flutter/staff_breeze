// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInModel _$SignInModelFromJson(Map<String, dynamic> json) => SignInModel(
      code: json['code'] as String,
      message: json['message'] as String,
      data: User.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignInModelToJson(SignInModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      cityId: json['cityId'] as int?,
      countryId: json['countryId'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      email_verified_at: json['email_verified_at'] as String?,
      role_id: json['role_id'] as int?,
      isMale: json['isMale'] as int?,
      about: json['about'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      profileImage: json['profileImage'] as String?,
      deviceToken: json['deviceToken'] as String?,
      complete: json['complete'] as int?,
      location: json['location'] as String?,
    )..accessToken = json['accessToken'] as String?;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'cityId': instance.cityId,
      'countryId': instance.countryId,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.email_verified_at,
      'role_id': instance.role_id,
      'isMale': instance.isMale,
      'about': instance.about,
      'location': instance.location,
      'phoneNumber': instance.phoneNumber,
      'profileImage': instance.profileImage,
      'deviceToken': instance.deviceToken,
      'complete': instance.complete,
      'accessToken': instance.accessToken,
    };
