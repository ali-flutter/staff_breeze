import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/models/get_free_days_model.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_free_days_entity.dart';

@injectable
class GetFreeDaysMappers {
  GetFreeDaysEntity mapper(GetFreeDaysModel model) {
    return GetFreeDaysEntity(code: model.code, data: dataMapper(model.data), message: messageMapper(model.message));
  }

  GetFreeDaysMessageEntity messageMapper(GetFreeDaysMessageModel messageModel) {
    return GetFreeDaysMessageEntity(error: messageModel.error);
  }

  GetFreeDaysDataEntity dataMapper(GetFreeDaysDataModel model) {
    return GetFreeDaysDataEntity(first_month_dates: model.first_month_dates, second_month_dates: model.second_month_dates);
  }
}
