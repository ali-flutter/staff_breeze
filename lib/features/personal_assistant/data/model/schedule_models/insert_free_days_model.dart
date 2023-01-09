import 'package:json_annotation/json_annotation.dart';
part 'insert_free_days_model.g.dart';
@JsonSerializable()
class InsertFreeDaysModel{
  String code;
  InsertFreeDaysMessageModel message;
  InsertFreeDaysModel({required this.code,required this.message});
  factory InsertFreeDaysModel.fromJson(Map<String,dynamic>json)=>_$InsertFreeDaysModelFromJson(json);
  
}
@JsonSerializable()
class InsertFreeDaysMessageModel{
  List<String>error;
  InsertFreeDaysMessageModel({required this.error});
  factory InsertFreeDaysMessageModel.fromJson(Map<String,dynamic>json)=>_$InsertFreeDaysMessageModelFromJson(json);
}