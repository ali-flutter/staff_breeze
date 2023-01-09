// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_assistant_entity.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/edit_user_details_entity.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/get_all_services_entity.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/get_cities_in_country.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/languages_entity.dart';
import 'package:staff_breeze/features/registration/domain/entities/countries_entity.dart';
import 'package:staff_breeze/features/registration/domain/repository/complete_registration_repository.dart';

import '../../../../core/network_configration/result.dart';
import '../entities/complete_registration_entities/education_entity.dart';

@injectable
class CompleteRegistrationUseCases {
  const CompleteRegistrationUseCases(
      {required this.completeRegistrationRepository});
  final CompleteRegistrationRepository completeRegistrationRepository;

  Future<Result<EducationsEntity>> getEducation() {
    return completeRegistrationRepository.getEducation();
  }

  Future<Result<AllLanguagesEntity>> getLanguages() {
    return completeRegistrationRepository.getLanguages();
  }

  Future<Result<CountriesEntity>> getCountries() {
    return completeRegistrationRepository.getCountries();
  }

  Future<Result<EditUserDetailsEntity>> editDetails({
    required String bearer_token,
    required String content_type,
    int? user_id,
     String? email,
    String?language_ids,
    int? is_male,
    String? service_ids,
    String? city_id,
    int? country_id,
    String? profile_image,
    String? phone_number,
    String? location,
    String? education_ids,
    String? about,}) {
    return completeRegistrationRepository.editDetails(
     content_type: content_type,

      service_ids: service_ids,
      education_ids:education_ids,
      bearer_token: bearer_token,
      user_id: user_id,
     email: email,
      language_ids:language_ids,
     is_male: is_male,
     city_id:city_id,
    country_id: country_id,
    profile_image: profile_image,
    phone_number: phone_number,
    location: location,
    about: about,
    );
  }
  Future<Result<GetAllServicesEntity>>getAllServices(){
    return completeRegistrationRepository.getAllServices()  ;
  }
  Future <Result<GetCitiesInCountry>>getCitiesInCountry({required int country_id}){
    return completeRegistrationRepository.getCitiesInCountry(country_id: country_id);
  }
}
