import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:staff_breeze/core/network_configration/base_network_config.dart';
import 'package:staff_breeze/core/network_configration/endpoints.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/models/get_used_languages_model.dart';
part 'get_used_languages_client.g.dart';

@Singleton()
@RestApi(baseUrl: baseUrl)
abstract class GetUsedLanguagesCleint {
  @factoryMethod
  factory GetUsedLanguagesCleint(Dio dio)=_GetUsedLanguagesCleint;
 @GET(getUsedLanguagesEndPoint)
  Future<GetUsedLanguagesModel> getUsedLanguages();
}
