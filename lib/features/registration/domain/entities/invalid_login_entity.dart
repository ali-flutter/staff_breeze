import 'package:equatable/equatable.dart';

class InvalidLoginEntity extends Equatable {
  String code;
  String message;
  InvalidLoginDataEntity? data;
  InvalidLoginEntity({required this.code, required this.message, this.data});
  
  @override

  List<Object?> get props => [code,message,data];
}

class InvalidLoginDataEntity extends Equatable {
  @override
   List<Object?> get props => [
    
   ];

}
