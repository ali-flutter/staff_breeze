import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/models/get_used_languages_model.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_used_languages_entity.dart';


@injectable
class GetUsedLanguagesModelToEntity {
  GetUsedLanguagesEntity usedLanguagesEntityMapper(
      GetUsedLanguagesModel model) {
    return GetUsedLanguagesEntity(
        code: model.code,
        message: messageMapper(model.message),
        data:
            model.data!.map((e) => usedLanguagesDataEntityMapper(e)).toList());
  }

  GetUsedLanguagesEntityMessage messageMapper(
      GetUsedLanguagesMessageModel? model) {
    return GetUsedLanguagesEntityMessage(error: model!.error);
  }

  GetUsedLanguagesDataEntity usedLanguagesDataEntityMapper(
      GetUsedLanguagesDataModel model) {
    return GetUsedLanguagesDataEntity(id: model.id, name: model.name);
  }
}
