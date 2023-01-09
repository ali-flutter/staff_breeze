

import 'package:staff_breeze/core/network_configration/handle_response.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_assistant_entity.dart';
import 'package:staff_breeze/features/personal_assistant/data/model/schedule_models/get_assistant_reservation_model.dart';
import 'package:staff_breeze/features/personal_assistant/domain/entity/schedule_entity/get_assistant_reservation_entity.dart';
import 'package:staff_breeze/features/personal_assistant/domain/repository/schedule_repository/get_assistant_reservation_repository.dart';

import '../data_source/network/get_assistant_reservation_client.dart';
import '../mappers/get_assistant_reservation_mapper.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: GetAssistantReservationRepository)
class GetAssistantReservationRepositoryImp implements GetAssistantReservationRepository{
  GetAssistantReservationMappers mapper;
  GetAssistantReservationClient client;
  GetAssistantReservationRepositoryImp({required this.mapper,required this.client});
  @override
  Future<Result<GetAssistantReservationEntity>> getAssistantReservation({required String bearer_token, required String assistant_id}) =>
      handleResponse<GetAssistantReservationModel,GetAssistantReservationEntity>(
              () => client.getAssistantReservationClient(bearer_token: bearer_token, assistant_id: assistant_id),
              (response) =>mapper.mapper(response));

}