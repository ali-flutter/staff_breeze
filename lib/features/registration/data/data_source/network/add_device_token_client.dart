
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:staff_breeze/core/network_configration/base_network_config.dart';


import 'package:staff_breeze/core/network_configration/endpoints.dart';
import '../../../../../core/network_configration/base_network_config.dart';
import '../../model/add_device_token_model.dart';
part'add_device_token_client.g.dart';
@Singleton()
@RestApi(baseUrl: baseUrl)
abstract class AddDeviceTokenCleint{
  @factoryMethod
factory AddDeviceTokenCleint(Dio dio)=_AddDeviceTokenCleint;
@POST(addDeviceTokenEndPoint)
@MultiPart()
Future<AddDeviceTokenModel>addDeviceToken({
 @Header('Authorization') required String bearer_token,
  @Part(name: "device_token")required String device_token,
});
}