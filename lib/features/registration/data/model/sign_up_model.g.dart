// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpModel _$SignUpModelFromJson(Map<String, dynamic> json) => SignUpModel(
      code: json['code'] as String,
      message:
          SignUpMessageModel.fromJson(json['message'] as Map<String, dynamic>),
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignUpModelToJson(SignUpModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      name: json['name'] as String?,
      email: json['email'] as String?,
      role_id: json['role_id'] as String?,
      id: json['id'] as int?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'role_id': instance.role_id,
      'id': instance.id,
      'token': instance.token,
    };

SignUpMessageModel _$SignUpMessageModelFromJson(Map<String, dynamic> json) =>
    SignUpMessageModel(
      error: (json['error'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$SignUpMessageModelToJson(SignUpMessageModel instance) =>
    <String, dynamic>{
      'error': instance.error,
    };
