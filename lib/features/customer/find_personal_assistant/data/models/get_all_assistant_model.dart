// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'get_all_assistant_model.g.dart';

@JsonSerializable()
class GetAllAssistantsModel {
  String? code;
  //Message? message;
  List<DataModel>? data;
  GetAllAssistantsModel(
      {/*required this.code,*/ required this.data, /* required this.message */});
  factory GetAllAssistantsModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllAssistantsModelFromJson(json);
}

@JsonSerializable()
class Message {
  String? scalar;

  Message({this.scalar});

 factory  Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}

@JsonSerializable()
class DataModel {
  int? id;
  String? name;
  String? email;
  String? email_verified_at;
  List<City>? city;
List<Country>? country;
  int? is_male;
  String? about;
  String? phone_number;
  String? profile_image;
  List<EducationModel>? educations;
  int? complete;
  double? rating_avrage;
  List<LanguagesModel>? languages;
  
  DataModel({
    required this.about,
    required this.city,
    required this.complete,
    required this.country,
    required this.educations,
    required this.email,
    required this.email_verified_at,
    required this.id,
    required this.is_male,
    required this.languages,
    required this.name,
    required this.phone_number,
    required this.profile_image,
    required this.rating_avrage,
  });
  factory DataModel.fromJson(Map<String, dynamic> json) => _$DataModelFromJson(json);
}

@JsonSerializable()
class City {
  int? id;
  String? title;
  City({required this.id, required this.title});
  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}

@JsonSerializable()
class Country {
  int? id;
  String? title;
  Country({required this.id, required this.title});
  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}

@JsonSerializable()
class EducationModel {
  int? id;
  String? title;
  EducationModel({required this.id, required this.title});
  factory EducationModel.fromJson(Map<String, dynamic> json) =>
      _$EducationModelFromJson(json);
}
@JsonSerializable()
class LanguagesModel {
  int? id;
  String? title;
  LanguagesModel({required this.id, required this.title});
  factory LanguagesModel.fromJson(Map<String, dynamic> json) =>
      _$LanguagesModelFromJson(json);
}