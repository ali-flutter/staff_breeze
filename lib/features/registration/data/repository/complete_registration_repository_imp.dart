// ignore_for_file: non_constant_identifier_names


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
import 'package:staff_breeze/features/registration/data/model/complete_registration_model/languages_model.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/edit_user_details_entity.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/languages_entity.dart';
import 'package:staff_breeze/features/registration/domain/entities/countries_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_assistant_entity.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/registration/domain/repository/complete_registration_repository.dart';

import '../../domain/entities/complete_registration_entities/education_entity.dart';
import '../model/complete_registration_model/education_model.dart';

@Singleton(as: CompleteRegistrationRepository)
class CompleteRegistrationRepositoryImp
    implements CompleteRegistrationRepository {
  CompleteRegistrationCleint cleint;
  EducationMapper educationMapper;
  LanguagesMapper languagesMapper;
  CountriesMapper countriesMapper;
  EditUserDetailsMapper editDetailsMapper;
  CompleteRegistrationRepositoryImp(
      {required this.cleint,
      required this.countriesMapper,
      required this.educationMapper,
      required this.languagesMapper,
      required this.editDetailsMapper,
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
    int? user_id,
    String? email,
    int? is_male,
    int? city_id,
    int? country_id,
    String? profile_image,
    String? phone_number,
    String? location,
    String? about,
  }) =>
      handleResponse<EditUserDetailsModel, EditUserDetailsEntity>(
          () => cleint.editDetails(
              user_id: user_id,
              email: email,
              is_male: is_male,
              city_id: city_id,
              profile_image: profile_image,
              phone_number: phone_number,
              location: location,
              about: about),
          (response)=>editDetailsMapper.mapper(response));
}
