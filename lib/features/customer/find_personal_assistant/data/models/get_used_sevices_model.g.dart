// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_used_sevices_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUsedServicesModel _$GetUsedServicesModelFromJson(
        Map<String, dynamic> json) =>
    GetUsedServicesModel(
      code: json['code'] as String,
      message: GetUsedServicesMessageModel.fromJson(
          json['message'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              GetUsedServicesDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetUsedServicesModelToJson(
        GetUsedServicesModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

GetUsedServicesMessageModel _$GetUsedServicesMessageModelFromJson(
        Map<String, dynamic> json) =>
    GetUsedServicesMessageModel(
      error: (json['error'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$GetUsedServicesMessageModelToJson(
        GetUsedServicesMessageModel instance) =>
    <String, dynamic>{
      'error': instance.error,
    };

GetUsedServicesDataModel _$GetUsedServicesDataModelFromJson(
        Map<String, dynamic> json) =>
    GetUsedServicesDataModel(
      id: json['id'] as int,
      title: json['title'] as String,
    );

Map<String, dynamic> _$GetUsedServicesDataModelToJson(
        GetUsedServicesDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
