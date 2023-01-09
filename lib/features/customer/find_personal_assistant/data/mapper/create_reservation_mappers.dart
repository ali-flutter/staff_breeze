import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/models/create_reservation_model.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/create_reservation_entity.dart';

@injectable
class CreateReservationMappers{
  CreateReservationEntity mapper(CreateReservationModel model){
    return CreateReservationEntity(code: model.code, message:messageMapper(model.message));
  }
  CreateReservationMessageEntity messageMapper(CreateReservationMessageModel model){
    return CreateReservationMessageEntity(error: model.error);
  }
}