import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/registration/domain/entities/remove_device_token_entity.dart';

abstract class RemoveDeviceTokenRepository{
  Future<Result<RemoveDeviceTokenEntity>>removeDeviceToken({required String bearer_token});
}