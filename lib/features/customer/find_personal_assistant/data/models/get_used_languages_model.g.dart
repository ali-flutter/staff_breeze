// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_used_languages_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUsedLanguagesModel _$GetUsedLanguagesModelFromJson(
        Map<String, dynamic> json) =>
    GetUsedLanguagesModel(
      code: json['code'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              GetUsedLanguagesDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] == null
          ? null
          : GetUsedLanguagesMessageModel.fromJson(
              json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetUsedLanguagesModelToJson(
        GetUsedLanguagesModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

GetUsedLanguagesMessageModel _$GetUsedLanguagesMessageModelFromJson(
        Map<String, dynamic> json) =>
    GetUsedLanguagesMessageModel(
      error:
          (json['error'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$GetUsedLanguagesMessageModelToJson(
        GetUsedLanguagesMessageModel instance) =>
    <String, dynamic>{
      'error': instance.error,
    };

GetUsedLanguagesDataModel _$GetUsedLanguagesDataModelFromJson(
        Map<String, dynamic> json) =>
    GetUsedLanguagesDataModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GetUsedLanguagesDataModelToJson(
        GetUsedLanguagesDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
