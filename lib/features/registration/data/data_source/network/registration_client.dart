// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers, non_constant_identifier_names
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:staff_breeze/core/error/error_model.dart';
import 'package:staff_breeze/core/network_configration/base_network_config.dart';
import '';
import '../../../../../core/network_configration/endpoints.dart';
import '../../../../../core/network_configration/result.dart';
import '../../model/sign_in_model.dart';
import '../../model/sign_up_model.dart';
part 'registration_client.g.dart';

@Singleton()
@RestApi(baseUrl: baseUrl)
abstract class RegistrationClient {
  @factoryMethod
  factory RegistrationClient(Dio dio) = _RegistrationClient;

  @POST(signInEndpoint)
  @MultiPart()
  Future<SignInModel> signIn(
      {@Part(name: "email") required String email,
      @Part(name: "password") required String password});

  @POST(signUpEndpoint)
  @MultiPart()
  Future<SignUpModel> signUp(
      {@Part(name: "name")
          required String name,
      @Part(name: "email")
          required String email,
      @Part(name: "password")
          required String password,
      @Part(name: "role_id")
          required int role_id,
      @Part(name: "password_confirmation")
          required String password_comfirmation});
}
  