// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EducationsModel _$EducationsModelFromJson(Map<String, dynamic> json) =>
    EducationsModel(
      code: json['code'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => EducationDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EducationsModelToJson(EducationsModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };

EducationMessageModel _$EducationMessageModelFromJson(
        Map<String, dynamic> json) =>
    EducationMessageModel(
      errors:
          (json['errors'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$EducationMessageModelToJson(
        EducationMessageModel instance) =>
    <String, dynamic>{
      'errors': instance.errors,
    };

EducationDataModel _$EducationDataModelFromJson(Map<String, dynamic> json) =>
    EducationDataModel(
      id: json['id'] as int,
      title: json['title'] as String,
    );

Map<String, dynamic> _$EducationDataModelToJson(EducationDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
