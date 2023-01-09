


import 'package:json_annotation/json_annotation.dart';

part 'get_customer_info_models.g.dart';

@JsonSerializable()
class GetCustomerInfoModel{
  String code;
  GetCustomerInfoMessageModel message;
  GetCustomerInfoDataModel data;
  GetCustomerInfoModel({required this.code,required this.message,required this.data});
  factory  GetCustomerInfoModel.fromJson(Map<String,dynamic>json)=>_$GetCustomerInfoModelFromJson(json);
}

@JsonSerializable()
class GetCustomerInfoMessageModel{
List<String>error;
GetCustomerInfoMessageModel({required this.error});
factory GetCustomerInfoMessageModel.fromJson(Map<String,dynamic>json)=>_$GetCustomerInfoMessageModelFromJson(json);
}

@JsonSerializable()
class GetCustomerInfoDataModel{
  int? id;
  String? name;
  String? about;
  String? profile_image;
  GetCustomerInfoDataModel({required this.about,required this.name,required this.profile_image,required this.id});
  factory GetCustomerInfoDataModel.fromJson(Map<String,dynamic>json)=>_$GetCustomerInfoDataModelFromJson(json);

}