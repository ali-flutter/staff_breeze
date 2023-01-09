

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:staff_breeze/core/network_configration/base_network_config.dart';
import 'package:staff_breeze/core/network_configration/endpoints.dart';

import '../../model/remove_devie_token_model.dart';
part 'remove_device_token_client.g.dart';
@Singleton()
@RestApi(baseUrl: baseUrl)
abstract class RemoveDeviceTokenCleint{
@factoryMethod
  factory RemoveDeviceTokenCleint(Dio dio) = _RemoveDeviceTokenCleint;
@POST(removeDeviceTokenEndPoint)
Future<RemoveDeviceTokenModel>removeDeviceToken({
  @Header("Authorization")required String bearer_token});
}