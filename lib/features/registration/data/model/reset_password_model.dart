
import 'package:json_annotation/json_annotation.dart';
part 'reset_password_model.g.dart';
@JsonSerializable()
class ResetPasswordModel{
  String message;
  ResetPasswordModel({required this.message});
  factory ResetPasswordModel.fromJson(Map<String,dynamic>json)=>_$ResetPasswordModelFromJson(json);
}