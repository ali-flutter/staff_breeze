// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'languages_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllLanguagesModel _$AllLanguagesModelFromJson(Map<String, dynamic> json) =>
    AllLanguagesModel(
      code: json['code'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => LanguagesDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllLanguagesModelToJson(AllLanguagesModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };

LanguagesMessageModel _$LanguagesMessageModelFromJson(
        Map<String, dynamic> json) =>
    LanguagesMessageModel(
      errors:
          (json['errors'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$LanguagesMessageModelToJson(
        LanguagesMessageModel instance) =>
    <String, dynamic>{
      'errors': instance.errors,
    };

LanguagesDataModel _$LanguagesDataModelFromJson(Map<String, dynamic> json) =>
    LanguagesDataModel(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$LanguagesDataModelToJson(LanguagesDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
