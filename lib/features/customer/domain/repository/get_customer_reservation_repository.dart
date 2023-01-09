import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/domain/entities/get_customer_reservation_entity.dart';

abstract class GetCustomerReservationRepository {
  Future<Result<GetCustomerReservationEntity>> getCustomerReservation({required String bearer_token,required String customer_id});
}