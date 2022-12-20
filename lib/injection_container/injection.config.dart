// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/error/error_model_to_entity.dart' as _i7;
import '../core/network_configration/dio_setup.dart' as _i52;
import '../features/customer/find_personal_assistant/data/data_source/network/get_all_assistants_cleint.dart'
    as _i9;
import '../features/customer/find_personal_assistant/data/data_source/network/get_reviews_client.dart'
    as _i11;
import '../features/customer/find_personal_assistant/data/data_source/network/get_used_languages_client.dart'
    as _i16;
import '../features/customer/find_personal_assistant/data/mapper/get_assistants_model_to_entity.dart'
    as _i10;
import '../features/customer/find_personal_assistant/data/mapper/get_reviews_mapper.dart'
    as _i12;
import '../features/customer/find_personal_assistant/data/mapper/get_used_languages_model_to_entity.dart'
    as _i17;
import '../features/customer/find_personal_assistant/data/repository/get_all_assistants_repository_impl.dart'
    as _i37;
import '../features/customer/find_personal_assistant/data/repository/get_reviews_repository_impl.dart'
    as _i14;
import '../features/customer/find_personal_assistant/data/repository/get_used_languages_repository_imp.dart'
    as _i19;
import '../features/customer/find_personal_assistant/domain/repository/get_assistant_repository.dart'
    as _i36;
import '../features/customer/find_personal_assistant/domain/repository/get_reviews_repository.dart'
    as _i13;
import '../features/customer/find_personal_assistant/domain/repository/get_used_languages_repository.dart'
    as _i18;
import '../features/customer/find_personal_assistant/domain/use_cases/get_assistant_use_case.dart'
    as _i38;
import '../features/customer/find_personal_assistant/domain/use_cases/get_reviews_use_case.dart'
    as _i15;
import '../features/customer/find_personal_assistant/domain/use_cases/get_used_languages_usecase.dart'
    as _i20;
import '../features/customer/find_personal_assistant/presentation/business_logic/cubit/get_assistants_cubit.dart'
    as _i39;
import '../features/customer/find_personal_assistant/presentation/business_logic/cubit/get_reviews_cubit.dart'
    as _i40;
import '../features/customer/find_personal_assistant/presentation/business_logic/cubit/get_used_languages_cubit.dart'
    as _i41;
import '../features/personal_assistant/data/data_source/network/personal_assistant_cleint.dart'
    as _i23;
import '../features/personal_assistant/data/mappers/personal_assistant_home_page_mappers.dart'
    as _i22;
import '../features/personal_assistant/data/repository/personal_assistant_home_page_repository_imp.dart'
    as _i43;
import '../features/personal_assistant/domain/repository/personal_assistant_home_page_repository.dart'
    as _i42;
import '../features/personal_assistant/domain/use_cases/personal_assistant_use_cases.dart'
    as _i44;
import '../features/registration/data/data_source/network/complete_registration_network/complete_registraition_client.dart'
    as _i28;
import '../features/registration/data/data_source/network/registration_client.dart'
    as _i24;
import '../features/registration/data/data_source/network/send_reset_forgot_password_datasource.dart'
    as _i25;
import '../features/registration/data/mapper/complete_registration_mappers/countries_mappers.dart'
    as _i3;
import '../features/registration/data/mapper/complete_registration_mappers/edit_user_details_mapper.dart'
    as _i5;
import '../features/registration/data/mapper/complete_registration_mappers/education_mappers.dart'
    as _i6;
import '../features/registration/data/mapper/complete_registration_mappers/languages_mappers.dart'
    as _i21;
import '../features/registration/data/mapper/forgot_reset_password_mapper.dart'
    as _i8;
import '../features/registration/data/mapper/sign_in_mapper.dart' as _i26;
import '../features/registration/data/mapper/sign_up_mapper.dart' as _i27;
import '../features/registration/data/repository/complete_registration_repository_imp.dart'
    as _i30;
import '../features/registration/data/repository/forgot_reset_password_repository_imp.dart'
    as _i34;
import '../features/registration/data/repository/registration_repository_impl.dart'
    as _i46;
import '../features/registration/domain/repository/complete_registration_repository.dart'
    as _i29;
import '../features/registration/domain/repository/forgot_reset_password_repository.dart'
    as _i33;
import '../features/registration/domain/repository/registration_repository.dart'
    as _i45;
