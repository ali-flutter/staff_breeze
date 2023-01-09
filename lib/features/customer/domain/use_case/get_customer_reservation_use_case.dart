import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/domain/entities/get_customer_reservation_entity.dart';
import 'package:staff_breeze/features/customer/domain/repository/get_customer_reservation_repository.dart';

@injectable
class GetCustomerReservationUsecase{
  GetCustomerReservationUsecase({required this.getCustomerReservationRepository});
  GetCustomerReservationRepository getCustomerReservationRepository;
  Future<Result<GetCustomerReservationEntity>>getCustomerReservation({required String bearer_token,required String customer_id}){
    return getCustomerReservationRepository.getCustomerReservation(bearer_token: bearer_token,customer_id: customer_id);
}

}