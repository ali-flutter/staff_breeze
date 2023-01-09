import 'package:equatable/equatable.dart';

class RemoveDeviceTokenEntity extends Equatable{
  String code;
  String message;
  RemoveDeviceTokenEntity({required this.code,required this.message});

  @override
  List<Object?> get props =>[code,message];

}