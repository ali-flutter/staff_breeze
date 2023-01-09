


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/domain/entities/get_customer_reservation_entity.dart';
import 'package:staff_breeze/features/customer/domain/use_case/get_customer_reservation_use_case.dart';

@injectable
class GetCustomerReservationCubit extends Cubit<Result<GetCustomerReservationEntity>>{
  GetCustomerReservationCubit({required this.useCase}):super(const Result.initial());
  GetCustomerReservationUsecase useCase;
  Future getCustomerReservation({required String bearer_token,required String customer_id})async{
    emit(Result.loading());
    final result=await useCase.getCustomerReservation(bearer_token: bearer_token, customer_id: customer_id);
    emit(result);
  }
}