

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:staff_breeze/core/network_configration/base_network_config.dart';
import 'package:staff_breeze/core/network_configration/endpoints.dart';

import '../../models/get_used_sevices_model.dart';
part 'get_used_services_cleint.g.dart';

@Singleton()
@RestApi(baseUrl:baseUrl)
abstract class GetUsedServicesCleint{
  @factoryMethod
  factory GetUsedServicesCleint(Dio dio)= _GetUsedServicesCleint;

  @GET(usedServicesEndPoint)
  Future<GetUsedServicesModel>getUsedServices();

}