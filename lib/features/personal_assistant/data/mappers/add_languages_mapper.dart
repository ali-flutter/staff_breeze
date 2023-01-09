import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/personal_assistant/data/model/add_languages_model.dart';
import 'package:staff_breeze/features/personal_assistant/domain/entity/add_languages_entity.dart';

@injectable
class AddLanguagesMapper{
  AddLanguagesEntity mapper(AddLanguagesModel model){
    return AddLanguagesEntity(code: model.code , message:messageMapper(model.message));
  }
  AddLanguagesMessageEntity messageMapper(AddLanguageMessagesModel model){
    return AddLanguagesMessageEntity(error: model.error);
  }
}
