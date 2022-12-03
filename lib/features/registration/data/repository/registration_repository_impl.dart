import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/handle_response.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/registration/data/data_source/network/registration_client.dart';
import 'package:staff_breeze/features/registration/data/mapper/sign_in_mapper.dart';
import 'package:staff_breeze/features/registration/data/mapper/sign_up_mapper.dart';
import 'package:staff_breeze/features/registration/data/model/sign_in_model.dart';
import 'package:staff_breeze/features/registration/domain/entities/sign_in_entity.dart';
import 'package:staff_breeze/features/registration/domain/entities/sign_up_entity.dart';
import 'package:staff_breeze/features/registration/domain/repository/registration_repository.dart';

import '../model/sign_up_model.dart';

@Singleton(as:RegistrationRepository)
class RegistrationRepositoryImpl implements RegistrationRepository {
  RegistrationRepositoryImpl(
      {required this.client,
      required this.signInMapper,
      required this.signUpMapper});

  SignInMapper signInMapper;
  SignUpMapper signUpMapper;
  RegistrationClient client;

  @override
  Future<Result<SignInEntity>> signIn(
          {required String email, required String password}) =>
      handleResponse<SignInModel, SignInEntity>(
        () => client.signIn(email:email,password: password),
        (response) => signInMapper.mapper(response),
      );

  @override
  Future<Result<SignUpEntity>> signUp({
    required String name,
    required String email,
    required String password,
    required String password_confirmation,
    required int accountTypeId})=>handleResponse<SignUpModel,SignUpEntity>(
          () => client.signUp(name:name,email: email ,password: password,password_comfirmation:password_confirmation,accountTypeId: accountTypeId),
          (response) {
            print('response is ${response.data.role}');
            var result =signUpMapper.mapper(response);
             print('the result is ${result}');
            return  result;
          });

 /* @override
  Future<Result<SignUpEntity>> signUp(
      {required String name,
      required String email,
      required String password,
        required String password_confirmation,
      required int accountTypeId}) =>
      handleResponse<SignUpModel,SignUpEntity>(
              () => client.signUp(name:name,email: email ,password: password,password_comfirmation: password_confirmation,accountTypeId: accountTypeId),
              (response) => signUpMapper.mapper(response));*/
}
