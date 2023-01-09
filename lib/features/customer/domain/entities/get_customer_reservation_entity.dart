import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/models/get_all_assistant_model.dart';

class GetCustomerReservationEntity extends Equatable {
  String code;
  GetCustomerReservationMessageEntity message;
  List<GetCustomerReservationDataEntity> data;

  GetCustomerReservationEntity(
      {required this.code, required this.message, required this.data});

  @override
  List<Object?> get props => [code, message, data];
}

class GetCustomerReservationMessageEntity extends Equatable {
  List<String> error;

  GetCustomerReservationMessageEntity({required this.error});

  @override
  List<Object?> get props => [error];
}

class GetCustomerReservationDataEntity extends Equatable {
   AssistantObjectEntity assistant;
  List<String>reservation_dates;
  GetCustomerReservationDataEntity({required this.assistant,required this.reservation_dates});
  @override
  List<Object?> get props => [assistant,reservation_dates];
}

class AssistantObjectEntity extends Equatable {
  int id;
  String name;
  String email;
  String  email_verified_at;
  List<RoleObjectEntity> role;
  List<CityObjectEntity> city;
  List<CountryObjectEntity> country;
  int is_male;
  String about;
  String phone_number;
  String profile_image;
  List<EducationObjectEntity> educations;
  int complete;
  double rating_avrage;
  List<LanguagesObjectEntity> languages;
  List<ServicesObjectEntity> services;


  AssistantObjectEntity({
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

  @override
  List<Object?> get props => [
        name,
        id,
        email,
        email_verified_at,
        role,
        city,
        country,
        is_male,
        about,
        profile_image,
        phone_number,
        rating_avrage,
        services,
        educations,

        country,
        complete,
        city,
      ];
}

class RoleObjectEntity extends Equatable {
  int id;
  String name;

  RoleObjectEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}

class EducationObjectEntity extends Equatable {
  int id;
  String name;

  EducationObjectEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}

class ServicesObjectEntity extends Equatable {
  int id;
  String name;

  ServicesObjectEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}

class LanguagesObjectEntity extends Equatable {
  int id;
  String name;

  LanguagesObjectEntity({required this.name, required this.id});

  @override
  List<Object?> get props => [name, id];
}

class CityObjectEntity extends Equatable {
  int id;
  String name;

  CityObjectEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}

class CountryObjectEntity extends Equatable {
  int id;
  String name;

  CountryObjectEntity({required this.name, required this.id});

  @override
  List<Object?> get props => [id, name];
}
