import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/registration/data/model/add_device_token_model.dart';
import 'package:staff_breeze/features/registration/domain/entities/add_device_token_entity.dart';

@injectable
class AddDeviceTokenMapper{
  AddDeviceTokenEntity mapper(AddDeviceTokenModel model){
    return AddDeviceTokenEntity(data: model.data, code:model.code, message: model.message);
  }
}