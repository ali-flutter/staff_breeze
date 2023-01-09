
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:staff_breeze/core/network_configration/base_network_config.dart';
import 'package:staff_breeze/core/network_configration/endpoints.dart';
import 'package:staff_breeze/features/customer/data/models/get_customer_info_models.dart';
part'get_customer_info_cleint.g.dart';
@Singleton()
@RestApi(baseUrl: baseUrl)
abstract class GetCustomerClient {
@factoryMethod
  factory  GetCustomerClient (Dio dio)=_GetCustomerClient;

@GET(getCustomerInfoEndPoint)
Future<GetCustomerInfoModel>getCustomerInfo({
  @Query("user_id")required int user_id,
}) ;
}