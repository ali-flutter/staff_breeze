import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/personal_assistant/domain/entity/schedule_entity/get_assistant_reservation_entity.dart';

import '../../../../customer/find_personal_assistant/domain/entities/get_assistant_entity.dart';

abstract class GetAssistantReservationRepository{
  Future <Result<GetAssistantReservationEntity>>getAssistantReservation({required String bearer_token,required String assistant_id});
}