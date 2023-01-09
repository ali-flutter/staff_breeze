import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_assistant_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/repository/get_assistant_repository.dart';
import 'package:staff_breeze/features/personal_assistant/domain/repository/schedule_repository/get_assistant_reservation_repository.dart';

import '../../../../core/network_configration/result.dart';
import '../entity/schedule_entity/get_assistant_reservation_entity.dart';


@injectable
class GetAssistantReservationUsecase{
  GetAssistantReservationRepository repository;
  GetAssistantReservationUsecase({required this.repository});
  Future<Result<GetAssistantReservationEntity>>getAssistantReservation({required String bearer_token,required String assistant_id}){
    return repository.getAssistantReservation(bearer_token: bearer_token, assistant_id: assistant_id);
  }
}