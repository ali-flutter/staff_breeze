// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:staff_breeze/core/network_configration/base_network_config.dart';
import 'package:staff_breeze/core/network_configration/endpoints.dart';

import '../../model/add_languages_model.dart';
part 'add_languages_cleint.g.dart';

@Singleton()
@RestApi(baseUrl: baseUrl)
abstract class AddLanguagesCleint{
  @factoryMethod
  factory AddLanguagesCleint(Dio dio)= _AddLanguagesCleint;
  @POST(addLanguagesEndPoint)

  @MultiPart()
  Future<AddLanguagesModel>addLanguages({
  @Header("Authorization")required String bearer,
  @Header("Content-Type") required String content_type,
  @Part(name: "user_id")required int user_id,
    @Part(name:"language_ids")required String language_ids,

});
}