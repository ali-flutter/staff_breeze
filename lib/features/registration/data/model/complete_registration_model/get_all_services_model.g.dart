// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_services_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllServicesModel _$GetAllServicesModelFromJson(Map<String, dynamic> json) =>
    GetAllServicesModel(
      code: json['code'] as String,
      message: GetAllServicesMessageModel.fromJson(
          json['message'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              GetAllServicesDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllServicesModelToJson(
        GetAllServicesModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

GetAllServicesMessageModel _$GetAllServicesMessageModelFromJson(
        Map<String, dynamic> json) =>
    GetAllServicesMessageModel(
      error: (json['error'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$GetAllServicesMessageModelToJson(
        GetAllServicesMessageModel instance) =>
    <String, dynamic>{
      'error': instance.error,
    };

GetAllServicesDataModel _$GetAllServicesDataModelFromJson(
        Map<String, dynamic> json) =>
    GetAllServicesDataModel(
      id: json['id'] as int,
      title: json['title'] as String,
    );

Map<String, dynamic> _$GetAllServicesDataModelToJson(
        GetAllServicesDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
