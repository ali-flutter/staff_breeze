// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insert_free_days_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsertFreeDaysModel _$InsertFreeDaysModelFromJson(Map<String, dynamic> json) =>
    InsertFreeDaysModel(
      code: json['code'] as String,
      message: InsertFreeDaysMessageModel.fromJson(
          json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InsertFreeDaysModelToJson(
        InsertFreeDaysModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };

InsertFreeDaysMessageModel _$InsertFreeDaysMessageModelFromJson(
        Map<String, dynamic> json) =>
    InsertFreeDaysMessageModel(
      error: (json['error'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$InsertFreeDaysMessageModelToJson(
        InsertFreeDaysMessageModel instance) =>
    <String, dynamic>{
      'error': instance.error,
    };
