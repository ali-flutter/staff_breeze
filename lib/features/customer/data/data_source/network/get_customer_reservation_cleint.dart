
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:staff_breeze/core/network_configration/base_network_config.dart';
import 'package:staff_breeze/core/network_configration/endpoints.dart';
import 'package:staff_breeze/features/customer/data/models/get_customer_reservation_model.dart';
part 'get_customer_reservation_cleint.g.dart';
@Singleton()
@RestApi(baseUrl: baseUrl)
abstract class GetCustomerReservationCleint{
  @factoryMethod
  factory GetCustomerReservationCleint(Dio dio)= _GetCustomerReservationCleint;
  @GET('/get-reservations-customer/{id}')
  Future<GetCustomerReservationModel>getCustomerReservation({
  @Header("Authorization")required String bearer_token,
    @Path('id')required String customer_id,
  
});

}