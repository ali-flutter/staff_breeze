import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/create_reservation_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/use_cases/create_reservation_usecase.dart';

@injectable
class CreateReservationCubit extends Cubit<Result<CreateReservationEntity>>{
  CreateReservationCubit({required this.useCase}):super(Result.initial());
  CreateReservationUseCase useCase;
  Future createReservation({required String bearer_token,required int customer_id,required int assistant_id,required List<String>reservations_dates})async{
    emit(Result.loading());
    final result=await useCase.createReservation(bearer_token: bearer_token, customer_id: customer_id, assistant_id: assistant_id, reservations_dates: reservations_dates);
  emit(result );
  }
}