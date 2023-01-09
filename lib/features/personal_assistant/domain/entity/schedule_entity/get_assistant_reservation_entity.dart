import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:staff_breeze/features/customer/domain/entities/get_customer_reservation_entity.dart';

class GetAssistantReservationEntity extends Equatable {
  String code;
  GetAssistantReservationMessageEntity message;
  List<GetAssistantReservationDataEntity> data;

  GetAssistantReservationEntity(
      {required this.code, required this.message, required this.data});

  @override
  List<Object?> get props => [message, data, code];
}

class GetAssistantReservationMessageEntity extends Equatable {
  List<String> error;

  GetAssistantReservationMessageEntity({required this.error});

  @override
  List<Object?> get props => [error];
}

class GetAssistantReservationDataEntity extends Equatable {
  GetCustomerDataEntity customer;
  List<String> reservation_dates;

  GetAssistantReservationDataEntity(
      {required this.customer, required this.reservation_dates});

  @override
  List<Object?> get props => [customer, reservation_dates];
}

class GetCustomerDataEntity extends Equatable {
  int id;
  String name;
  String email;
  String email_verifie_at;
  List<AssistantRoleObjectEntity> role;
  List<AssistantCityObjectEntity> city;
  List<AssistantCountryObjectEntity> country;
  int is_male;
  String about;
  String phoneNumber;
  String profileImage;
  List<AssistantEducationObjectEntity> educations;
  int complete;
  int ratingAvrage;
  List<AssistantLanguagesObjectEntity> languages;
  List<AssistantServicesObjectEntity> services;

  GetCustomerDataEntity({
    required this.name,
    required this.id,
    required this.complete,
    required this.country,
    required this.educations,
    required this.services,
    required this.languages,
    required this.about,
    required this.is_male,
    required this.email,
    required this.phoneNumber,
    required this.role,
    required this.profileImage,
    required this.city,
    required this.ratingAvrage,
    required this.email_verifie_at,
  });

  @override
  List<Object?> get props => [
        services,
        languages,
        ratingAvrage,
        complete,
        profileImage,
        phoneNumber,
        about,
        is_male,
        country,
        city,
        role,
        email,
        email_verifie_at,
        name,
        id,
      ];
}

class AssistantRoleObjectEntity extends Equatable {
  int id;
  String name;

  AssistantRoleObjectEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}

class AssistantEducationObjectEntity extends Equatable {
  int id;
  String name;

  AssistantEducationObjectEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}

class AssistantServicesObjectEntity extends Equatable {
  int id;
  String name;

  AssistantServicesObjectEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}

class AssistantLanguagesObjectEntity extends Equatable {
  int id;
  String name;

  AssistantLanguagesObjectEntity({required this.name, required this.id});

  @override
  List<Object?> get props => [name, id];
}

class AssistantCityObjectEntity extends Equatable {
  int id;
  String name;

  AssistantCityObjectEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}

class AssistantCountryObjectEntity extends Equatable {
  int id;
  String name;

  AssistantCountryObjectEntity({required this.name, required this.id});

  @override
  List<Object?> get props => [id, name];
}
