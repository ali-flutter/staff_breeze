


// ignore_for_file: non_constant_identifier_names


import 'package:json_annotation/json_annotation.dart';
part'get_free_days_model.g.dart';

@JsonSerializable()
class GetFreeDaysModel{
 final  String code;
  final GetFreeDaysMessageModel message;
  final GetFreeDaysDataModel data;

  GetFreeDaysModel({required this.code,required this.data,required this.message});
  
  factory GetFreeDaysModel.fromJson(Map<String,dynamic>json)=>_$GetFreeDaysModelFromJson(json);
  
}

@JsonSerializable()
class GetFreeDaysMessageModel{
  List<String>error;
  GetFreeDaysMessageModel({required this.error});
  factory GetFreeDaysMessageModel.fromJson(Map<String,dynamic>json)=>_$GetFreeDaysMessageModelFromJson(json);
}

@JsonSerializable()
class GetFreeDaysDataModel{
  List <String>?first_month_dates;
  List <String>? second_month_dates;
  GetFreeDaysDataModel({required this.first_month_dates,required this.second_month_dates});
  factory GetFreeDaysDataModel.fromJson(Map<String,dynamic>json)=>_$GetFreeDaysDataModelFromJson(json);
}