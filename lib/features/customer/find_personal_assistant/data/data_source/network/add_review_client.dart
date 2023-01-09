
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:staff_breeze/core/network_configration/base_network_config.dart';
import 'package:staff_breeze/core/network_configration/endpoints.dart';

import '../../models/add_review_model.dart';
part 'add_review_client.g.dart';
@Singleton()
@RestApi(baseUrl: baseUrl)
abstract class AddReviewClient{
  @factoryMethod
  factory AddReviewClient(Dio dio)= _AddReviewClient;
  @POST(addReviewEndPoint)
  @MultiPart()
  Future<AddReviewModel>addReview({
  @Header("Authorization")required String bearer_token,
   @Part(name:"assistant_id") required int assistant_id,
    @Part(name:"rating")required int rating,
    @Part(name:"body")required String body,
});
}