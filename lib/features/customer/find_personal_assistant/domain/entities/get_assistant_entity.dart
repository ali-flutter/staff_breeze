// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetAssistantEntity extends Equatable {
  String? code;
  //MessageEntity? message;
  List<AssistantsDataEntity>? data;
  GetAssistantEntity({
  /*  required this.code,*/
    required this.data,
    /* required this.message */
  });
  @override
  List<Object?> get props => [/*code,*/ /*  message, */ data];
}

class MessageEntity extends Equatable {
  String? scalar;
  MessageEntity({required this.scalar});
  @override
  List<Object?> get props => [scalar];
}

class AssistantsDataEntity extends Equatable {
  int? id;
  String? name;
  String? email;
  String? email_verified_at;
  List<CityObjectEntity>? city;
  List<CountryObjectEntity>? country;
  int? isMale;
  String? about;
  String? phone_number;
  String? profile_image;
  List<EducationEntity>? education;
  int? complete;
  double? rating_avrage;
  List<LanguageEntity>? languages;

  AssistantsDataEntity({
    required this.email,
    required this.email_verified_at,
    required this.id,
    required this.name,
    required this.city,
    required this.country,
    required this.about,
    required this.complete,
    required this.education,
    required this.isMale,
    required this.languages,
    required this.phone_number,
    required this.profile_image,
    required this.rating_avrage,
  });
  @override
  List<Object?> get props => [
        id,
        name,
        email,
        email_verified_at,
        city,
        country,
        about,
        complete,
        education,
        isMale,
        languages,
        phone_number,
        profile_image,
        rating_avrage
      ];
}

class CityObjectEntity extends Equatable {
  final int? id;
  final String? title;
 const CityObjectEntity({required this.id, this.title});

  @override
  List<Object?> get props => [id,title];
}

class CountryObjectEntity extends Equatable {
  final int? id;
  final String? title;
  const CountryObjectEntity({required this.id, required this.title});
  @override
  List<Object?> get props => [id, title];
}

class LanguageEntity extends Equatable {
  final int? id;
  final String? title;
  const LanguageEntity({required this.id, required this.title});

  @override
  List<Object?> get props => [id, title];
}

class EducationEntity extends Equatable {
  final int? id;
  final String? title;
  const EducationEntity({required this.id, required this.title});

  @override
  List<Object?> get props => [id, title];
}
