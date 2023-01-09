// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_about_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAboutModel _$AddAboutModelFromJson(Map<String, dynamic> json) =>
    AddAboutModel(
      message: AddAboutMessageModel.fromJson(
          json['message'] as Map<String, dynamic>),
      code: json['code'] as String,
    );

Map<String, dynamic> _$AddAboutModelToJson(AddAboutModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };

AddAboutMessageModel _$AddAboutMessageModelFromJson(
        Map<String, dynamic> json) =>
    AddAboutMessageModel(
      error: (json['error'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AddAboutMessageModelToJson(
        AddAboutMessageModel instance) =>
    <String, dynamic>{
      'error': instance.error,
    };
