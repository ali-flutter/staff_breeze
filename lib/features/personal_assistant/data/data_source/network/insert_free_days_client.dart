// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:staff_breeze/core/network_configration/base_network_config.dart';
import 'package:staff_breeze/core/network_configration/endpoints.dart';
import 'package:staff_breeze/features/personal_assistant/data/model/schedule_models/insert_free_days_model.dart';
part 'insert_free_days_client.g.dart';

@Singleton()
@RestApi(baseUrl: baseUrl)
abstract class InsertFreeDaysClient {
  @factoryMethod
  factory InsertFreeDaysClient(Dio dio) =
  _InsertFreeDaysClient;
  @POST(insertFreeDaysEndPoint)
  @MultiPart()
  Future<InsertFreeDaysModel> enterFreeDays({
    @Header('Authorization')required String bearer,
    @Part(name: "assistant_id") required int assistant_id,
    @Part(name: "hours") required int hours,
    @Part(name: "hourly_rate") required int hourly_rate,
    @Part(name: "start_at") required int start_at,
    @Part(name: "weeks") required int weeks,
    @Part(name: "free_days") required String free_days,
  });
}
