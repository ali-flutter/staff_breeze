
import 'package:json_annotation/json_annotation.dart';
part 'get_all_services_model.g.dart';

@JsonSerializable()
class GetAllServicesModel {
  String code;
  GetAllServicesMessageModel message;
  List<GetAllServicesDataModel> data;
  GetAllServicesModel({required this.code,required this.message,required this.data});
 factory GetAllServicesModel.fromJson(Map<String,dynamic>json)=>_$GetAllServicesModelFromJson(json);
}

@JsonSerializable()
class GetAllServicesMessageModel{
  List<String>error;
  GetAllServicesMessageModel({required this.error});
  factory GetAllServicesMessageModel.fromJson(Map<String,dynamic>json)=>_$GetAllServicesMessageModelFromJson(json);
}

@JsonSerializable()
class GetAllServicesDataModel {
  int id;
  String title;
  GetAllServicesDataModel({required this.id,required this.title});
  factory GetAllServicesDataModel.fromJson(Map<String,dynamic>json)=>_$GetAllServicesDataModelFromJson(json);
}