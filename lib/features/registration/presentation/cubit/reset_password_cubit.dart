

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/registration/domain/entities/reset_password_entity.dart';
import 'package:staff_breeze/features/registration/domain/use_cases/forgot_reset_password_usecases.dart';

import '../../../../core/network_configration/result.dart';
import '../../domain/entities/forgot_password_entity.dart';

@injectable
class ResetPasswordCubit extends Cubit<Result<ResetPasswordEntity>>{
  ResetPasswordCubit({required this.forgotResetPasswordUseCases}):super(const Result.initial()) ;
  final ForgotResetPasswordUseCases forgotResetPasswordUseCases;
  Future sendForgotPasswordEmail({required String password,required String password_confirmation,required String code })async{
    emit(Result.loading());
    var response=await forgotResetPasswordUseCases.resetPassword(password: password, password_confirmation: password_confirmation, code: code);
    emit(response);
  }
}