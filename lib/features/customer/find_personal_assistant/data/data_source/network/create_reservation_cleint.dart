
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:staff_breeze/core/network_configration/base_network_config.dart';
import 'package:staff_breeze/core/network_configration/endpoints.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/models/create_reservation_model.dart';
part 'create_reservation_cleint.g.dart';
@Singleton()
@RestApi(baseUrl: baseUrl)
abstract class CreateReservationCleint{
  @factoryMethod
factory CreateReservationCleint(Dio dio) = _CreateReservationCleint;
@POST(createReservationEndPoint)
  Future <CreateReservationModel>createReservation({
  @Header("Authorization")required String bearer_token,
  @Part(name:'customer_id') required int customer_id,
  @Part(name:'assistant_id')required int assistant_id,
  @Part(name: 'reservations_dates')required List<String> reservations_dates,
});

}