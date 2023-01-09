import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/handle_response.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/registration/data/model/remove_devie_token_model.dart';
import 'package:staff_breeze/features/registration/domain/entities/remove_device_token_entity.dart';
import 'package:staff_breeze/features/registration/domain/repository/remove_device_token_repository.dart';

import '../data_source/network/remove_device_token_client.dart';
import '../mapper/remove_device_token_mappers.dart';



@Singleton(as: RemoveDeviceTokenRepository)
class RemoveDeviceTokenRepositoryImp implements RemoveDeviceTokenRepository{
RemoveDeviceTokenRepositoryImp({required this.mapper,required this.cleint});
RemoveDeviceTokenMapper mapper;
RemoveDeviceTokenCleint cleint;
  @override
  Future<Result<RemoveDeviceTokenEntity>> removeDeviceToken({required String bearer_token}) =>
      handleResponse<RemoveDeviceTokenModel,RemoveDeviceTokenEntity>(
              () => cleint.removeDeviceToken(bearer_token: bearer_token),
              (response) => mapper.mapper(response));
}