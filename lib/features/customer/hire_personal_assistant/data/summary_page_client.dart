

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:staff_breeze/core/network_configration/base_network_config.dart';
import 'package:staff_breeze/features/customer/hire_personal_assistant/data/summary_page_model.dart';
import 'package:staff_breeze/features/customer/hire_personal_assistant/presentation/pages/summary_page.dart';
part 'summary_page_client.g.dart';

@Singleton()
@RestApi(baseUrl: baseUrl)
abstract class SummaryPageClient{
   @factoryMethod
  factory SummaryPageClient(Dio dio)=_SummaryPageClient;
   @GET("/get-total-payment/{customer_id}/{assistant_id}")
   Future<SummaryPageModel>getTotalPayment({

     @Header("Authorization")required String bearer,
     @Path("customer_id")required int customer_id,
     @Path("assistant_id")required int assistant_id});
}