import 'package:equatable/equatable.dart';

class GetUsedServicesEntity extends Equatable{
  String code;
  GetUsedServicesMessageEntity message;
  List<GetUsedServicesDataEntity> data;
  GetUsedServicesEntity({required this.data,required this.code,required this.message});
  @override
  List<Object?> get props => [code,message,data];

}

class GetUsedServicesMessageEntity extends Equatable{
  List <String >error;
  GetUsedServicesMessageEntity({required this.error});

  @override
  List<Object?> get props => [error];

}
class GetUsedServicesDataEntity extends Equatable {
  int id;
   String name;
   GetUsedServicesDataEntity({required this.id,required this.name});
  @override
  List<Object?> get props => [id,name];

}