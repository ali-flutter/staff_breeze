// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/error/error_entity.dart';
import 'package:staff_breeze/features/registration/domain/entities/sign_up_entity.dart';
import 'package:staff_breeze/features/registration/domain/repository/registration_repository.dart';

import '../../../../core/network_configration/result.dart';
import '../entities/sign_in_entity.dart';

@injectable
class RegistrationUseCases {
  RegistrationUseCases({required this.registrationRepository});

  RegistrationRepository registrationRepository;

  Future<Result<SignInEntity>> signIn(
      {required String email, required String password}) {
    return registrationRepository.signIn(
      email: email,
      password: password,
    );
  }

  Future<Result<SignUpEntity>> signUp(
      {required String name,
      required String email,
      required String password_confirmation,
      required String password,
      required int role_id}) {
    return registrationRepository.signUp(
      password_confirmation: password_confirmation,
      password: password,
      name: name,
      email: email,
      role_id: role_id,
    );
  }
}
