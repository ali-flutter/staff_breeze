import 'package:equatable/equatable.dart';

class ResetPasswordEntity extends Equatable{
  String message;
  ResetPasswordEntity({required this.message});
  @override
  List<Object?> get props => [message];
}