import '../features/registration/domain/use_cases/complete_registration_usecases.dart'
    as _i31;
import '../features/registration/domain/use_cases/forgot_reset_password_usecases.dart'
    as _i35;
import '../features/registration/domain/use_cases/registration_usecases.dart'
    as _i47;
import '../features/registration/presentation/business_logic/cubit/complete_registration_cubit.dart'
    as _i32;
import '../features/registration/presentation/business_logic/cubit/forgot_password_cubit.dart'
    as _i51;
import '../features/registration/presentation/business_logic/cubit/reset_password_cubit.dart'
    as _i48;
import '../features/registration/presentation/business_logic/cubit/sign_in_cubit.dart'
    as _i49;
import '../features/registration/presentation/business_logic/cubit/sign_up_cubit.dart'
    as _i50; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final dioSetup = _$DioSetup();
  gh.factory<_i3.CountriesMapper>(() => _i3.CountriesMapper());
  gh.factory<_i4.Dio>(() => dioSetup.dio);
  gh.factory<_i5.EditUserDetailsMapper>(() => _i5.EditUserDetailsMapper());
  gh.factory<_i6.EducationMapper>(() => _i6.EducationMapper());
  gh.factory<_i7.ErrorMapper>(() => _i7.ErrorMapper());
  gh.factory<_i8.ForgotResetPasswordMapper>(
      () => _i8.ForgotResetPasswordMapper());
  gh.singleton<_i9.GetAllAssistantsClient>(
      _i9.GetAllAssistantsClient(get<_i4.Dio>()));
  gh.factory<_i10.GetAssistantsMapper>(() => _i10.GetAssistantsMapper());
  gh.singleton<_i11.GetReviewsCleint>(_i11.GetReviewsCleint(get<_i4.Dio>()));
  gh.factory<_i12.GetReviewsMapper>(() => _i12.GetReviewsMapper());
  gh.singleton<_i13.GetReviewsRepository>(_i14.GetReviewsRepositoryImp(
    cleint: get<_i11.GetReviewsCleint>(),
    mapper: get<_i12.GetReviewsMapper>(),
  ));
  gh.factory<_i15.GetReviewsUseCase>(() => _i15.GetReviewsUseCase(
      getReviewsRepository: get<_i13.GetReviewsRepository>()));
  gh.singleton<_i16.GetUsedLanguagesCleint>(
      _i16.GetUsedLanguagesCleint(get<_i4.Dio>()));
  gh.factory<_i17.GetUsedLanguagesModelToEntity>(
      () => _i17.GetUsedLanguagesModelToEntity());
  gh.singleton<_i18.GetUsedLanguagesRepository>(
      _i19.GetUsedLanguagesRepositoryImpl(
    cleint: get<_i16.GetUsedLanguagesCleint>(),
    mapper: get<_i17.GetUsedLanguagesModelToEntity>(),
  ));
  gh.factory<_i20.GetUsedLanguagesUseCase>(() => _i20.GetUsedLanguagesUseCase(
      getUsedLanguagesRepository: get<_i18.GetUsedLanguagesRepository>()));
  gh.factory<_i21.LanguagesMapper>(() => _i21.LanguagesMapper());
  gh.factory<_i22.PersonalAssistantHomePageMappers>(
      () => _i22.PersonalAssistantHomePageMappers());
  gh.singleton<_i23.PesonalAssistantCleint>(
      _i23.PesonalAssistantCleint(get<_i4.Dio>()));
  gh.singleton<_i24.RegistrationClient>(
      _i24.RegistrationClient(get<_i4.Dio>()));
  gh.singleton<_i25.SendResetForgotPasswordClient>(
      _i25.SendResetForgotPasswordClient(get<_i4.Dio>()));
  gh.factory<_i26.SignInMapper>(() => _i26.SignInMapper());
  gh.factory<_i27.SignUpMapper>(() => _i27.SignUpMapper());
  gh.singleton<_i28.CompleteRegistrationCleint>(
      _i28.CompleteRegistrationCleint(get<_i4.Dio>()));
  gh.singleton<_i29.CompleteRegistrationRepository>(
      _i30.CompleteRegistrationRepositoryImp(
    cleint: get<_i28.CompleteRegistrationCleint>(),
    countriesMapper: get<_i3.CountriesMapper>(),
    educationMapper: get<_i6.EducationMapper>(),
    languagesMapper: get<_i21.LanguagesMapper>(),
    editDetailsMapper: get<_i5.EditUserDetailsMapper>(),
  ));
  gh.factory<_i31.CompleteRegistrationUseCases>(() =>
      _i31.CompleteRegistrationUseCases(
          completeRegistrationRepository:
              get<_i29.CompleteRegistrationRepository>()));
  gh.factory<_i32.CountriesCubit>(() => _i32.CountriesCubit(
      completeRegistrationUseCases: get<_i31.CompleteRegistrationUseCases>()));
  gh.factory<_i32.EditDetailsCubit>(() => _i32.EditDetailsCubit(
      completeRegistrationUseCases: get<_i31.CompleteRegistrationUseCases>()));
  gh.factory<_i32.EducationsCubit>(() => _i32.EducationsCubit(
      completeRegistrationUseCases: get<_i31.CompleteRegistrationUseCases>()));
  gh.singleton<_i33.ForgotResetPasswordRepository>(
      _i34.ForgotResetPasswordRepositoryImp(
    client: get<_i25.SendResetForgotPasswordClient>(),
    mapper: get<_i8.ForgotResetPasswordMapper>(),
  ));
  gh.factory<_i35.ForgotResetPasswordUseCases>(() =>
      _i35.ForgotResetPasswordUseCases(
          forgotResetPasswordRepository:
              get<_i33.ForgotResetPasswordRepository>()));
  gh.singleton<_i36.GetAssistantRepository>(_i37.GetAllAssistantsRepositoryImpl(
    client: get<_i9.GetAllAssistantsClient>(),
    mapper: get<_i10.GetAssistantsMapper>(),
  ));
  gh.factory<_i38.GetAssistantUseCase>(() => _i38.GetAssistantUseCase(
      getAssistantRepository: get<_i36.GetAssistantRepository>()));
  gh.factory<_i39.GetAssistantsCubit>(() => _i39.GetAssistantsCubit(
      getAssistantUseCase: get<_i38.GetAssistantUseCase>()));
  gh.factory<_i40.GetReviewsCubit>(() =>
      _i40.GetReviewsCubit(getReviewsUseCase: get<_i15.GetReviewsUseCase>()));
  gh.factory<_i41.GetUsedLanguagesCubit>(() => _i41.GetUsedLanguagesCubit(
      getUsedLanguagesUseCase: get<_i20.GetUsedLanguagesUseCase>()));
  gh.singleton<_i42.PersonalAssistantHomePageRepository>(
      _i43.PersonalAssistantHomepageRepositoryImp(
    cleint: get<_i23.PesonalAssistantCleint>(),
    mappers: get<_i22.PersonalAssistantHomePageMappers>(),
  ));
  gh.factory<_i44.PersonalAssistantHomePageUseCases>(() =>
      _i44.PersonalAssistantHomePageUseCases(
          personalAssistantHomePageRepository:
              get<_i42.PersonalAssistantHomePageRepository>()));
  gh.singleton<_i45.RegistrationRepository>(_i46.RegistrationRepositoryImpl(
    client: get<_i24.RegistrationClient>(),
    signInMapper: get<_i26.SignInMapper>(),
    signUpMapper: get<_i27.SignUpMapper>(),
    errorMapper: get<_i7.ErrorMapper>(),
  ));
  gh.factory<_i47.RegistrationUseCases>(() => _i47.RegistrationUseCases(
      registrationRepository: get<_i45.RegistrationRepository>()));
  gh.factory<_i48.ResetPasswordCubit>(() => _i48.ResetPasswordCubit(
      forgotResetPasswordUseCases: get<_i35.ForgotResetPasswordUseCases>()));
  gh.factory<_i49.SignInCubit>(
      () => _i49.SignInCubit(useCases: get<_i47.RegistrationUseCases>()));
  gh.factory<_i50.SignUpCubit>(
      () => _i50.SignUpCubit(useCases: get<_i47.RegistrationUseCases>()));
  gh.factory<_i32.AllLanguagesCubit>(() => _i32.AllLanguagesCubit(
      completeRegistrationUseCases: get<_i31.CompleteRegistrationUseCases>()));
  gh.factory<_i51.ForgotPasswordCubit>(() => _i51.ForgotPasswordCubit(
      forgotResetPasswordUseCases: get<_i35.ForgotResetPasswordUseCases>()));
  return get;
}

class _$DioSetup extends _i52.DioSetup {}
