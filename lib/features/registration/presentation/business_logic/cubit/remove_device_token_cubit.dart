

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/registration/domain/entities/remove_device_token_entity.dart';
import 'package:staff_breeze/features/registration/domain/use_cases/remove_device_token_usecase.dart';

import '../../../../../core/network_configration/result.dart';

@injectable
class RemoveDeviceTokenCubit extends Cubit<Result<RemoveDeviceTokenEntity>>{
  RemoveDeviceTokenCubit({required this.usecase}):super(Result.initial());
  RemoveDeviceTokenUsecase usecase;
  Future removeDeviceToken({required String bearer_token})async{
    emit(Result.loading());
    final result = await usecase.removeDeviceToken(bearer_token: bearer_token);
    emit(result);
  }
}