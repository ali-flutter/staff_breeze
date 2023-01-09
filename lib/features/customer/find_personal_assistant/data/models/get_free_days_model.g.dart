// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_free_days_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFreeDaysModel _$GetFreeDaysModelFromJson(Map<String, dynamic> json) =>
    GetFreeDaysModel(
      code: json['code'] as String,
      data: GetFreeDaysDataModel.fromJson(json['data'] as Map<String, dynamic>),
      message: GetFreeDaysMessageModel.fromJson(
          json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetFreeDaysModelToJson(GetFreeDaysModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

GetFreeDaysMessageModel _$GetFreeDaysMessageModelFromJson(
        Map<String, dynamic> json) =>
    GetFreeDaysMessageModel(
      error: (json['error'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$GetFreeDaysMessageModelToJson(
        GetFreeDaysMessageModel instance) =>
    <String, dynamic>{
      'error': instance.error,
    };

GetFreeDaysDataModel _$GetFreeDaysDataModelFromJson(
        Map<String, dynamic> json) =>
    GetFreeDaysDataModel(
      first_month_dates: (json['first_month_dates'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      second_month_dates: (json['second_month_dates'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$GetFreeDaysDataModelToJson(
        GetFreeDaysDataModel instance) =>
    <String, dynamic>{
      'first_month_dates': instance.first_month_dates,
      'second_month_dates': instance.second_month_dates,
    };
