// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/edit_user_details_entity.dart';
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
     int? user_id,
     String? email,
    int? is_male,
    int? city_id,
    int? country_id,
    String? profile_image,
    String? phone_number,
    String? location,
    String? about,}) async {
    emit(const Result.loading());
    final result = await completeRegistrationUseCases.editDetails(user_id: user_id,
    email: email,
    is_male: is_male,
    city_id: city_id,
    country_id: country_id,
    profile_image: profile_image,
    phone_number: phone_number,
    location: location,
    about: about
    );
    emit(result);
  }
}