// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_customer_info_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCustomerInfoModel _$GetCustomerInfoModelFromJson(
        Map<String, dynamic> json) =>
    GetCustomerInfoModel(
      code: json['code'] as String,
      message: GetCustomerInfoMessageModel.fromJson(
          json['message'] as Map<String, dynamic>),
      data: GetCustomerInfoDataModel.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCustomerInfoModelToJson(
        GetCustomerInfoModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

GetCustomerInfoMessageModel _$GetCustomerInfoMessageModelFromJson(
        Map<String, dynamic> json) =>
    GetCustomerInfoMessageModel(
      error: (json['error'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$GetCustomerInfoMessageModelToJson(
        GetCustomerInfoMessageModel instance) =>
    <String, dynamic>{
      'error': instance.error,
    };

GetCustomerInfoDataModel _$GetCustomerInfoDataModelFromJson(
        Map<String, dynamic> json) =>
    GetCustomerInfoDataModel(
      about: json['about'] as String?,
      name: json['name'] as String?,
      profile_image: json['profile_image'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$GetCustomerInfoDataModelToJson(
        GetCustomerInfoDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'about': instance.about,
      'profile_image': instance.profile_image,
    };
