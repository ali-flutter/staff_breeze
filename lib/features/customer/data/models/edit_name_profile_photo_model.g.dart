// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_name_profile_photo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditNameProfilePhotoModel _$EditNameProfilePhotoModelFromJson(
        Map<String, dynamic> json) =>
    EditNameProfilePhotoModel(
      code: json['code'] as String,
      message: EditNameProfilePhotoMessageModel.fromJson(
          json['message'] as Map<String, dynamic>),
      data: EditNameProfilePhotoDataModel.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EditNameProfilePhotoModelToJson(
        EditNameProfilePhotoModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

EditNameProfilePhotoMessageModel _$EditNameProfilePhotoMessageModelFromJson(
        Map<String, dynamic> json) =>
    EditNameProfilePhotoMessageModel(
      error: (json['error'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$EditNameProfilePhotoMessageModelToJson(
        EditNameProfilePhotoMessageModel instance) =>
    <String, dynamic>{
      'error': instance.error,
    };

EditNameProfilePhotoDataModel _$EditNameProfilePhotoDataModelFromJson(
        Map<String, dynamic> json) =>
    EditNameProfilePhotoDataModel(
      profile_image: json['profile_image'] as String?,
      name: json['name'] as String?,
      id: json['id'] as int?,
      about: json['about'] as String?,
    );

Map<String, dynamic> _$EditNameProfilePhotoDataModelToJson(
        EditNameProfilePhotoDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'about': instance.about,
      'profile_image': instance.profile_image,
    };
