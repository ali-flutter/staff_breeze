// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/edit_user_details_entity.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/get_all_services_entity.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/get_cities_in_country.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/languages_entity.dart';
import 'package:staff_breeze/features/registration/domain/entities/countries_entity.dart';

import '../entities/complete_registration_entities/education_entity.dart';

abstract class CompleteRegistrationRepository {
  Future<Result<EducationsEntity>> getEducation();
  Future<Result<AllLanguagesEntity>> getLanguages();
  Future<Result<CountriesEntity>> getCountries();
  Future<Result<EditUserDetailsEntity>> editDetails({
    required String content_type,
    required String bearer_token,
     int? user_id,
    String? education_ids,

     String? email,
    int? is_male,
    String? city_id,
    int? country_id,
    String? profile_image,
    String? service_ids,
    String? phone_number,
    String? location,
    String? language_ids,
    String? about,});
  Future<Result<GetAllServicesEntity>>getAllServices();
  Future<Result<GetCitiesInCountry>>getCitiesInCountry({required country_id});
}
