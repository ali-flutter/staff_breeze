import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/handle_response.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/data_source/network/create_reservation_cleint.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/mapper/create_reservation_mappers.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/models/create_reservation_model.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/create_reservation_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/repository/create_reservation_repository.dart';

@Singleton(as: CreateReservationRepository)
class CreateReservationRepositoryImp implements CreateReservationRepository {
  CreateReservationRepositoryImp({required this.cleint, required this.mappers});

  CreateReservationCleint cleint;
  CreateReservationMappers mappers;

  @override
  Future<Result<CreateReservationEntity>> createReservation(
          {required String bearer_token,
          required int customer_id,
          required int assistant_id,
          required List<String> reservations_dates}) =>
      handleResponse<CreateReservationModel, CreateReservationEntity>(
        () => cleint.createReservation(
            bearer_token: bearer_token,
            customer_id: customer_id,
            assistant_id: assistant_id,
            reservations_dates: reservations_dates),
        (response) => mappers.mapper(response),
      );
}
