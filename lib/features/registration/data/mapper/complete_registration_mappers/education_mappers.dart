


import 'package:injectable/injectable.dart';
import '../../../domain/entities/complete_registration_entities/education_entity.dart';
import '../../model/complete_registration_model/education_model.dart';

@injectable
class EducationMapper {
  EducationsEntity mapper(EducationsModel model) {
    return EducationsEntity(
        code: model.code,
        data: model.data.map((e) => educationDataMapper(e)).toList(),
       // message: messagesMappers(model.message)
        );
  }

  EducationDataEntity educationDataMapper(EducationDataModel dataModel) {
    return EducationDataEntity(id: dataModel.id, title: dataModel.title);
  }

  EducationMessageEntity messagesMappers(
      EducationMessageModel educationMessageModel) {
    return EducationMessageEntity(error: educationMessageModel.errors);
  }
}
