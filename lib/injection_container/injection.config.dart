// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/error/error_model_to_entity.dart' as _i14;
import '../core/network_configration/dio_setup.dart' as _i139;
import '../features/customer/data/data_source/network/edit_name_profilephoto_client.dart'
    as _i11;
import '../features/customer/data/data_source/network/get_customer_info_cleint.dart'
    as _i25;
import '../features/customer/data/data_source/network/get_customer_reservation_cleint.dart'
    as _i29;
import '../features/customer/data/mappers/edit_name_image_mappers.dart' as _i10;
import '../features/customer/data/mappers/get_customer_info_mappers.dart'
    as _i26;
import '../features/customer/data/mappers/get_customer_reservation_mappers.dart'
    as _i30;
import '../features/customer/data/repository/edit_name_profilephoto_repo_imp.dart'
    as _i101;
import '../features/customer/data/repository/get_customer_info_repository_impl.dart'
    as _i28;
import '../features/customer/data/repository/get_customer_reservation_repository_imp.dart'
    as _i32;
import '../features/customer/domain/repository/edit_name_profile_image_repository.dart'
    as _i100;
import '../features/customer/domain/repository/get_customer_repository.dart'
    as _i27;
import '../features/customer/domain/repository/get_customer_reservation_repository.dart'
    as _i31;
import '../features/customer/domain/use_case/edit_name_profile_image_use.dart'
    as _i102;
import '../features/customer/domain/use_case/get_customer_reservation_use_case.dart'
    as _i33;
import '../features/customer/domain/use_case/get_customer_use_case.dart'
    as _i34;
import '../features/customer/find_personal_assistant/data/data_source/network/add_about_client.dart'
    as _i75;
import '../features/customer/find_personal_assistant/data/data_source/network/add_review_client.dart'
    as _i87;
import '../features/customer/find_personal_assistant/data/data_source/network/create_reservation_cleint.dart'
    as _i96;
import '../features/customer/find_personal_assistant/data/data_source/network/get_all_assistants_cleint.dart'
    as _i16;
import '../features/customer/find_personal_assistant/data/data_source/network/get_free_days_cleint.dart'
    as _i35;
import '../features/customer/find_personal_assistant/data/data_source/network/get_reviews_client.dart'
    as _i37;
import '../features/customer/find_personal_assistant/data/data_source/network/get_used_languages_client.dart'
    as _i42;
import '../features/customer/find_personal_assistant/data/data_source/network/get_used_services_cleint.dart'
    as _i47;
import '../features/customer/find_personal_assistant/data/mapper/add_about_mapper.dart'
    as _i3;
import '../features/customer/find_personal_assistant/data/mapper/add_review_mapper.dart'
    as _i6;
import '../features/customer/find_personal_assistant/data/mapper/create_reservation_mappers.dart'
    as _i8;
import '../features/customer/find_personal_assistant/data/mapper/get_assistants_model_to_entity.dart'
    as _i23;
import '../features/customer/find_personal_assistant/data/mapper/get_free_days_mappers.dart'
    as _i36;
import '../features/customer/find_personal_assistant/data/mapper/get_reviews_mapper.dart'
    as _i38;
import '../features/customer/find_personal_assistant/data/mapper/get_used_languages_model_to_entity.dart'
    as _i43;
import '../features/customer/find_personal_assistant/data/mapper/get_used_services_mapper.dart'
    as _i48;
import '../features/customer/find_personal_assistant/data/repository/add_about_repo_imp.dart'
    as _i77;
import '../features/customer/find_personal_assistant/data/repository/add_review_repo_imp.dart'
    as _i89;
import '../features/customer/find_personal_assistant/data/repository/create_reservation_repository_imp.dart'
    as _i98;
import '../features/customer/find_personal_assistant/data/repository/get_all_assistants_repository_impl.dart'
    as _i107;
import '../features/customer/find_personal_assistant/data/repository/get_reviews_repository_impl.dart'
    as _i40;
import '../features/customer/find_personal_assistant/data/repository/get_used_languages_repository_imp.dart'
    as _i45;
import '../features/customer/find_personal_assistant/data/repository/get_used_services_repository_imp.dart'
    as _i50;
import '../features/customer/find_personal_assistant/domain/repository/add_about_repository.dart'
    as _i76;
import '../features/customer/find_personal_assistant/domain/repository/add_review_repository.dart'
    as _i88;
