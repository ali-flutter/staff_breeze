import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:staff_breeze/core/network_configration/base_network_config.dart';
import 'package:staff_breeze/core/network_configration/endpoints.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/models/get_reviews_model.dart';
part 'get_reviews_client.g.dart';
@Singleton()
@RestApi(baseUrl: baseUrl)
abstract class GetReviewsCleint {
  @factoryMethod
  factory GetReviewsCleint(Dio dio) = _GetReviewsCleint;
  @GET('$getReviewsEndPoint/{assistantId}')
  Future<GetReviewsModel>getReviews({@Path('assistantId')required int assistantId});
}
