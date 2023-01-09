import 'package:staff_breeze/features/registration/domain/entities/add_device_token_entity.dart';

import '../../../../core/network_configration/result.dart';

abstract class AddDeviceTokenRepository{
  Future<Result<AddDeviceTokenEntity>>addDeviceToken({required String bearer_token,required String device_token});
}