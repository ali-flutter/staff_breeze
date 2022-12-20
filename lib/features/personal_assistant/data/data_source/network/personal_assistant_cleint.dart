import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:staff_breeze/core/network_configration/base_network_config.dart';
import 'package:staff_breeze/core/network_configration/endpoints.dart';
import 'package:staff_breeze/features/personal_assistant/data/model/personal_assistant_home_page_model.dart';
part 'personal_assistant_cleint.g.dart';
@Singleton()
@RestApi(baseUrl: baseUrl)
abstract class PesonalAssistantCleint {
  @factoryMethod
  factory PesonalAssistantCleint(Dio dio) = _PesonalAssistantCleint;
  @GET(getAssistantEndPoint)
  Future<PersonalAssistantHomePageModel> getPersonalAssistant(
      {@Query("assistant_id") required int id});
}
