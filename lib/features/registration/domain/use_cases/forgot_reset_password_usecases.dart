
import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/registration/domain/entities/forgot_password_entity.dart';
import 'package:staff_breeze/features/registration/domain/repository/forgot_reset_password_repository.dart';

import '../../../../core/network_configration/result.dart';
import '../entities/reset_password_entity.dart';

@injectable
class ForgotResetPasswordUseCases{
ForgotResetPasswordRepository forgotResetPasswordRepository;
ForgotResetPasswordUseCases({required this.forgotResetPasswordRepository});

Future<Result<ForgotPasswordEntity>>sendForgotPasswordEmail({required String email}){
return forgotResetPasswordRepository.sendForgotPasswordEmail(email:email);
}
Future<Result<ResetPasswordEntity>>resetPassword({required String password,required String password_confirmation, required String code }){
 return forgotResetPasswordRepository.resetPassword(password: password,password_confirmation: password_confirmation,code: code);
}
}