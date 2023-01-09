

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/personal_assistant/domain/entity/schedule_entity/get_assistant_reservation_entity.dart';
import 'package:staff_breeze/features/personal_assistant/domain/use_cases/get_assistant_reservation_use_case.dart';

@injectable
class GetAssistantReservationCubit extends Cubit<Result<GetAssistantReservationEntity>>{
  GetAssistantReservationCubit({required this.useCase}):super(const Result.initial());
  GetAssistantReservationUsecase useCase;

  Future getAssistantReservation({required String bearer_token,required String assistant_id})async{
    emit(Result.loading())  ;
    final result =await useCase.getAssistantReservation(bearer_token: bearer_token, assistant_id: assistant_id);
    emit(result);
  }

}