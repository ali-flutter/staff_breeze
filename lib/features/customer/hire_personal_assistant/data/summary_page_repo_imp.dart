import 'package:staff_breeze/core/network_configration/handle_response.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/hire_personal_assistant/data/summary_page_client.dart';
import 'package:staff_breeze/features/customer/hire_personal_assistant/data/summary_page_mappers.dart';
import 'package:staff_breeze/features/customer/hire_personal_assistant/data/summary_page_model.dart';
import 'package:staff_breeze/features/customer/hire_personal_assistant/domain/summary_page_entity.dart';
import 'package:staff_breeze/features/customer/hire_personal_assistant/presentation/pages/summary_page.dart';
import 'package:injectable/injectable.dart';
import '../domain/summary_page_repository.dart';

@Singleton(as:SummaryPageRepository )
class SummaryPageRepoImp implements SummaryPageRepository{
  SummaryPageRepoImp({required this.mapper,required this.client});
  SummaryPageClient client;
  SummaryPageMapper mapper;
  @override
  Future<Result<SummaryPageEntity>> getTotalPayment({
    required String bearer, required int customer_id, required int assistant_id})=>
      handleResponse<SummaryPageModel,SummaryPageEntity>(
              () => client.getTotalPayment(bearer: bearer, customer_id: customer_id, assistant_id: assistant_id),
              (response) =>mapper.mapper(response) );
}