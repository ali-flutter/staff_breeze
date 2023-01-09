import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/registration/data/model/complete_registration_model/get_all_services_model.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/get_all_services_entity.dart';

@injectable
class GetAllServicesMappers {
  GetAllServicesEntity mapper(GetAllServicesModel model) {
    return GetAllServicesEntity(
        code: model.code,
        message: messageMapper(model.message),
        data: model.data.map((e) => dataMapper(e)).toList());
  }

  AllServicesMessageEntity messageMapper(GetAllServicesMessageModel model) {
    return AllServicesMessageEntity(error: model.error);
  }

  AllServicesDataEntity dataMapper(GetAllServicesDataModel model) {
    return AllServicesDataEntity(id: model.id, name: model.title);
  }
}
