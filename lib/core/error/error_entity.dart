import 'package:equatable/equatable.dart';

class ErrorEntity extends Equatable {
  String code;
  String message;
  ErrorEntity({required this.code, required this.message});

  @override
  List<Object?> get props => [code,message];
}
