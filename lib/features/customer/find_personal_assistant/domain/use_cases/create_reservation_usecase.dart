import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/create_reservation_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/repository/create_reservation_repository.dart';

@injectable
class CreateReservationUseCase{
  CreateReservationUseCase({required this.createReservationRepository});
  CreateReservationRepository createReservationRepository;
  Future<Result<CreateReservationEntity>>createReservation({required String bearer_token,required int customer_id,required int assistant_id,required List<String>reservations_dates}){
    return createReservationRepository.createReservation(bearer_token: bearer_token,customer_id: customer_id, assistant_id: assistant_id, reservations_dates: reservations_dates);
  }
}