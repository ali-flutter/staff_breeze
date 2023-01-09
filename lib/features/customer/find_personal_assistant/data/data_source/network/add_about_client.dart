

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:staff_breeze/core/network_configration/base_network_config.dart';
import 'package:staff_breeze/core/network_configration/endpoints.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/models/add_about_model.dart';
part 'add_about_client.g.dart';
@Singleton()
@RestApi(baseUrl: baseUrl)
abstract class AddAboutCleint {
  @factoryMethod
  factory AddAboutCleint(Dio dio)=_AddAboutCleint;
@POST(addAboutEndPoint)
  @MultiPart()
  Future<AddAboutModel>addAbout({
  @Header("Authorization")required String bearer_token,
    @Part(name: "user_id")required int user_id,
  @Part(name: "about")required String about,
});
}