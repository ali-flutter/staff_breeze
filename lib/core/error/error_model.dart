import 'package:json_annotation/json_annotation.dart';
part 'error_model.g.dart';

@JsonSerializable(createToJson: false)
class ErrorModel {
  String code;
  String message;
  ErrorModel({required this.code, required this.message});
  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);
}