import '../features/customer/find_personal_assistant/domain/repository/create_reservation_repository.dart'
    as _i97;
import '../features/customer/find_personal_assistant/domain/repository/get_assistant_repository.dart'
    as _i106;
import '../features/customer/find_personal_assistant/domain/repository/get_free_days_repository.dart'
    as _i113;
import '../features/customer/find_personal_assistant/domain/repository/get_reviews_repository.dart'
    as _i39;
import '../features/customer/find_personal_assistant/domain/repository/get_used_languages_repository.dart'
    as _i44;
import '../features/customer/find_personal_assistant/domain/repository/get_used_services_repository.dart'
    as _i49;
import '../features/customer/find_personal_assistant/domain/use_cases/add_about_use_case.dart'
    as _i78;
import '../features/customer/find_personal_assistant/domain/use_cases/add_review_use_case.dart'
    as _i90;
import '../features/customer/find_personal_assistant/domain/use_cases/create_reservation_usecase.dart'
    as _i99;
import '../features/customer/find_personal_assistant/domain/use_cases/get_assistant_use_case.dart'
    as _i109;
import '../features/customer/find_personal_assistant/domain/use_cases/get_free_days_usecases.dart'
    as _i115;
import '../features/customer/find_personal_assistant/domain/use_cases/get_reviews_use_case.dart'
    as _i41;
import '../features/customer/find_personal_assistant/domain/use_cases/get_used_languages_usecase.dart'
    as _i46;
import '../features/customer/find_personal_assistant/domain/use_cases/get_used_services_use_cases.dart'
    as _i51;
import '../features/customer/find_personal_assistant/presentation/business_logic/cubit/add_about_cubit.dart'
    as _i130;
import '../features/customer/find_personal_assistant/presentation/business_logic/cubit/add_review_cubit.dart'
    as _i133;
import '../features/customer/find_personal_assistant/presentation/business_logic/cubit/create_reservation_cubit.dart'
    as _i134;
import '../features/customer/find_personal_assistant/presentation/business_logic/cubit/get_assistants_cubit.dart'
    as _i110;
import '../features/customer/find_personal_assistant/presentation/business_logic/cubit/get_reviews_cubit.dart'
    as _i116;
import '../features/customer/find_personal_assistant/presentation/business_logic/cubit/get_used_languages_cubit.dart'
    as _i117;
import '../features/customer/find_personal_assistant/presentation/business_logic/cubit/get_used_services_cubit.dart'
    as _i118;
import '../features/customer/find_personal_assistant/presentation/business_logic/get_customer_info_cubit.dart'
    as _i111;
import '../features/customer/hire_personal_assistant/data/summary_page_client.dart'
    as _i69;
import '../features/customer/hire_personal_assistant/data/summary_page_mappers.dart'
    as _i70;
import '../features/customer/hire_personal_assistant/data/summary_page_repo_imp.dart'
    as _i72;
import '../features/customer/hire_personal_assistant/domain/summary_page_repository.dart'
    as _i71;
import '../features/customer/hire_personal_assistant/domain/summary_page_use_case.dart'
    as _i73;
import '../features/customer/hire_personal_assistant/presentation/business_logic/summary_payment_cubit.dart'
    as _i74;
import '../features/customer/presentation/business_logic/cubit/edit_name_profile_image_cubit.dart'
    as _i135;
import '../features/customer/presentation/business_logic/cubit/get_customer_reservation_cubit.dart'
    as _i112;
import '../features/personal_assistant/data/data_source/network/add_languages_cleint.dart'
    as _i83;
import '../features/personal_assistant/data/data_source/network/get_assistant_reservation_client.dart'
    as _i18;
import '../features/personal_assistant/data/data_source/network/insert_free_days_client.dart'
    as _i52;
import '../features/personal_assistant/data/data_source/network/personal_assistant_cleint.dart'
    as _i59;
import '../features/personal_assistant/data/mappers/add_languages_mapper.dart'
    as _i5;
import '../features/personal_assistant/data/mappers/get_assistant_reservation_mapper.dart'
    as _i19;
import '../features/personal_assistant/data/mappers/insert_free_days_mappers.dart'
    as _i53;
import '../features/personal_assistant/data/mappers/personal_assistant_home_page_mappers.dart'
    as _i58;
import '../features/personal_assistant/data/repository/add_languages_repository.dart'
    as _i85;
import '../features/personal_assistant/data/repository/get_assistant_reservation_repository_imp.dart'
    as _i21;
