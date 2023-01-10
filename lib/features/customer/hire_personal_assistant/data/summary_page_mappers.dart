


import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/customer/hire_personal_assistant/data/summary_page_model.dart';
import 'package:staff_breeze/features/customer/hire_personal_assistant/domain/summary_page_entity.dart';

@injectable
class SummaryPageMapper {
   SummaryPageEntity mapper(SummaryPageModel model){
      return SummaryPageEntity(code: model.code, data: dataMapper(model.data));
   }
   SummaryPageDataEntity dataMapper(SummaryPageDataModel model){
      return SummaryPageDataEntity(ends_at: model.ends_at   , starts_at: model.starts_at, total_payment:model. total_payment);
   }
}