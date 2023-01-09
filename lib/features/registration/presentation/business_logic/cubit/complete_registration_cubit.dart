// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/edit_user_details_entity.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/get_all_services_entity.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/get_cities_in_country.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/languages_entity.dart';
import 'package:staff_breeze/features/registration/domain/entities/countries_entity.dart';
import 'package:staff_breeze/features/registration/domain/use_cases/complete_registration_usecases.dart';

import '../../../domain/entities/complete_registration_entities/education_entity.dart';

@injectable
class AllLanguagesCubit extends Cubit<Result<AllLanguagesEntity>> {
  AllLanguagesCubit({required this.completeRegistrationUseCases})
      : super(const Result.initial());
  CompleteRegistrationUseCases completeRegistrationUseCases;
  Future getAllLanguages() async {
    emit(const Result.loading());
    final result = await completeRegistrationUseCases.getLanguages();
    emit(result);
  }
}

@injectable
class EducationsCubit extends Cubit<Result<EducationsEntity>> {
  EducationsCubit({required this.completeRegistrationUseCases})
      : super(const Result.initial());
  CompleteRegistrationUseCases completeRegistrationUseCases;
  Future getEducations() async {
    emit(const Result.loading());
    final result = await completeRegistrationUseCases.getEducation();
    emit(result);
  }
}

@injectable
class CountriesCubit extends Cubit<Result<CountriesEntity>> {
  CountriesCubit({required this.completeRegistrationUseCases})
      : super(const Result.initial());
  CompleteRegistrationUseCases completeRegistrationUseCases;

  Future getCountries() async {
    emit(const Result.loading());
    final result = await completeRegistrationUseCases.getCountries();
    emit(result);
  }
}

@injectable
class EditDetailsCubit extends Cubit<Result<EditUserDetailsEntity>> {
  EditDetailsCubit({required this.completeRegistrationUseCases})
      : super(const Result.initial());
  CompleteRegistrationUseCases completeRegistrationUseCases;

  Future editDetails({
    required String content_type,
    required String bearer_token,
    int? user_id,
    String? education_ids,
     String? email,
    int? is_male,
    String? city_id,
    int? country_id,
    String? profile_image,
    String? phone_number,
    String? location,
    String? language_ids,
      String? service_ids,
    String? about,}) async {
    emit(const Result.loading());
    final result = await completeRegistrationUseCases.editDetails(

        education_ids: education_ids,
      content_type: content_type,
        bearer_token: bearer_token,
        user_id: user_id,
       service_ids:service_ids,
        email: email,
    is_male: is_male,
    city_id: city_id,
language_ids: language_ids,
    country_id: country_id,
    profile_image: profile_image,
    phone_number: phone_number,
    location: location,
    about: about
    );
    emit(result);
  }
}
@injectable
class GetAllServicesCubit extends Cubit<Result<GetAllServicesEntity>>{
  GetAllServicesCubit({required this.useCase}):super(const Result.initial());
  CompleteRegistrationUseCases useCase;

  Future getAllServices()async{
    emit(const Result.loading());
    final result =await useCase.getAllServices();
    emit(result);
  }

}


@injectable
class GetCitiesInCountryCubit extends Cubit<Result<GetCitiesInCountry>>{
  GetCitiesInCountryCubit({required this.useCase}):super(const Result.initial());
  CompleteRegistrationUseCases useCase;
  Future getCitiesInCountry({required int country_id})async{
    emit(Result.loading());
    final result=await useCase.getCitiesInCountry(country_id: country_id);
    emit(result);
  }
}