// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_assistant_home_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalAssistantHomePageModel _$PersonalAssistantHomePageModelFromJson(
        Map<String, dynamic> json) =>
    PersonalAssistantHomePageModel(
      code: json['code'] as String,
      data: AssistantDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonalAssistantHomePageModelToJson(
        PersonalAssistantHomePageModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };

AssistantDataModel _$AssistantDataModelFromJson(Map<String, dynamic> json) =>
    AssistantDataModel(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      email_verfied_at: json['email_verfied_at'] as String?,
      role: (json['role'] as List<dynamic>)
          .map((e) => AssistantRoleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      city: (json['city'] as List<dynamic>?)
          ?.map((e) => AssistantCityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      country: (json['country'] as List<dynamic>?)
          ?.map(
              (e) => AssistantCountryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      is_male: json['is_male'] as int?,
      about: json['about'] as String?,
      phone_number: json['phone_number'] as String?,
      profile_image: json['profile_image'] as String?,
      educations: (json['educations'] as List<dynamic>?)
          ?.map((e) =>
              AssistantEducationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      complete: json['complete'] as int?,
      rating_avrage: (json['rating_avrage'] as num?)?.toDouble(),
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) =>
              AssistantLanguagesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      services: (json['services'] as List<dynamic>?)
          ?.map(
              (e) => AssistantServicesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AssistantDataModelToJson(AssistantDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'email_verfied_at': instance.email_verfied_at,
      'role': instance.role,
      'city': instance.city,
      'country': instance.country,
      'services': instance.services,
      'is_male': instance.is_male,
      'about': instance.about,
      'phone_number': instance.phone_number,
      'profile_image': instance.profile_image,
      'educations': instance.educations,
      'complete': instance.complete,
      'rating_avrage': instance.rating_avrage,
      'languages': instance.languages,
    };

AssistantServicesModel _$AssistantServicesModelFromJson(
        Map<String, dynamic> json) =>
    AssistantServicesModel(
      id: json['id'] as int,
      title: json['title'] as String,
    );

Map<String, dynamic> _$AssistantServicesModelToJson(
        AssistantServicesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

AssistantRoleModel _$AssistantRoleModelFromJson(Map<String, dynamic> json) =>
    AssistantRoleModel(
      id: json['id'] as int,
      title: json['title'] as String,
    );

Map<String, dynamic> _$AssistantRoleModelToJson(AssistantRoleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

AssistantCityModel _$AssistantCityModelFromJson(Map<String, dynamic> json) =>
    AssistantCityModel(
      id: json['id'] as int,
      title: json['title'] as String,
    );

Map<String, dynamic> _$AssistantCityModelToJson(AssistantCityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

AssistantCountryModel _$AssistantCountryModelFromJson(
        Map<String, dynamic> json) =>
    AssistantCountryModel(
      id: json['id'] as int,
      title: json['title'] as String,
    );

Map<String, dynamic> _$AssistantCountryModelToJson(
        AssistantCountryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

AssistantLanguagesModel _$AssistantLanguagesModelFromJson(
        Map<String, dynamic> json) =>
    AssistantLanguagesModel(
      id: json['id'] as int,
      title: json['title'] as String,
    );

Map<String, dynamic> _$AssistantLanguagesModelToJson(
        AssistantLanguagesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

AssistantEducationModel _$AssistantEducationModelFromJson(
        Map<String, dynamic> json) =>
    AssistantEducationModel(
      id: json['id'] as int,
      title: json['title'] as String,
    );

Map<String, dynamic> _$AssistantEducationModelToJson(
        AssistantEducationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
