// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInModel _$SignInModelFromJson(Map<String, dynamic> json) => SignInModel(
      code: json['code'] as String,
      message:
          SignInMessageModel.fromJson(json['message'] as Map<String, dynamic>),
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
      city_id: json['city_id'] as int?,
      country_id: json['country_id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      email_verified_at: json['email_verified_at'] as String?,
      role_id: json['role_id'] as String?,
      is_male: json['is_male'] as int?,
      about: json['about'] as String?,
      phone_number: json['phone_number'] as String?,
      profile_image: json['profile_image'] as String?,
      device_token: json['device_token'] as String?,
      complete: json['complete'] as int?,
      location: json['location'] as String?,
    )..token = json['token'] as String?;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'city_id': instance.city_id,
      'country_id': instance.country_id,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.email_verified_at,
      'role_id': instance.role_id,
      'is_male': instance.is_male,
      'about': instance.about,
      'location': instance.location,
      'phone_number': instance.phone_number,
      'profile_image': instance.profile_image,
      'device_token': instance.device_token,
      'complete': instance.complete,
      'token': instance.token,
    };

SignInMessageModel _$SignInMessageModelFromJson(Map<String, dynamic> json) =>
    SignInMessageModel(
      error: (json['error'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$SignInMessageModelToJson(SignInMessageModel instance) =>
    <String, dynamic>{
      'error': instance.error,
    };
