// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SummaryPageModel _$SummaryPageModelFromJson(Map<String, dynamic> json) =>
    SummaryPageModel(
      data: SummaryPageDataModel.fromJson(json['data'] as Map<String, dynamic>),
      code: json['code'] as String,
    );

Map<String, dynamic> _$SummaryPageModelToJson(SummaryPageModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };

SummaryPageDataModel _$SummaryPageDataModelFromJson(
        Map<String, dynamic> json) =>
    SummaryPageDataModel(
      total_payment: json['total_payment'] as int?,
      starts_at: json['starts_at'] as String?,
      ends_at: json['ends_at'] as String?,
    );

Map<String, dynamic> _$SummaryPageDataModelToJson(
        SummaryPageDataModel instance) =>
    <String, dynamic>{
      'total_payment': instance.total_payment,
      'starts_at': instance.starts_at,
      'ends_at': instance.ends_at,
    };
