import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/registration/domain/repository/add_device_token_repository.dart';

import '../../../../core/network_configration/result.dart';
import '../entities/add_device_token_entity.dart';

@injectable
class AddDeviceTokenUseCase{
  AddDeviceTokenUseCase({required this.addDeviceTokenRepository});
  AddDeviceTokenRepository addDeviceTokenRepository;
  Future<Result<AddDeviceTokenEntity>>addDeviceToken({required String bearer_token,required String device_token}){
    return addDeviceTokenRepository.addDeviceToken(bearer_token: bearer_token, device_token: device_token);
  }
}