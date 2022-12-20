// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountriesModel _$CountriesModelFromJson(Map<String, dynamic> json) =>
    CountriesModel(
      code: json['code'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => CountriesDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CountriesModelToJson(CountriesModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };

CountriesMessageModel _$CountriesMessageModelFromJson(
        Map<String, dynamic> json) =>
    CountriesMessageModel(
      errors:
          (json['errors'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CountriesMessageModelToJson(
        CountriesMessageModel instance) =>
    <String, dynamic>{
      'errors': instance.errors,
    };

CountriesDataModel _$CountriesDataModelFromJson(Map<String, dynamic> json) =>
    CountriesDataModel(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$CountriesDataModelToJson(CountriesDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
