// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_assistant_reservation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAssistantReservationModel _$GetAssistantReservationModelFromJson(
        Map<String, dynamic> json) =>
    GetAssistantReservationModel(
      message: GetAssistantReservationMessageModel.fromJson(
          json['message'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => GetAssistantReservationDataModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      code: json['code'] as String,
    );

GetAssistantReservationMessageModel
    _$GetAssistantReservationMessageModelFromJson(Map<String, dynamic> json) =>
        GetAssistantReservationMessageModel(
          error:
              (json['error'] as List<dynamic>).map((e) => e as String).toList(),
        );

Map<String, dynamic> _$GetAssistantReservationMessageModelToJson(
        GetAssistantReservationMessageModel instance) =>
    <String, dynamic>{
      'error': instance.error,
    };

GetAssistantReservationDataModel _$GetAssistantReservationDataModelFromJson(
        Map<String, dynamic> json) =>
    GetAssistantReservationDataModel(
      customer:
          CustomerDataModel.fromJson(json['customer'] as Map<String, dynamic>),
      reservation_dates: (json['reservation_dates'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$GetAssistantReservationDataModelToJson(
        GetAssistantReservationDataModel instance) =>
    <String, dynamic>{
      'customer': instance.customer,
      'reservation_dates': instance.reservation_dates,
    };

CustomerDataModel _$CustomerDataModelFromJson(Map<String, dynamic> json) =>
    CustomerDataModel(
      email: json['email'] as String,
      city: (json['city'] as List<dynamic>)
          .map((e) => CityObjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      role: (json['role'] as List<dynamic>)
          .map((e) => RoleObjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      is_male: json['is_male'] as int,
      about: json['about'] as String,
      languages: (json['languages'] as List<dynamic>)
          .map((e) => LanguagesObjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      services: (json['services'] as List<dynamic>)
          .map((e) => ServicesObjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      country: (json['country'] as List<dynamic>)
          .map((e) => CountryObjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      complete: json['complete'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      profile_image: json['profile_image'] as String,
      educations: (json['educations'] as List<dynamic>)
          .map((e) => EducationsObjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      rating_avrage: json['rating_avrage'] as int,
      phone_number: json['phone_number'] as String,
      emailVerifiedAt: json['emailVerifiedAt'] as String,
    );

Map<String, dynamic> _$CustomerDataModelToJson(CustomerDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'emailVerifiedAt': instance.emailVerifiedAt,
      'role': instance.role,
      'city': instance.city,
      'country': instance.country,
      'is_male': instance.is_male,
      'about': instance.about,
      'phone_number': instance.phone_number,
      'profile_image': instance.profile_image,
      'educations': instance.educations,
      'complete': instance.complete,
      'rating_avrage': instance.rating_avrage,
      'languages': instance.languages,
      'services': instance.services,
    };
