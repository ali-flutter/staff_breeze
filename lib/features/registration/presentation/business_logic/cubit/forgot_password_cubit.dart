
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/registration/domain/use_cases/forgot_reset_password_usecases.dart';

import '../../../../../core/network_configration/result.dart';
import '../../../domain/entities/forgot_password_entity.dart';

@injectable
class ForgotPasswordCubit extends Cubit<Result<ForgotPasswordEntity>>{
ForgotPasswordCubit({required this.forgotResetPasswordUseCases}):super(const Result.initial()) ;
final ForgotResetPasswordUseCases forgotResetPasswordUseCases;
Future sendForgotPasswordEmail({required String email})async{
  emit(Result.loading());
  var response=await forgotResetPasswordUseCases.sendForgotPasswordEmail(email: email);
  emit(response); 
}
}