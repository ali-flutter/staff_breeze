import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/hire_personal_assistant/domain/summary_page_entity.dart';

import '../../domain/summary_page_use_case.dart';
@injectable
class SummaryPaymentCubit extends Cubit<Result<SummaryPageEntity>>{
  SummaryPaymentCubit({required this.useCase}):super(Result.initial());
  SummaryPageUseCase useCase;

  Future getTotalPayment({required int customer_id,required int assistant_id,
    required String bearer })async{
    emit(Result.loading());
    final result = await useCase.getTotalPayment(bearer: bearer, customer_id: customer_id, assistant_id: assistant_id);
    emit(result);
  }
}
