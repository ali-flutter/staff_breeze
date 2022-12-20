
import 'package:json_annotation/json_annotation.dart';
part 'education_model.g.dart';
@JsonSerializable()
class EducationsModel {
  String code;
 // EducationMessageModel message;
  List<EducationDataModel> data;
  EducationsModel(
      {required this.code, required this.data,/*  required this.message */});
  factory EducationsModel.fromJson(Map<String, dynamic> json) =>
      _$EducationsModelFromJson(json);
}

@JsonSerializable()
class EducationMessageModel {
  List<String> errors;
  EducationMessageModel({required this.errors});
  factory EducationMessageModel.fromJson(Map<String, dynamic> json) =>
      _$EducationMessageModelFromJson(json);
}

@JsonSerializable()
class EducationDataModel {
  int id;
  String title;
  EducationDataModel({required this.id,required this.title});
  factory EducationDataModel.fromJson(Map<String, dynamic> json) =>
      _$EducationDataModelFromJson(json);
}
