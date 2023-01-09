import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/registration/data/data_source/network/add_device_token_client.dart';
import 'package:staff_breeze/features/registration/data/mapper/add_device_token_mapper.dart';
import 'package:staff_breeze/features/registration/data/model/add_device_token_model.dart';

import 'package:staff_breeze/features/registration/domain/entities/add_device_token_entity.dart';

import '../../../../core/network_configration/handle_response.dart';
import '../../domain/repository/add_device_token_repository.dart';


@Singleton(as: AddDeviceTokenRepository)
class AddDeviceTokenRepositoryImpl implements AddDeviceTokenRepository{
  AddDeviceTokenCleint cleint;
  AddDeviceTokenMapper mapper;
  AddDeviceTokenRepositoryImpl({required this.cleint,required this.mapper});

  @override
  Future<Result<AddDeviceTokenEntity>> addDeviceToken({required String bearer_token, required String device_token}) =>
      handleResponse<AddDeviceTokenModel,AddDeviceTokenEntity>(
              ()=>cleint.addDeviceToken(bearer_token: bearer_token, device_token: device_token),
          (response)=>mapper.mapper(response),
      );
  
}