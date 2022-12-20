// ignore_for_file: non_constant_identifier_names

import '../../../../core/network_configration/result.dart';
import '../entities/sign_in_entity.dart';
import '../entities/sign_up_entity.dart';

abstract class RegistrationRepository {
  Future<Result<SignInEntity>> signIn(
      {required String email, required String password});

  Future<Result<SignUpEntity>> signUp({
    required String name,
    required String email,
    required String password,
    required String password_confirmation,
    required int role_id,
  });
}
