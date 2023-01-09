import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:staff_breeze/core/network_configration/base_network_config.dart';
import 'package:staff_breeze/features/personal_assistant/data/model/schedule_models/get_assistant_reservation_model.dart';
part 'get_assistant_reservation_client.g.dart';
@Singleton()
@RestApi(baseUrl: baseUrl)
abstract class GetAssistantReservationClient {
  @factoryMethod
  factory GetAssistantReservationClient(Dio dio) =
      _GetAssistantReservationClient;

   @GET("/get-reservations-assistant/{id}")
  Future<GetAssistantReservationModel> getAssistantReservationClient({
    @Header("Authorization")required String bearer_token,
    @Path("id") required String assistant_id,
  });
}
