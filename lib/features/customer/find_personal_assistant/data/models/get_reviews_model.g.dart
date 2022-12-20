// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_reviews_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetReviewsModel _$GetReviewsModelFromJson(Map<String, dynamic> json) =>
    GetReviewsModel(
      code: json['code'] as String?,
      data: (json['data'] as List<dynamic>)
          .map((e) => DataReviewsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] == null
          ? null
          : MessageReviewsModel.fromJson(
              json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetReviewsModelToJson(GetReviewsModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

MessageReviewsModel _$MessageReviewsModelFromJson(Map<String, dynamic> json) =>
    MessageReviewsModel(
      error:
          (json['error'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$MessageReviewsModelToJson(
        MessageReviewsModel instance) =>
    <String, dynamic>{
      'error': instance.error,
    };

DataReviewsModel _$DataReviewsModelFromJson(Map<String, dynamic> json) =>
    DataReviewsModel(
      id: json['id'] as int,
      client_id: json['client_id'] as int,
      client_name: json['client_name'] as String,
      client_profile_image: json['client_profile_image'] as String,
      body: json['body'] as String,
      is_read: json['is_read'] as int?,
      accepted: json['accepted'] as int?,
      created_at: json['created_at'] as String?,
    );

Map<String, dynamic> _$DataReviewsModelToJson(DataReviewsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'client_id': instance.client_id,
      'client_name': instance.client_name,
      'client_profile_image': instance.client_profile_image,
      'body': instance.body,
      'is_read': instance.is_read,
      'accepted': instance.accepted,
      'created_at': instance.created_at,
    };
