// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_assistant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllAssistantsModel _$GetAllAssistantsModelFromJson(
        Map<String, dynamic> json) =>
    GetAllAssistantsModel(
      code: json['code'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllAssistantsModelToJson(
        GetAllAssistantsModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      scalar: json['scalar'] as String?,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'scalar': instance.scalar,
    };

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      about: json['about'] as String?,
      city: (json['city'] as List<dynamic>?)
          ?.map((e) => City.fromJson(e as Map<String, dynamic>))
          .toList(),
      complete: json['complete'] as int?,
      country: (json['country'] as List<dynamic>?)
          ?.map((e) => Country.fromJson(e as Map<String, dynamic>))
          .toList(),
      educations: (json['educations'] as List<dynamic>?)
          ?.map((e) => EducationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      email: json['email'] as String?,
      email_verified_at: json['email_verified_at'] as String?,
      id: json['id'] as int?,
      isMale: json['isMale'] as int?,
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => LanguagesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      phone_number: json['phone_number'] as String?,
      profile_image: json['profile_image'] as String?,
      rating_avrage: (json['rating_avrage'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.email_verified_at,
      'city': instance.city,
      'country': instance.country,
      'isMale': instance.isMale,
      'about': instance.about,
      'phone_number': instance.phone_number,
      'profile_image': instance.profile_image,
      'educations': instance.educations,
      'complete': instance.complete,
      'rating_avrage': instance.rating_avrage,
      'languages': instance.languages,
    };

City _$CityFromJson(Map<String, dynamic> json) => City(
      id: json['id'] as int?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      id: json['id'] as int?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

EducationModel _$EducationModelFromJson(Map<String, dynamic> json) =>
    EducationModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$EducationModelToJson(EducationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

LanguagesModel _$LanguagesModelFromJson(Map<String, dynamic> json) =>
    LanguagesModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$LanguagesModelToJson(LanguagesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
