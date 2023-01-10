import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/hire_personal_assistant/domain/summary_page_entity.dart';

abstract class SummaryPageRepository{
  Future<Result<SummaryPageEntity>> getTotalPayment({required String bearer,required int customer_id,required int assistant_id});
}