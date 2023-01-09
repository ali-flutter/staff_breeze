// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_customer_reservation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCustomerReservationModel _$GetCustomerReservationModelFromJson(
        Map<String, dynamic> json) =>
    GetCustomerReservationModel(
      code: json['code'] as String,
      message: GetCustomerReservationMessageModel.fromJson(
          json['message'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => GetCustomerReservationDataModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCustomerReservationModelToJson(
        GetCustomerReservationModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

GetCustomerReservationMessageModel _$GetCustomerReservationMessageModelFromJson(
        Map<String, dynamic> json) =>
    GetCustomerReservationMessageModel(
      error: (json['error'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$GetCustomerReservationMessageModelToJson(
        GetCustomerReservationMessageModel instance) =>
    <String, dynamic>{
      'error': instance.error,
    };

GetCustomerReservationDataModel _$GetCustomerReservationDataModelFromJson(
        Map<String, dynamic> json) =>
    GetCustomerReservationDataModel(
      reservation_dates: (json['reservation_dates'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      assistant: AssistantObjectModel.fromJson(
          json['assistant'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCustomerReservationDataModelToJson(
        GetCustomerReservationDataModel instance) =>
    <String, dynamic>{
      'assistant': instance.assistant,
      'reservation_dates': instance.reservation_dates,
    };

AssistantObjectModel _$AssistantObjectModelFromJson(
        Map<String, dynamic> json) =>
    AssistantObjectModel(
      name: json['name'] as String,
      id: json['id'] as int,
      email: json['email'] as String,
      email_verified_at: json['email_verified_at'] as String,
      role: (json['role'] as List<dynamic>)
          .map((e) => RoleObjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      city: (json['city'] as List<dynamic>)
          .map((e) => CityObjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      country: (json['country'] as List<dynamic>)
          .map((e) => CountryObjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      is_male: json['is_male'] as int,
      about: json['about'] as String,
      profile_image: json['profile_image'] as String,
      phone_number: json['phone_number'] as String,
      rating_avrage: (json['rating_avrage'] as num).toDouble(),
      services: (json['services'] as List<dynamic>)
          .map((e) => ServicesObjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      languages: (json['languages'] as List<dynamic>)
          .map((e) => LanguagesObjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      complete: json['complete'] as int,
      educations: (json['educations'] as List<dynamic>)
          .map((e) => EducationsObjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AssistantObjectModelToJson(
        AssistantObjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.email_verified_at,
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

LanguagesObjectModel _$LanguagesObjectModelFromJson(
        Map<String, dynamic> json) =>
    LanguagesObjectModel(
      id: json['id'] as int,
      title: json['title'] as String,
    );

Map<String, dynamic> _$LanguagesObjectModelToJson(
        LanguagesObjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

RoleObjectModel _$RoleObjectModelFromJson(Map<String, dynamic> json) =>
    RoleObjectModel(
      title: json['title'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$RoleObjectModelToJson(RoleObjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

CityObjectModel _$CityObjectModelFromJson(Map<String, dynamic> json) =>
    CityObjectModel(
      title: json['title'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$CityObjectModelToJson(CityObjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

CountryObjectModel _$CountryObjectModelFromJson(Map<String, dynamic> json) =>
    CountryObjectModel(
      title: json['title'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$CountryObjectModelToJson(CountryObjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

EducationsObjectModel _$EducationsObjectModelFromJson(
        Map<String, dynamic> json) =>
    EducationsObjectModel(
      title: json['title'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$EducationsObjectModelToJson(
        EducationsObjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

ServicesObjectModel _$ServicesObjectModelFromJson(Map<String, dynamic> json) =>
    ServicesObjectModel(
      title: json['title'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$ServicesObjectModelToJson(
        ServicesObjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
