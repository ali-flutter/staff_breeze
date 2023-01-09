
import 'package:json_annotation/json_annotation.dart';
part 'remove_devie_token_model.g.dart';
@JsonSerializable(createToJson: false)
class RemoveDeviceTokenModel{
  String code;
  String message;
  RemoveDeviceTokenModel({required this.message,required this.code});
  factory RemoveDeviceTokenModel.fromJson(Map<String,dynamic>json)=>_$RemoveDeviceTokenModelFromJson(json);
}