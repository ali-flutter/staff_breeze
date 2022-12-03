// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/network_configration/dio_setup.dart' as _i19;
import '../features/registration/data/data_source/network/registration_client.dart'
    as _i5;
import '../features/registration/data/data_source/network/send_reset_forgot_password_datasource.dart'
    as _i6;
import '../features/registration/data/mapper/forgot_reset_password_mapper.dart'
    as _i4;
import '../features/registration/data/mapper/sign_in_mapper.dart' as _i7;
import '../features/registration/data/mapper/sign_up_mapper.dart' as _i8;
import '../features/registration/data/repository/forgot_reset_password_repository_imp.dart'
    as _i10;
import '../features/registration/data/repository/registration_repository_impl.dart'
    as _i13;
import '../features/registration/domain/repository/forgot_reset_password_repository.dart'
    as _i9;
import '../features/registration/domain/repository/registration_repository.dart'
    as _i12;
import '../features/registration/domain/use_cases/forgot_reset_password_usecases.dart'
    as _i11;
import '../features/registration/domain/use_cases/registration_usecases.dart'
    as _i14;
import '../features/registration/presentation/cubit/forgot_password_cubit.dart'
    as _i18;
import '../features/registration/presentation/cubit/reset_password_cubit.dart'
    as _i15;
import '../features/registration/presentation/cubit/sign_in_cubit.dart' as _i16;
import '../features/registration/presentation/cubit/sign_up_cubit.dart'
    as _i17; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i3.Dio>(() => dioSetup.dio);
  gh.factory<_i4.ForgotResetPasswordMapper>(
      () => _i4.ForgotResetPasswordMapper());
  gh.singleton<_i5.RegistrationClient>(_i5.RegistrationClient(get<_i3.Dio>()));
  gh.singleton<_i6.SendResetForgotPasswordClient>(
      _i6.SendResetForgotPasswordClient(get<_i3.Dio>()));
  gh.factory<_i7.SignInMapper>(() => _i7.SignInMapper());
  gh.factory<_i8.SignUpMapper>(() => _i8.SignUpMapper());
  gh.singleton<_i9.ForgotResetPasswordRepository>(
      _i10.ForgotResetPasswordRepositoryImp(
    client: get<_i6.SendResetForgotPasswordClient>(),
    mapper: get<_i4.ForgotResetPasswordMapper>(),
  ));
  gh.factory<_i11.ForgotResetPasswordUseCases>(() =>
      _i11.ForgotResetPasswordUseCases(
          forgotResetPasswordRepository:
              get<_i9.ForgotResetPasswordRepository>()));
  gh.singleton<_i12.RegistrationRepository>(_i13.RegistrationRepositoryImpl(
    client: get<_i5.RegistrationClient>(),
    signInMapper: get<_i7.SignInMapper>(),
    signUpMapper: get<_i8.SignUpMapper>(),
  ));
  gh.factory<_i14.RegistrationUseCases>(() => _i14.RegistrationUseCases(
      registrationRepository: get<_i12.RegistrationRepository>()));
  gh.factory<_i15.ResetPasswordCubit>(() => _i15.ResetPasswordCubit(
      forgotResetPasswordUseCases: get<_i11.ForgotResetPasswordUseCases>()));
  gh.factory<_i16.SignInCubit>(
      () => _i16.SignInCubit(useCases: get<_i14.RegistrationUseCases>()));
  gh.factory<_i17.SignUpCubit>(
      () => _i17.SignUpCubit(useCases: get<_i14.RegistrationUseCases>()));
  gh.factory<_i18.ForgotPasswordCubit>(() => _i18.ForgotPasswordCubit(
      forgotResetPasswordUseCases: get<_i11.ForgotResetPasswordUseCases>()));
  return get;
}

class _$DioSetup extends _i19.DioSetup {}
