import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/handle_response.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/data/data_source/network/get_customer_reservation_cleint.dart';
import 'package:staff_breeze/features/customer/data/mappers/get_customer_reservation_mappers.dart';
import 'package:staff_breeze/features/customer/data/models/get_customer_reservation_model.dart';
import 'package:staff_breeze/features/customer/domain/entities/get_customer_reservation_entity.dart';
import 'package:staff_breeze/features/customer/domain/repository/get_customer_reservation_repository.dart';

@Singleton(as: GetCustomerReservationRepository)
class GetCustomerReservationRepositoryImpl implements GetCustomerReservationRepository{
  GetCustomerReservationCleint cleint;
  GetCustomerReservationMappers mapper;
  GetCustomerReservationRepositoryImpl({required this.mapper,required this.cleint});
  @override
  Future<Result<GetCustomerReservationEntity>> getCustomerReservation({required String bearer_token, required String customer_id})=>
      handleResponse<GetCustomerReservationModel,GetCustomerReservationEntity>
        (() => cleint.getCustomerReservation(bearer_token: bearer_token, customer_id: customer_id),
              (response) => mapper.mapper(response));
  
}