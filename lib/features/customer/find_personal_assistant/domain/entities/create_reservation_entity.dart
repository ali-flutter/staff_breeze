import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CreateReservationEntity extends Equatable{
  String code;
  CreateReservationMessageEntity message;
  CreateReservationEntity({required this.code,required this.message});
  @override
  List<Object?> get props => [code,message];
}
class CreateReservationMessageEntity extends Equatable{
  List<String>error;
  CreateReservationMessageEntity({required this.error});

  @override
  List<Object?> get props => [error];

}