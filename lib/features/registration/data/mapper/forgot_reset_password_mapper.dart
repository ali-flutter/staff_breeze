
import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/registration/data/model/reset_password_model.dart';
import 'package:staff_breeze/features/registration/data/model/send_forgot_password_email.dart';
import 'package:staff_breeze/features/registration/domain/entities/forgot_password_entity.dart';
import 'package:staff_breeze/features/registration/domain/entities/reset_password_entity.dart';

@injectable
class ForgotResetPasswordMapper{
  ForgotPasswordEntity forgotPasswordMapper(SendForgotPasswordEmailModel model){
    return ForgotPasswordEntity(code: model.code,
        message: model.message);
  }
  ResetPasswordEntity resetPasswordMapper(ResetPasswordModel model){
    return ResetPasswordEntity(message: model.message);
  }
}