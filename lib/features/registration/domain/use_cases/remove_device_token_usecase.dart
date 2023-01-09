import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/registration/domain/entities/remove_device_token_entity.dart';
import 'package:staff_breeze/features/registration/domain/repository/remove_device_token_repository.dart';


@injectable
class RemoveDeviceTokenUsecase{
  RemoveDeviceTokenUsecase({required this.repository});
  RemoveDeviceTokenRepository repository;
  Future<Result<RemoveDeviceTokenEntity>>removeDeviceToken({required String bearer_token}){
      return repository.removeDeviceToken(bearer_token: bearer_token);
  }
}