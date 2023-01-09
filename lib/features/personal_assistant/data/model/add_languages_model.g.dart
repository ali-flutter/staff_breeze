// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_languages_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddLanguagesModel _$AddLanguagesModelFromJson(Map<String, dynamic> json) =>
    AddLanguagesModel(
      message: AddLanguageMessagesModel.fromJson(
          json['message'] as Map<String, dynamic>),
      code: json['code'] as String,
    );

Map<String, dynamic> _$AddLanguagesModelToJson(AddLanguagesModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };

AddLanguageMessagesModel _$AddLanguageMessagesModelFromJson(
        Map<String, dynamic> json) =>
    AddLanguageMessagesModel(
      error: (json['error'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AddLanguageMessagesModelToJson(
        AddLanguageMessagesModel instance) =>
    <String, dynamic>{
      'error': instance.error,
    };
