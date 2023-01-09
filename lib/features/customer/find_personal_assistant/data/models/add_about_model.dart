

import 'package:json_annotation/json_annotation.dart';
part 'add_about_model.g.dart';
@JsonSerializable()
class AddAboutModel{
  String code;
  AddAboutMessageModel message;
  AddAboutModel({required this.message,required this.code});
  factory AddAboutModel.fromJson(Map<String,dynamic>json)=>_$AddAboutModelFromJson(json);
}
@JsonSerializable()
class AddAboutMessageModel{
  List<String>error;
  AddAboutMessageModel({required this.error});
  factory AddAboutMessageModel.fromJson(Map<String,dynamic>json)=>_$AddAboutMessageModelFromJson(json);
}