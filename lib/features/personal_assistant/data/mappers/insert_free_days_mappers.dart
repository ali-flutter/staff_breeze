import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/personal_assistant/data/model/schedule_models/insert_free_days_model.dart';
import 'package:staff_breeze/features/personal_assistant/domain/entity/schedule_entity/insert_free_days.dart';
@injectable
class InsertFreeDaysMappers{
  InsertFreeDaysEntity mapper(InsertFreeDaysModel model){
    return InsertFreeDaysEntity(code: model.code, message: messageMapper(model.message));
  }
  InsertFreeDaysMessageEntity messageMapper(InsertFreeDaysMessageModel model){
    return InsertFreeDaysMessageEntity(error: model.error);
  }
}