import '../features/personal_assistant/data/repository/get_free_days_repository_imp.dart'
    as _i114;
import '../features/personal_assistant/data/repository/insert_free_days_repo_impl.dart'
    as _i55;
import '../features/personal_assistant/data/repository/personal_assistant_home_page_repository_imp.dart'
    as _i121;
import '../features/personal_assistant/domain/repository/add_languages_repo.dart'
    as _i84;
import '../features/personal_assistant/domain/repository/personal_assistant_home_page_repository.dart'
    as _i120;
import '../features/personal_assistant/domain/repository/schedule_repository/get_assistant_reservation_repository.dart'
    as _i20;
import '../features/personal_assistant/domain/repository/schedule_repository/insert_free_days_repository.dart'
    as _i54;
import '../features/personal_assistant/domain/use_cases/add_languages_use_cases.dart'
    as _i86;
import '../features/personal_assistant/domain/use_cases/get_assistant_reservation_use_case.dart'
    as _i22;
import '../features/personal_assistant/domain/use_cases/insert_free_days_use_case.dart'
    as _i56;
import '../features/personal_assistant/domain/use_cases/personal_assistant_use_cases.dart'
    as _i122;
import '../features/personal_assistant/presentation/business_logic/cubit/add_languages_cubit.dart'
    as _i132;
import '../features/personal_assistant/presentation/business_logic/cubit/get_assistant_reservation_cubit.dart'
    as _i108;
import '../features/personal_assistant/presentation/business_logic/cubit/get_free_days_cubit.dart'
    as _i137;
import '../features/personal_assistant/presentation/business_logic/cubit/insert_free_days_cubit.dart'
    as _i119;
import '../features/personal_assistant/presentation/business_logic/cubit/personal_assistant_home_page_cubit.dart'
    as _i138;
import '../features/registration/data/data_source/network/add_device_token_client.dart'
    as _i79;
import '../features/registration/data/data_source/network/complete_registration_network/complete_registraition_client.dart'
    as _i91;
import '../features/registration/data/data_source/network/registration_client.dart'
    as _i60;
import '../features/registration/data/data_source/network/remove_device_token_client.dart'
    as _i61;
import '../features/registration/data/data_source/network/send_reset_forgot_password_datasource.dart'
    as _i66;
import '../features/registration/data/mapper/add_device_token_mapper.dart'
    as _i4;
import '../features/registration/data/mapper/complete_registration_mappers/countries_mappers.dart'
    as _i7;
import '../features/registration/data/mapper/complete_registration_mappers/edit_user_details_mapper.dart'
    as _i12;
import '../features/registration/data/mapper/complete_registration_mappers/education_mappers.dart'
    as _i13;
import '../features/registration/data/mapper/complete_registration_mappers/get_all_services_mappers.dart'
    as _i17;
import '../features/registration/data/mapper/complete_registration_mappers/get_cities_in_country_mappers.dart'
    as _i24;
import '../features/registration/data/mapper/complete_registration_mappers/languages_mappers.dart'
    as _i57;
import '../features/registration/data/mapper/forgot_reset_password_mapper.dart'
    as _i15;
import '../features/registration/data/mapper/remove_device_token_mappers.dart'
    as _i62;
import '../features/registration/data/mapper/sign_in_mapper.dart' as _i67;
import '../features/registration/data/mapper/sign_up_mapper.dart' as _i68;
import '../features/registration/data/repository/add_device_token_repository_imp.dart'
    as _i81;
import '../features/registration/data/repository/complete_registration_repository_imp.dart'
    as _i93;
import '../features/registration/data/repository/forgot_reset_password_repository_imp.dart'
    as _i104;
import '../features/registration/data/repository/registration_repository_impl.dart'
    as _i124;
import '../features/registration/data/repository/remove_device_token_repository_imp.dart'
    as _i64;
import '../features/registration/domain/repository/add_device_token_repository.dart'
    as _i80;
import '../features/registration/domain/repository/complete_registration_repository.dart'
    as _i92;
import '../features/registration/domain/repository/forgot_reset_password_repository.dart'
    as _i103;
import '../features/registration/domain/repository/registration_repository.dart'
    as _i123;
import '../features/registration/domain/repository/remove_device_token_repository.dart'
    as _i63;
import '../features/registration/domain/use_cases/add_device_token_use_case.dart'
    as _i82;
import '../features/registration/domain/use_cases/complete_registration_usecases.dart'
    as _i94;
