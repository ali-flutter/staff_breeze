// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_user_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditUserDetailsModel _$EditUserDetailsModelFromJson(
        Map<String, dynamic> json) =>
    EditUserDetailsModel(
      code: json['code'] as String,
      message: EditUserDetailsMessageModel.fromJson(
          json['message'] as Map<String, dynamic>),
    );

EditUserDetailsMessageModel _$EditUserDetailsMessageModelFromJson(
        Map<String, dynamic> json) =>
    EditUserDetailsMessageModel(
      error: (json['error'] as List<dynamic>).map((e) => e as String).toList(),
    );
