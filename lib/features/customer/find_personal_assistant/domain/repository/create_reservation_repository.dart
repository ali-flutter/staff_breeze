

import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/create_reservation_entity.dart';

import '../../../../../core/network_configration/result.dart';

abstract class CreateReservationRepository {
  CreateReservationRepository({required});
  Future<Result<CreateReservationEntity>>createReservation({required String bearer_token,required int customer_id,required int assistant_id,required List<String>reservations_dates});
}