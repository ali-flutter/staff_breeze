import 'package:equatable/equatable.dart';

class AddDeviceTokenEntity extends Equatable{
  int code;
  String message;
  int data;
  AddDeviceTokenEntity({required this.data,required this.code,required this.message});
  @override
  List<Object?> get props => [data,code,message];

}