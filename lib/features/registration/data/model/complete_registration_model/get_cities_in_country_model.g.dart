// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cities_in_country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCitiesInCountryModel _$GetCitiesInCountryModelFromJson(
        Map<String, dynamic> json) =>
    GetCitiesInCountryModel(
      code: json['code'] as String,
      message: GetCitiesInCountryMessageModel.fromJson(
          json['message'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              GetCitiesInCountryDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCitiesInCountryModelToJson(
        GetCitiesInCountryModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

GetCitiesInCountryMessageModel _$GetCitiesInCountryMessageModelFromJson(
        Map<String, dynamic> json) =>
    GetCitiesInCountryMessageModel(
      error: (json['error'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$GetCitiesInCountryMessageModelToJson(
        GetCitiesInCountryMessageModel instance) =>
    <String, dynamic>{
      'error': instance.error,
    };

GetCitiesInCountryDataModel _$GetCitiesInCountryDataModelFromJson(
        Map<String, dynamic> json) =>
    GetCitiesInCountryDataModel(
      title: json['title'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$GetCitiesInCountryDataModelToJson(
        GetCitiesInCountryDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
