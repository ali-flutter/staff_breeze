import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/customer/hire_personal_assistant/domain/summary_page_entity.dart';
import 'package:staff_breeze/features/customer/hire_personal_assistant/domain/summary_page_repository.dart';

import '../../../../core/network_configration/result.dart';

@injectable
class SummaryPageUseCase{
  SummaryPageUseCase({required this.repository});
  SummaryPageRepository repository;
  Future<Result<SummaryPageEntity>>getTotalPayment({required String bearer,required int customer_id,required int assistant_id}){
   return repository.getTotalPayment(bearer: bearer, customer_id: customer_id, assistant_id: assistant_id);
  }
}