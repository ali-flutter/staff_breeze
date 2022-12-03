
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:staff_breeze/core/network_configration/base_network_config.dart';

import '../../../../../core/network_configration/endpoints.dart';
import '../../model/sign_in_model.dart';
import '../../model/sign_up_model.dart';
part 'registration_client.g.dart';
@Singleton()
@RestApi(baseUrl: baseUrl)
abstract class RegistrationClient{
@factoryMethod  
  factory RegistrationClient(Dio dio)=_RegistrationClient;
  @POST(signInEndpoint)
  @MultiPart()
  Future<SignInModel>signIn({
    @Part(name:"email")required String email,
    @Part(name:"password")required String password});
  @POST(signUpEndpoint)
  @MultiPart()
  Future<SignUpModel>signUp({
    @Part(name: "name") required String name,
    @Part(name:"email") required String email,
    @Part(name:"password") required String password,
    @Part(name: "role") required int accountTypeId,
    @Part(name:"password_confirmation") required String password_comfirmation});
}