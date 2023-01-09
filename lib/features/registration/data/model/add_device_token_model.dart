

import 'package:json_annotation/json_annotation.dart';
part 'add_device_token_model.g.dart';
@JsonSerializable()
class AddDeviceTokenModel{
  int code;
  String message;
  int data;
  AddDeviceTokenModel({required this.code,required this.message,required this.data});
  factory AddDeviceTokenModel.fromJson(Map<String,dynamic>json)=>_$AddDeviceTokenModelFromJson(json);
}