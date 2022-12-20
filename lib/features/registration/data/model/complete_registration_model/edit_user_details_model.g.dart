// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_user_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditUserDetailsModel _$EditUserDetailsModelFromJson(
        Map<String, dynamic> json) =>
    EditUserDetailsModel(
      code: json['code'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              EditUserDetailsDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: EditUserDetailsMessageModel.fromJson(
          json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EditUserDetailsModelToJson(
        EditUserDetailsModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

EditUserDetailsMessageModel _$EditUserDetailsMessageModelFromJson(
        Map<String, dynamic> json) =>
    EditUserDetailsMessageModel(
      error: (json['error'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$EditUserDetailsMessageModelToJson(
        EditUserDetailsMessageModel instance) =>
    <String, dynamic>{
      'error': instance.error,
    };

EditUserDetailsDataModel _$EditUserDetailsDataModelFromJson(
        Map<String, dynamic> json) =>
    EditUserDetailsDataModel();

Map<String, dynamic> _$EditUserDetailsDataModelToJson(
        EditUserDetailsDataModel instance) =>
    <String, dynamic>{};
