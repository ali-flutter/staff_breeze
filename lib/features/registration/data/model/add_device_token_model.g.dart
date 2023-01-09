// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_device_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddDeviceTokenModel _$AddDeviceTokenModelFromJson(Map<String, dynamic> json) =>
    AddDeviceTokenModel(
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] as int,
    );

Map<String, dynamic> _$AddDeviceTokenModelToJson(
        AddDeviceTokenModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
