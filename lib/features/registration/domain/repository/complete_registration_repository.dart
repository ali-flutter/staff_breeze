// ignore_for_file: non_constant_identifier_names

import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/edit_user_details_entity.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/languages_entity.dart';
import 'package:staff_breeze/features/registration/domain/entities/countries_entity.dart';

import '../entities/complete_registration_entities/education_entity.dart';

abstract class CompleteRegistrationRepository {
  Future<Result<EducationsEntity>> getEducation();
  Future<Result<AllLanguagesEntity>> getLanguages();
  Future<Result<CountriesEntity>> getCountries();
  Future<Result<EditUserDetailsEntity>> editDetails({
     int? user_id,
     String? email,
    int? is_male,
    int? city_id,
    int? country_id,
    String? profile_image,
    String? phone_number,
    String? location,
    String? about,});
}
