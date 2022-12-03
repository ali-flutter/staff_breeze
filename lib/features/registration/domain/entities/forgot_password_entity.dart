import 'package:equatable/equatable.dart';

class ForgotPasswordEntity extends Equatable{
    String code;
    String message;
    ForgotPasswordEntity({required this.code,required this.message});
  @override
  List<Object?> get props => [code, message];
}