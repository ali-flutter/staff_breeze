// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddReviewModel _$AddReviewModelFromJson(Map<String, dynamic> json) =>
    AddReviewModel(
      code: json['code'] as String,
      message: AddReviewMessageModel.fromJson(
          json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddReviewModelToJson(AddReviewModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };

AddReviewMessageModel _$AddReviewMessageModelFromJson(
        Map<String, dynamic> json) =>
    AddReviewMessageModel(
      error: (json['error'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AddReviewMessageModelToJson(
        AddReviewMessageModel instance) =>
    <String, dynamic>{
      'error': instance.error,
    };
