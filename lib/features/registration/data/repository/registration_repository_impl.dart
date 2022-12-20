// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/error/error_entity.dart';
import 'package:staff_breeze/core/error/error_model.dart';
import 'package:staff_breeze/core/error/error_model_to_entity.dart';

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

@Singleton(as: RegistrationRepository)
class RegistrationRepositoryImpl implements RegistrationRepository {
  RegistrationRepositoryImpl({
    required this.client,
    required this.signInMapper,
    required this.signUpMapper,
    required this.errorMapper,
  });

  SignInMapper signInMapper;
  SignUpMapper signUpMapper;
  RegistrationClient client;
  ErrorMapper errorMapper;

  @override
  Future<Result<SignInEntity>> signIn(
          {required String email, required String password}) =>
      handleResponse<SignInModel, SignInEntity>(
        () => client.signIn(email: email, password: password),
        (response) => signInMapper.mapper(response),
      );
  @override
  Future<Result<SignUpEntity>> signUp(
          {required String name,
          required String email,
          required String password,
          required String password_confirmation,
          required int role_id}) =>
      handleResponse<SignUpModel, SignUpEntity>(
          () => client.signUp(
              name: name,
              email: email,
              password: password,
              password_comfirmation: password_confirmation,
              role_id: role_id), (response) {
        var result = signUpMapper.mapper(response);

        return result;
      });
}
