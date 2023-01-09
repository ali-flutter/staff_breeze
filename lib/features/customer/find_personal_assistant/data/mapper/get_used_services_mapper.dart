


import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/models/get_used_sevices_model.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_used_services_entity.dart';


@injectable
class GetUsedServicesMappers{
  GetUsedServicesEntity mapper(GetUsedServicesModel model){
    return GetUsedServicesEntity(data: model.data.map((e) => dataMapper(e)).toList(),
        code: model.code,
        message:messageMapper(model.message));

  }
  GetUsedServicesMessageEntity messageMapper(GetUsedServicesMessageModel model){
    return GetUsedServicesMessageEntity(error: model.error);
  }
  GetUsedServicesDataEntity dataMapper(GetUsedServicesDataModel model){
    return GetUsedServicesDataEntity(id: model.id, name:model.title);
  }
}