
import 'package:json_annotation/json_annotation.dart';
part 'languages_model.g.dart';
@JsonSerializable()
class AllLanguagesModel {
  String code;
 // LanguagesMessageModel message;
  List<LanguagesDataModel> data;
  AllLanguagesModel(
      {required this.code, required this.data,/*  required this.message */});
  factory AllLanguagesModel.fromJson(Map<String, dynamic> json) =>
      _$AllLanguagesModelFromJson(json);
}

@JsonSerializable()
class LanguagesMessageModel {
  List<String> errors;
  LanguagesMessageModel({required this.errors});
  factory LanguagesMessageModel.fromJson(Map<String, dynamic> json) =>
      _$LanguagesMessageModelFromJson(json);
}

@JsonSerializable()
class LanguagesDataModel {
  int id;
  String name;
  LanguagesDataModel({required this.id,required this.name});
  factory LanguagesDataModel.fromJson(Map<String, dynamic> json) =>
      _$LanguagesDataModelFromJson(json);
}
