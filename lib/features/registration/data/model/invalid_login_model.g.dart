// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invalid_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvalidLoginModel _$InvalidLoginModelFromJson(Map<String, dynamic> json) =>
    InvalidLoginModel(
      code: json['code'] as String,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : InvalidLoginData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InvalidLoginModelToJson(InvalidLoginModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

InvalidLoginData _$InvalidLoginDataFromJson(Map<String, dynamic> json) =>
    InvalidLoginData();

Map<String, dynamic> _$InvalidLoginDataToJson(InvalidLoginData instance) =>
    <String, dynamic>{};
