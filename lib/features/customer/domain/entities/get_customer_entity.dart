

import 'package:equatable/equatable.dart';

class GetCustomerInfoEntity extends Equatable{
  String code;
  CustomerInfoMessageEntity message;
  CustomerInfoData data;
  GetCustomerInfoEntity({required this.data,required this.message,required this.code});

  @override
  List<Object?> get props => [code,message,data];

}
class CustomerInfoMessageEntity extends Equatable{
   List<String>error;
   CustomerInfoMessageEntity({required this.error});
  @override
  List<Object?> get props => [error];

}

class CustomerInfoData extends Equatable{
  int? id;
  String? name;
  String? about;
  String? profileImage;
  CustomerInfoData({required this.id,required this.profileImage,required this.name,required this.about});
  @override
  List<Object?> get props => [id,profileImage,name,about];

}