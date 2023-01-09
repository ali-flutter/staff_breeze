


// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:staff_breeze/core/network_configration/base_network_config.dart';
import 'package:staff_breeze/core/network_configration/endpoints.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/models/get_free_days_model.dart';
part 'get_free_days_cleint.g.dart';

@Singleton()
@RestApi(baseUrl: baseUrl)
abstract class GetFreeDaysCleint{
@factoryMethod
factory GetFreeDaysCleint(Dio dio) = _GetFreeDaysCleint;

@GET("$getFreeDaysEndPoint/{user_id}")
Future<GetFreeDaysModel>getFreeDays({
 @Header("Authorization") required String bearer_token,
 @Path("user_id") required int user_id,
});

}