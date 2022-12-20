// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'personal_assistant_home_page_model.g.dart';

@JsonSerializable()
class PersonalAssistantHomePageModel {
  String code;
  AssistantMessageModel message;
  AssistantDataModel data;

  PersonalAssistantHomePageModel(
      {required this.code, required this.message, required this.data});
  factory PersonalAssistantHomePageModel.fromJson(Map<String, dynamic> json) =>
      _$PersonalAssistantHomePageModelFromJson(json);
}

@JsonSerializable()
class AssistantDataModel {
  int id;
  String name;
  String email;
  String email_verfied_at;
  List<AssistantRoleModel> role;
  List<AssistantCityModel> city;
  List<AssistantCountryModel> country;
  int is_male;
  String about;
  String phone_number;
  String profile_image;
  List<AssistantEducationModel> educations;
  int complete;
  double rating_avrage;
  List<AssistantLanguagesModel> languages;
  AssistantDataModel({
    required this.id,
    required this.name,
    required this.email,
    required this.email_verfied_at,
    required this.role,
    required this.city,
    required this.country,
    required this.is_male,
    required this.about,
    required this.phone_number,
    required this.profile_image,
    required this.educations,
    required this.complete,
    required this.rating_avrage,
    required this.languages,
  });
  factory AssistantDataModel.fromJson(Map<String, dynamic> json) =>
      _$AssistantDataModelFromJson(json);
}

@JsonSerializable()
class AssistantMessageModel {
  List<String> error;
  AssistantMessageModel({required this.error});
  factory AssistantMessageModel.fromJson(Map<String, dynamic> json) =>
      _$AssistantMessageModelFromJson(json);
}

@JsonSerializable()
class AssistantRoleModel {
  int id;
  String title;
  AssistantRoleModel({required this.id, required this.title});
  factory AssistantRoleModel.fromJson(Map<String, dynamic> json) =>
      _$AssistantRoleModelFromJson(json);
}

@JsonSerializable()
class AssistantCityModel {
  int id;
  String title;
  AssistantCityModel({required this.id, required this.title});
  factory AssistantCityModel.fromJson(Map<String, dynamic> json) =>
      _$AssistantCityModelFromJson(json);
}

@JsonSerializable()
class AssistantCountryModel {
  int id;
  String title;
  AssistantCountryModel({required this.id, required this.title});
  factory AssistantCountryModel.fromJson(Map<String, dynamic> json) =>
      _$AssistantCountryModelFromJson(json);
}

@JsonSerializable()
class AssistantLanguagesModel {
  int id;
  String title;
  AssistantLanguagesModel({required this.id, required this.title});
  factory AssistantLanguagesModel.fromJson(Map<String, dynamic> json) =>
      _$AssistantLanguagesModelFromJson(json);
}

@JsonSerializable()
class AssistantEducationModel {
  int id;
  String title;
  AssistantEducationModel({required this.id, required this.title});
  factory AssistantEducationModel.fromJson(Map<String, dynamic> json) =>
      _$AssistantEducationModelFromJson(json);
}
