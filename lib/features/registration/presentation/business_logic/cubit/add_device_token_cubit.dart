import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/registration/domain/use_cases/add_device_token_use_case.dart';

import '../../../domain/entities/add_device_token_entity.dart';
@injectable
class AddDeviceTokenCubit extends Cubit<Result<AddDeviceTokenEntity>>{
  AddDeviceTokenCubit({required this.useCase}):super(const Result.initial());
 AddDeviceTokenUseCase useCase;


 Future addDeviceToken({required String bearer_token,required String device_token})async{
   emit(Result.loading());
   final result=await useCase.addDeviceToken(bearer_token: bearer_token, device_token: device_token);
   emit(result);
 }
}