
import 'package:json_annotation/json_annotation.dart';
part 'get_used_sevices_model.g.dart';
@JsonSerializable()
class GetUsedServicesModel {
  String code;
  GetUsedServicesMessageModel message;
  List<GetUsedServicesDataModel> data;
  GetUsedServicesModel({required this.code,required this.message,required this.data});
  factory GetUsedServicesModel.fromJson(Map<String ,dynamic >json)=>_$GetUsedServicesModelFromJson(json);
}
@JsonSerializable()
class GetUsedServicesMessageModel{
  List<String>error;
GetUsedServicesMessageModel({required this.error});
factory GetUsedServicesMessageModel.fromJson(Map<String,dynamic>json)=>_$GetUsedServicesMessageModelFromJson(json);
}

@JsonSerializable()
class GetUsedServicesDataModel{
  int id;
  String title;
  GetUsedServicesDataModel({required this.id,required this.title});
  factory GetUsedServicesDataModel.fromJson(Map<String,dynamic>json)=>_$GetUsedServicesDataModelFromJson(json);

}