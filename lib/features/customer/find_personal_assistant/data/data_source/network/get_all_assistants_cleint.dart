import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:staff_breeze/core/network_configration/base_network_config.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/models/get_all_assistant_model.dart';

import '../../../../../../core/network_configration/endpoints.dart';
part 'get_all_assistants_cleint.g.dart';

@Singleton()
@RestApi(baseUrl: baseUrl)
abstract class GetAllAssistantsClient {
  @factoryMethod
  factory GetAllAssistantsClient(Dio dio) = _GetAllAssistantsClient;

  @GET(getAllAssistantsEndPoint)
  Future<GetAllAssistantsModel> getAllAssistants({
  @Query("page")required int page,
  @Query("pageSize")required int pageSize,
  @Query('search')required String? search,
  @Query('city') int? city,
  @Query('is_male')int? ismale,
  @Query('education')int? education,
  @Query('lang')int? language,
  @Query('rating')double? rating,
  });
}
