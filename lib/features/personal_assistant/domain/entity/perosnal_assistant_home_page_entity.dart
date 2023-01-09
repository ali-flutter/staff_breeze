// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class PersonalAssistantHomePageEntity extends Equatable {
  String code;
  //AssistantMessageEntity message;
  AssistantDataEntity data;
  PersonalAssistantHomePageEntity(
      {required this.code, required this.data, /* required this.message */});
  @override
  List<Object?> get props => [code, /* message */ data];
}

class AssistantMessageEntity extends Equatable {
  List<String> error;
  AssistantMessageEntity({required this.error});
  @override
  List<Object?> get props => [error];
}

class AssistantDataEntity extends Equatable {
  int id;
  String name;
  String email;
  String? email_verfied_at;
  List<AssistantRoleEntity> role;
  List<AssistantCityEntity> city;
  List<AssistantCountryEntity> country;
  int? is_male;
  String? about;
  String? phone_number;
  String? profile_image;
  List<AssistantEducationEntity>? educations;
  int? complete;
  double? rating_avrage;
  List<AssistantLanguagesEntity>? languages;
  List<AssistantServicesEntity>? services;
  AssistantDataEntity({
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
    required this.services
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        email_verfied_at,
        role,
        city,
        country,
        is_male,
        about,
        phone_number,
        profile_image,
        educations,
        complete,
        rating_avrage,
        languages,
       services
      ];
}

  class AssistantServicesEntity extends Equatable{
  int id;
  String title;
  AssistantServicesEntity({required this.id,required this.title});
  @override
  List<Object?> get props =>[id,title];

  }

class AssistantRoleEntity extends Equatable {
  final int id;
  final String title;
  const AssistantRoleEntity({required this.id, required this.title});

  @override
  List<Object?> get props => [id, title];
}

class AssistantCityEntity extends Equatable {
  int id;
  String title;
  AssistantCityEntity({required this.id, required this.title});

  @override
  List<Object?> get props => [id, title];
}

class AssistantCountryEntity extends Equatable {
  int id;
  String title;
  AssistantCountryEntity({required this.id, required this.title});

  @override
  List<Object?> get props => [id, title];
}

class AssistantEducationEntity extends Equatable {
  int id;
  String title;
  AssistantEducationEntity({required this.id, required this.title});

  @override
  List<Object?> get props => [id, title];
}

class AssistantLanguagesEntity extends Equatable {
  int id;
  String title;
  AssistantLanguagesEntity({required this.id, required this.title});

  @override
  List<Object?> get props => [id, title];
}
