import 'package:equatable/equatable.dart';

class GetAllServicesEntity extends Equatable{
String code;
AllServicesMessageEntity message;
List<AllServicesDataEntity> data;
GetAllServicesEntity({required this.code,required this.message,required this.data});
  @override
  List<Object?> get props => [code,message,data];
}

class AllServicesMessageEntity extends Equatable{
  List <String>error;
  AllServicesMessageEntity({required this.error});

  @override
  List<Object?> get props =>[error];
}

class AllServicesDataEntity extends Equatable{
  int id;
  String name;
  AllServicesDataEntity({required this.id,required this.name});
  @override
  List<Object?> get props =>[
    id,name
  ];

}