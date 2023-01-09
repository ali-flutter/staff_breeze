
import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/registration/data/model/remove_devie_token_model.dart';
import 'package:staff_breeze/features/registration/domain/entities/remove_device_token_entity.dart';


@injectable
class RemoveDeviceTokenMapper{
  RemoveDeviceTokenEntity mapper(RemoveDeviceTokenModel model){
    return RemoveDeviceTokenEntity(code: model.code, message:model.message);
  }
}