import '../features/registration/domain/use_cases/forgot_reset_password_usecases.dart'
    as _i105;
import '../features/registration/domain/use_cases/registration_usecases.dart'
    as _i125;
import '../features/registration/domain/use_cases/remove_device_token_usecase.dart'
    as _i65;
import '../features/registration/presentation/business_logic/cubit/add_device_token_cubit.dart'
    as _i131;
import '../features/registration/presentation/business_logic/cubit/complete_registration_cubit.dart'
    as _i95;
import '../features/registration/presentation/business_logic/cubit/forgot_password_cubit.dart'
    as _i136;
import '../features/registration/presentation/business_logic/cubit/remove_device_token_cubit.dart'
    as _i126;
import '../features/registration/presentation/business_logic/cubit/reset_password_cubit.dart'
    as _i127;
import '../features/registration/presentation/business_logic/cubit/sign_in_cubit.dart'
    as _i128;
import '../features/registration/presentation/business_logic/cubit/sign_up_cubit.dart'
    as _i129; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i3.AddAboutMapper>(() => _i3.AddAboutMapper());
  gh.factory<_i4.AddDeviceTokenMapper>(() => _i4.AddDeviceTokenMapper());
  gh.factory<_i5.AddLanguagesMapper>(() => _i5.AddLanguagesMapper());
  gh.factory<_i6.AddReviewMapper>(() => _i6.AddReviewMapper());
  gh.factory<_i7.CountriesMapper>(() => _i7.CountriesMapper());
  gh.factory<_i8.CreateReservationMappers>(
      () => _i8.CreateReservationMappers());
  gh.factory<_i9.Dio>(() => dioSetup.dio);
  gh.factory<_i10.EditNameImageProfileMappers>(
      () => _i10.EditNameImageProfileMappers());
  gh.singleton<_i11.EditNameProfilePhotoClient>(
      _i11.EditNameProfilePhotoClient(get<_i9.Dio>()));
  gh.factory<_i12.EditUserDetailsMapper>(() => _i12.EditUserDetailsMapper());
  gh.factory<_i13.EducationMapper>(() => _i13.EducationMapper());
  gh.factory<_i14.ErrorMapper>(() => _i14.ErrorMapper());
  gh.factory<_i15.ForgotResetPasswordMapper>(
      () => _i15.ForgotResetPasswordMapper());
  gh.singleton<_i16.GetAllAssistantsClient>(
      _i16.GetAllAssistantsClient(get<_i9.Dio>()));
  gh.factory<_i17.GetAllServicesMappers>(() => _i17.GetAllServicesMappers());
  gh.singleton<_i18.GetAssistantReservationClient>(
      _i18.GetAssistantReservationClient(get<_i9.Dio>()));
  gh.factory<_i19.GetAssistantReservationMappers>(
      () => _i19.GetAssistantReservationMappers());
  gh.singleton<_i20.GetAssistantReservationRepository>(
      _i21.GetAssistantReservationRepositoryImp(
    mapper: get<_i19.GetAssistantReservationMappers>(),
    client: get<_i18.GetAssistantReservationClient>(),
  ));
  gh.factory<_i22.GetAssistantReservationUsecase>(() =>
      _i22.GetAssistantReservationUsecase(
          repository: get<_i20.GetAssistantReservationRepository>()));
  gh.factory<_i23.GetAssistantsMapper>(() => _i23.GetAssistantsMapper());
  gh.factory<_i24.GetCitiesInCountryMapper>(
      () => _i24.GetCitiesInCountryMapper());
  gh.singleton<_i25.GetCustomerClient>(_i25.GetCustomerClient(get<_i9.Dio>()));
  gh.factory<_i26.GetCustomerInfoMapper>(() => _i26.GetCustomerInfoMapper());
  gh.singleton<_i27.GetCustomerRepository>(_i28.GetCustomerInfoRepositoryImp(
    client: get<_i25.GetCustomerClient>(),
    mapper: get<_i26.GetCustomerInfoMapper>(),
  ));
  gh.singleton<_i29.GetCustomerReservationCleint>(
      _i29.GetCustomerReservationCleint(get<_i9.Dio>()));
  gh.factory<_i30.GetCustomerReservationMappers>(
      () => _i30.GetCustomerReservationMappers());
  gh.singleton<_i31.GetCustomerReservationRepository>(
      _i32.GetCustomerReservationRepositoryImpl(
    mapper: get<_i30.GetCustomerReservationMappers>(),
    cleint: get<_i29.GetCustomerReservationCleint>(),
  ));
  gh.factory<_i33.GetCustomerReservationUsecase>(() =>
      _i33.GetCustomerReservationUsecase(
          getCustomerReservationRepository:
              get<_i31.GetCustomerReservationRepository>()));
  gh.factory<_i34.GetCustomerUseCase>(() => _i34.GetCustomerUseCase(
      getCustomerRepository: get<_i27.GetCustomerRepository>()));
  gh.singleton<_i35.GetFreeDaysCleint>(_i35.GetFreeDaysCleint(get<_i9.Dio>()));
  gh.factory<_i36.GetFreeDaysMappers>(() => _i36.GetFreeDaysMappers());
  gh.singleton<_i37.GetReviewsCleint>(_i37.GetReviewsCleint(get<_i9.Dio>()));
  gh.factory<_i38.GetReviewsMapper>(() => _i38.GetReviewsMapper());
  gh.singleton<_i39.GetReviewsRepository>(_i40.GetReviewsRepositoryImp(
    cleint: get<_i37.GetReviewsCleint>(),
    mapper: get<_i38.GetReviewsMapper>(),
  ));
  gh.factory<_i41.GetReviewsUseCase>(() => _i41.GetReviewsUseCase(
      getReviewsRepository: get<_i39.GetReviewsRepository>()));
  gh.singleton<_i42.GetUsedLanguagesCleint>(
      _i42.GetUsedLanguagesCleint(get<_i9.Dio>()));
  gh.factory<_i43.GetUsedLanguagesModelToEntity>(
      () => _i43.GetUsedLanguagesModelToEntity());
  gh.singleton<_i44.GetUsedLanguagesRepository>(
      _i45.GetUsedLanguagesRepositoryImpl(
    cleint: get<_i42.GetUsedLanguagesCleint>(),
    mapper: get<_i43.GetUsedLanguagesModelToEntity>(),
  ));
  gh.factory<_i46.GetUsedLanguagesUseCase>(() => _i46.GetUsedLanguagesUseCase(
      getUsedLanguagesRepository: get<_i44.GetUsedLanguagesRepository>()));
  gh.singleton<_i47.GetUsedServicesCleint>(
      _i47.GetUsedServicesCleint(get<_i9.Dio>()));
  gh.factory<_i48.GetUsedServicesMappers>(() => _i48.GetUsedServicesMappers());
  gh.singleton<_i49.GetUsedServicesRepository>(
      _i50.GetUsedServicesRepositoryImp(
    cleint: get<_i47.GetUsedServicesCleint>(),
    mappers: get<_i48.GetUsedServicesMappers>(),
  ));
  gh.factory<_i51.GetUsedServicesUseCase>(() => _i51.GetUsedServicesUseCase(
      getUsedServicesRepository: get<_i49.GetUsedServicesRepository>()));
  gh.singleton<_i52.InsertFreeDaysClient>(
      _i52.InsertFreeDaysClient(get<_i9.Dio>()));
  gh.factory<_i53.InsertFreeDaysMappers>(() => _i53.InsertFreeDaysMappers());
  gh.singleton<_i54.InsertFreeDaysRepository>(_i55.InsertFreeDaysRepositoryImp(
    cleint: get<_i52.InsertFreeDaysClient>(),
    mappers: get<_i53.InsertFreeDaysMappers>(),
  ));
  gh.factory<_i56.InsertFreeDaysUseCase>(() => _i56.InsertFreeDaysUseCase(
      insertFreeDaysRepository: get<_i54.InsertFreeDaysRepository>()));
  gh.factory<_i57.LanguagesMapper>(() => _i57.LanguagesMapper());
  gh.factory<_i58.PersonalAssistantHomePageMappers>(
      () => _i58.PersonalAssistantHomePageMappers());
  gh.singleton<_i59.PesonalAssistantCleint>(
      _i59.PesonalAssistantCleint(get<_i9.Dio>()));
  gh.singleton<_i60.RegistrationClient>(
      _i60.RegistrationClient(get<_i9.Dio>()));
  gh.singleton<_i61.RemoveDeviceTokenCleint>(
      _i61.RemoveDeviceTokenCleint(get<_i9.Dio>()));
  gh.factory<_i62.RemoveDeviceTokenMapper>(
      () => _i62.RemoveDeviceTokenMapper());
  gh.singleton<_i63.RemoveDeviceTokenRepository>(
      _i64.RemoveDeviceTokenRepositoryImp(
    mapper: get<_i62.RemoveDeviceTokenMapper>(),
    cleint: get<_i61.RemoveDeviceTokenCleint>(),
  ));
  gh.factory<_i65.RemoveDeviceTokenUsecase>(() => _i65.RemoveDeviceTokenUsecase(
      repository: get<_i63.RemoveDeviceTokenRepository>()));
  gh.singleton<_i66.SendResetForgotPasswordClient>(
      _i66.SendResetForgotPasswordClient(get<_i9.Dio>()));
  gh.factory<_i67.SignInMapper>(() => _i67.SignInMapper());
  gh.factory<_i68.SignUpMapper>(() => _i68.SignUpMapper());
  gh.singleton<_i69.SummaryPageClient>(_i69.SummaryPageClient(get<_i9.Dio>()));
  gh.factory<_i70.SummaryPageMapper>(() => _i70.SummaryPageMapper());
  gh.singleton<_i71.SummaryPageRepository>(_i72.SummaryPageRepoImp(
    mapper: get<_i70.SummaryPageMapper>(),
    client: get<_i69.SummaryPageClient>(),
  ));
  gh.factory<_i73.SummaryPageUseCase>(() =>
      _i73.SummaryPageUseCase(repository: get<_i71.SummaryPageRepository>()));
  gh.factory<_i74.SummaryPaymentCubit>(
      () => _i74.SummaryPaymentCubit(useCase: get<_i73.SummaryPageUseCase>()));
  gh.singleton<_i75.AddAboutCleint>(_i75.AddAboutCleint(get<_i9.Dio>()));
  gh.singleton<_i76.AddAboutRepository>(_i77.AddAboutRepoImp(
    mapper: get<_i3.AddAboutMapper>(),
    cleint: get<_i75.AddAboutCleint>(),
  ));
  gh.factory<_i78.AddAboutUseCase>(
      () => _i78.AddAboutUseCase(repository: get<_i76.AddAboutRepository>()));
  gh.singleton<_i79.AddDeviceTokenCleint>(
      _i79.AddDeviceTokenCleint(get<_i9.Dio>()));
  gh.singleton<_i80.AddDeviceTokenRepository>(_i81.AddDeviceTokenRepositoryImpl(
    cleint: get<_i79.AddDeviceTokenCleint>(),
    mapper: get<_i4.AddDeviceTokenMapper>(),
  ));
  gh.factory<_i82.AddDeviceTokenUseCase>(() => _i82.AddDeviceTokenUseCase(
      addDeviceTokenRepository: get<_i80.AddDeviceTokenRepository>()));
  gh.singleton<_i83.AddLanguagesCleint>(
      _i83.AddLanguagesCleint(get<_i9.Dio>()));
  gh.singleton<_i84.AddLanguagesRepository>(_i85.AddLanguagesRepositoryImp(
    client: get<_i83.AddLanguagesCleint>(),
    mapper: get<_i5.AddLanguagesMapper>(),
  ));
  gh.factory<_i86.AddLanguagesUseCases>(() => _i86.AddLanguagesUseCases(
      addLanguagesRepository: get<_i84.AddLanguagesRepository>()));
  gh.singleton<_i87.AddReviewClient>(_i87.AddReviewClient(get<_i9.Dio>()));
  gh.singleton<_i88.AddReviewRepository>(_i89.AddReviewRepoImp(
    mapper: get<_i6.AddReviewMapper>(),
    cleint: get<_i87.AddReviewClient>(),
  ));
  gh.factory<_i90.AddReviewUseCase>(
      () => _i90.AddReviewUseCase(repository: get<_i88.AddReviewRepository>()));
  gh.singleton<_i91.CompleteRegistrationCleint>(
      _i91.CompleteRegistrationCleint(get<_i9.Dio>()));
  gh.singleton<_i92.CompleteRegistrationRepository>(
      _i93.CompleteRegistrationRepositoryImp(
    cleint: get<_i91.CompleteRegistrationCleint>(),
    countriesMapper: get<_i7.CountriesMapper>(),
    educationMapper: get<_i13.EducationMapper>(),
    languagesMapper: get<_i57.LanguagesMapper>(),
    editDetailsMapper: get<_i12.EditUserDetailsMapper>(),
    allServicesMapper: get<_i17.GetAllServicesMappers>(),
    citiesInCountryMapper: get<_i24.GetCitiesInCountryMapper>(),
  ));
  gh.factory<_i94.CompleteRegistrationUseCases>(() =>
      _i94.CompleteRegistrationUseCases(
          completeRegistrationRepository:
              get<_i92.CompleteRegistrationRepository>()));
  gh.factory<_i95.CountriesCubit>(() => _i95.CountriesCubit(
      completeRegistrationUseCases: get<_i94.CompleteRegistrationUseCases>()));
  gh.singleton<_i96.CreateReservationCleint>(
      _i96.CreateReservationCleint(get<_i9.Dio>()));
  gh.singleton<_i97.CreateReservationRepository>(
      _i98.CreateReservationRepositoryImp(
    cleint: get<_i96.CreateReservationCleint>(),
    mappers: get<_i8.CreateReservationMappers>(),
  ));
  gh.factory<_i99.CreateReservationUseCase>(() => _i99.CreateReservationUseCase(
      createReservationRepository: get<_i97.CreateReservationRepository>()));
  gh.factory<_i95.EditDetailsCubit>(() => _i95.EditDetailsCubit(
      completeRegistrationUseCases: get<_i94.CompleteRegistrationUseCases>()));
  gh.singleton<_i100.EditNameProfileImageRepository>(
      _i101.EditNameProfilePhotoRepoImp(
    cleint: get<_i11.EditNameProfilePhotoClient>(),
    mappers: get<_i10.EditNameImageProfileMappers>(),
  ));
  gh.factory<_i102.EditNameProfileImageUseCase>(() =>
      _i102.EditNameProfileImageUseCase(
          repository: get<_i100.EditNameProfileImageRepository>()));
  gh.factory<_i95.EducationsCubit>(() => _i95.EducationsCubit(
      completeRegistrationUseCases: get<_i94.CompleteRegistrationUseCases>()));
  gh.singleton<_i103.ForgotResetPasswordRepository>(
      _i104.ForgotResetPasswordRepositoryImp(
    client: get<_i66.SendResetForgotPasswordClient>(),
    mapper: get<_i15.ForgotResetPasswordMapper>(),
  ));
  gh.factory<_i105.ForgotResetPasswordUseCases>(() =>
      _i105.ForgotResetPasswordUseCases(
          forgotResetPasswordRepository:
              get<_i103.ForgotResetPasswordRepository>()));
  gh.factory<_i95.GetAllServicesCubit>(() => _i95.GetAllServicesCubit(
      useCase: get<_i94.CompleteRegistrationUseCases>()));
  gh.singleton<_i106.GetAssistantRepository>(
      _i107.GetAllAssistantsRepositoryImpl(
    client: get<_i16.GetAllAssistantsClient>(),
    mapper: get<_i23.GetAssistantsMapper>(),
  ));
  gh.factory<_i108.GetAssistantReservationCubit>(() =>
      _i108.GetAssistantReservationCubit(
          useCase: get<_i22.GetAssistantReservationUsecase>()));
  gh.factory<_i109.GetAssistantUseCase>(() => _i109.GetAssistantUseCase(
      getAssistantRepository: get<_i106.GetAssistantRepository>()));
  gh.factory<_i110.GetAssistantsCubit>(() => _i110.GetAssistantsCubit(
      getAssistantUseCase: get<_i109.GetAssistantUseCase>()));
  gh.factory<_i95.GetCitiesInCountryCubit>(() => _i95.GetCitiesInCountryCubit(
      useCase: get<_i94.CompleteRegistrationUseCases>()));
  gh.factory<_i111.GetCustomerInfoCubit>(() =>
      _i111.GetCustomerInfoCubit(useCase: get<_i34.GetCustomerUseCase>()));
  gh.factory<_i112.GetCustomerReservationCubit>(() =>
      _i112.GetCustomerReservationCubit(
          useCase: get<_i33.GetCustomerReservationUsecase>()));
  gh.singleton<_i113.GetFreeDayRepository>(_i114.GetFreeDaysRepositoryImp(
    cleint: get<_i35.GetFreeDaysCleint>(),
    mappers: get<_i36.GetFreeDaysMappers>(),
  ));
  gh.factory<_i115.GetFreeDaysUsecase>(() => _i115.GetFreeDaysUsecase(
      getFreeDayRepository: get<_i113.GetFreeDayRepository>()));
  gh.factory<_i116.GetReviewsCubit>(() =>
      _i116.GetReviewsCubit(getReviewsUseCase: get<_i41.GetReviewsUseCase>()));
  gh.factory<_i117.GetUsedLanguagesCubit>(() => _i117.GetUsedLanguagesCubit(
      getUsedLanguagesUseCase: get<_i46.GetUsedLanguagesUseCase>()));
  gh.factory<_i118.GetUsedServicesCubit>(() => _i118.GetUsedServicesCubit(
      getUsedServicesUseCase: get<_i51.GetUsedServicesUseCase>()));
  gh.factory<_i119.InsertFreeDaysCubit>(() => _i119.InsertFreeDaysCubit(
      insertFreeDaysUseCase: get<_i56.InsertFreeDaysUseCase>()));
  gh.singleton<_i120.PersonalAssistantHomePageRepository>(
      _i121.PersonalAssistantHomepageRepositoryImp(
    cleint: get<_i59.PesonalAssistantCleint>(),
    mappers: get<_i58.PersonalAssistantHomePageMappers>(),
  ));
  gh.factory<_i122.PersonalAssistantHomePageUseCases>(() =>
      _i122.PersonalAssistantHomePageUseCases(
          personalAssistantHomePageRepository:
              get<_i120.PersonalAssistantHomePageRepository>()));
  gh.singleton<_i123.RegistrationRepository>(_i124.RegistrationRepositoryImpl(
    client: get<_i60.RegistrationClient>(),
    signInMapper: get<_i67.SignInMapper>(),
    signUpMapper: get<_i68.SignUpMapper>(),
    errorMapper: get<_i14.ErrorMapper>(),
  ));
  gh.factory<_i125.RegistrationUseCases>(() => _i125.RegistrationUseCases(
      registrationRepository: get<_i123.RegistrationRepository>()));
  gh.factory<_i126.RemoveDeviceTokenCubit>(() => _i126.RemoveDeviceTokenCubit(
      usecase: get<_i65.RemoveDeviceTokenUsecase>()));
  gh.factory<_i127.ResetPasswordCubit>(() => _i127.ResetPasswordCubit(
      forgotResetPasswordUseCases: get<_i105.ForgotResetPasswordUseCases>()));
  gh.factory<_i128.SignInCubit>(
      () => _i128.SignInCubit(useCases: get<_i125.RegistrationUseCases>()));
  gh.factory<_i129.SignUpCubit>(
      () => _i129.SignUpCubit(useCases: get<_i125.RegistrationUseCases>()));
  gh.factory<_i130.AddAboutCubit>(
      () => _i130.AddAboutCubit(useCase: get<_i78.AddAboutUseCase>()));
  gh.factory<_i131.AddDeviceTokenCubit>(() =>
      _i131.AddDeviceTokenCubit(useCase: get<_i82.AddDeviceTokenUseCase>()));
  gh.factory<_i132.AddLanguagesCubit>(() => _i132.AddLanguagesCubit(
      addLanguagesUseCases: get<_i86.AddLanguagesUseCases>()));
  gh.factory<_i133.AddReviewCubit>(
      () => _i133.AddReviewCubit(useCase: get<_i90.AddReviewUseCase>()));
  gh.factory<_i95.AllLanguagesCubit>(() => _i95.AllLanguagesCubit(
      completeRegistrationUseCases: get<_i94.CompleteRegistrationUseCases>()));
  gh.factory<_i134.CreateReservationCubit>(() => _i134.CreateReservationCubit(
      useCase: get<_i99.CreateReservationUseCase>()));
  gh.factory<_i135.EditNameProfileImageCubit>(() =>
      _i135.EditNameProfileImageCubit(
          useCase: get<_i102.EditNameProfileImageUseCase>()));
  gh.factory<_i136.ForgotPasswordCubit>(() => _i136.ForgotPasswordCubit(
      forgotResetPasswordUseCases: get<_i105.ForgotResetPasswordUseCases>()));
  gh.factory<_i137.GetFreeDaysCubit>(() => _i137.GetFreeDaysCubit(
      getFreeDaysUsecase: get<_i115.GetFreeDaysUsecase>()));
  gh.factory<_i138.PersonalAssistantHomePageCubit>(() =>
      _i138.PersonalAssistantHomePageCubit(
          personalAssistantHomePageUseCases:
              get<_i122.PersonalAssistantHomePageUseCases>()));
  return get;
}

class _$DioSetup extends _i139.DioSetup {}
