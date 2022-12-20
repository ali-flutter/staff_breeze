import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/models/get_all_assistant_model.dart';

import 'package:staff_breeze/features/registration/data/model/complete_registration_model/languages_model.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/languages_entity.dart';

@injectable
class LanguagesMapper {
  AllLanguagesEntity languageMapper(AllLanguagesModel model) {
    return AllLanguagesEntity(
        code: model.code,
        data: model.data.map((e) => languagesDataMapper(e)).toList());
    //message: messagesMappers(model.message));
  }

  LanguagesDataEntity languagesDataMapper(LanguagesDataModel dataModel) {
    return LanguagesDataEntity(id: dataModel.id, name: dataModel.name);
  }

  LanguagesMessageEntity messagesMappers(
      LanguagesMessageModel languagesMessageModel) {
    return LanguagesMessageEntity(error: languagesMessageModel.errors);
  }
}
