// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_reservation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateReservationModel _$CreateReservationModelFromJson(
        Map<String, dynamic> json) =>
    CreateReservationModel(
      message: CreateReservationMessageModel.fromJson(
          json['message'] as Map<String, dynamic>),
      code: json['code'] as String,
    );

CreateReservationMessageModel _$CreateReservationMessageModelFromJson(
        Map<String, dynamic> json) =>
    CreateReservationMessageModel(
      error: (json['error'] as List<dynamic>).map((e) => e as String).toList(),
    );
