// ignore_for_file: non_constant_identifier_names


import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/handle_response.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/models/get_all_assistant_model.dart';
import 'package:staff_breeze/features/registration/data/data_source/network/complete_registration_network/complete_registraition_client.dart';
import 'package:staff_breeze/features/registration/data/mapper/complete_registration_mappers/countries_mappers.dart';
import 'package:staff_breeze/features/registration/data/mapper/complete_registration_mappers/edit_user_details_mapper.dart';
import 'package:staff_breeze/features/registration/data/mapper/complete_registration_mappers/education_mappers.dart';
import 'package:staff_breeze/features/registration/data/mapper/complete_registration_mappers/languages_mappers.dart';
import 'package:staff_breeze/features/registration/data/model/complete_registration_model/countries_model.dart';
import 'package:staff_breeze/features/registration/data/model/complete_registration_model/edit_user_details_model.dart';
import 'package:staff_breeze/features/registration/data/model/complete_registration_model/get_all_services_model.dart';
import 'package:staff_breeze/features/registration/data/model/complete_registration_model/get_cities_in_country_model.dart';
import 'package:staff_breeze/features/registration/data/model/complete_registration_model/languages_model.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/edit_user_details_entity.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/get_all_services_entity.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/get_cities_in_country.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/languages_entity.dart';
import 'package:staff_breeze/features/registration/domain/entities/countries_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_assistant_entity.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/registration/domain/repository/complete_registration_repository.dart';

import '../../domain/entities/complete_registration_entities/education_entity.dart';
import '../mapper/complete_registration_mappers/get_all_services_mappers.dart';
import '../mapper/complete_registration_mappers/get_cities_in_country_mappers.dart';
import '../model/complete_registration_model/education_model.dart';

@Singleton(as: CompleteRegistrationRepository)
class CompleteRegistrationRepositoryImp
    implements CompleteRegistrationRepository {
  CompleteRegistrationCleint cleint;
  EducationMapper educationMapper;
  LanguagesMapper languagesMapper;
  CountriesMapper countriesMapper;
  EditUserDetailsMapper editDetailsMapper;
  GetAllServicesMappers allServicesMapper;
  GetCitiesInCountryMapper citiesInCountryMapper;
  CompleteRegistrationRepositoryImp(
      {required this.cleint,
      required this.countriesMapper,
      required this.educationMapper,
      required this.languagesMapper,
      required this.editDetailsMapper,
        required this.allServicesMapper,
       required this.citiesInCountryMapper,
      });
  @override
  Future<Result<CountriesEntity>> getCountries() =>
      handleResponse<CountriesModel, CountriesEntity>(
          () => cleint.getCountries(),
          (response) => countriesMapper.mapper(response));

  @override
  Future<Result<EducationsEntity>> getEducation() =>
      handleResponse<EducationsModel, EducationsEntity>(
          () => cleint.getEducation(),
          (response) => educationMapper.mapper(response));

  @override
  Future<Result<AllLanguagesEntity>> getLanguages() =>
      handleResponse<AllLanguagesModel, AllLanguagesEntity>(
          () => cleint.getLanguages(),
          (response) => languagesMapper.languageMapper(response));

  @override
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
    String? about,
    String? language_ids,
  }) =>
      handleResponse<EditUserDetailsModel, EditUserDetailsEntity>(
          () => cleint.editDetails(
              content_type: content_type,
              bearer_token:bearer_token,
            country_id: country_id,
              user_id: user_id,
              service_ids: service_ids,
              email: email,
              is_male: is_male,
              city_id: city_id,
              language_ids:language_ids,
              education_ids: education_ids,
              profile_image: profile_image,
              phone_number: phone_number,
              location: location,
              about: about),
          (response)=>editDetailsMapper.mapper(response));

  @override
  Future<Result<GetAllServicesEntity>> getAllServices()=>handleResponse<GetAllServicesModel,GetAllServicesEntity>(
          () =>cleint.getAllServices() ,
        (response) => allServicesMapper.mapper(response),);

  @override
  Future<Result<GetCitiesInCountry>> getCitiesInCountry({required country_id}) =>handleResponse<GetCitiesInCountryModel,GetCitiesInCountry>(
          () =>cleint.getCitiesInCountry(country_id: country_id),
          (response) =>citiesInCountryMapper.mapper(response));

}
