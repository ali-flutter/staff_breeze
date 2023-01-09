import 'package:json_annotation/json_annotation.dart';

part 'get_customer_reservation_model.g.dart';

@JsonSerializable()
class GetCustomerReservationModel {
  String code;
  GetCustomerReservationMessageModel message;
  List<GetCustomerReservationDataModel> data;

  GetCustomerReservationModel(
      {required this.code, required this.message, required this.data});

  factory GetCustomerReservationModel.fromJson(Map<String, dynamic> json) =>
      _$GetCustomerReservationModelFromJson(json);
}

@JsonSerializable()
class GetCustomerReservationMessageModel {
  List<String> error;

  GetCustomerReservationMessageModel({required this.error});

  factory GetCustomerReservationMessageModel.fromJson(
          Map<String, dynamic> json) =>
      _$GetCustomerReservationMessageModelFromJson(json);
}

@JsonSerializable()
class GetCustomerReservationDataModel {
  AssistantObjectModel assistant;
  List<String> reservation_dates;

  GetCustomerReservationDataModel({
    required this.reservation_dates,
    required this.assistant,
  });

  factory GetCustomerReservationDataModel.fromJson(Map<String, dynamic> json) =>
      _$GetCustomerReservationDataModelFromJson(json);
}

@JsonSerializable()
class AssistantObjectModel {
  int id;
  String name;
  String email;
  String email_verified_at;
  List<RoleObjectModel> role;
  List<CityObjectModel> city;
  List<CountryObjectModel> country;
  int is_male;
  String about;
  String phone_number;
  String profile_image;
  List<EducationsObjectModel> educations;
  int complete;
  double rating_avrage;
  List<LanguagesObjectModel> languages;
  List<ServicesObjectModel> services;

  AssistantObjectModel({
    required this.name,
    required this.id,
    required this.email,
    required this.email_verified_at,
    required this.role,
    required this.city,
    required this.country,
    required this.is_male,
    required this.about,
    required this.profile_image,
    required this.phone_number,
    required this.rating_avrage,
    required this.services,
    required this.languages,
    required this.complete,
    required this.educations,
  });

  factory AssistantObjectModel.fromJson(Map<String, dynamic> json) =>
      _$AssistantObjectModelFromJson(json);
}

@JsonSerializable()
class LanguagesObjectModel {
  int id;
  String title;

  LanguagesObjectModel({required this.id, required this.title});

  factory LanguagesObjectModel.fromJson(Map<String, dynamic> json) =>
      _$LanguagesObjectModelFromJson(json);
}

@JsonSerializable()
class RoleObjectModel {
  int id;
  String title;

  RoleObjectModel({required this.title, required this.id});

  factory RoleObjectModel.fromJson(Map<String, dynamic> json) =>
      _$RoleObjectModelFromJson(json);
}

@JsonSerializable()
class CityObjectModel {
  int id;
  String title;

  CityObjectModel({required this.title, required this.id});

  factory CityObjectModel.fromJson(Map<String, dynamic> json) =>
      _$CityObjectModelFromJson(json);
}

@JsonSerializable()
class CountryObjectModel {
  int id;
  String title;

  CountryObjectModel({required this.title, required this.id});

  factory CountryObjectModel.fromJson(Map<String, dynamic> json) =>
      _$CountryObjectModelFromJson(json);
}

@JsonSerializable()
class EducationsObjectModel {
  int id;
  String title;

  EducationsObjectModel({required this.title, required this.id});

  factory EducationsObjectModel.fromJson(Map<String, dynamic> json) =>
      _$EducationsObjectModelFromJson(json);
}

@JsonSerializable()
class ServicesObjectModel {
  int id;
  String title;

  ServicesObjectModel({required this.title, required this.id});

  factory ServicesObjectModel.fromJson(Map<String, dynamic> json) =>
      _$ServicesObjectModelFromJson(json);
}
