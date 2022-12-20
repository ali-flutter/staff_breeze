import 'package:json_annotation/json_annotation.dart';
part 'get_used_languages_model.g.dart';
@JsonSerializable()
class GetUsedLanguagesModel {
  String? code;
  GetUsedLanguagesMessageModel? message;
  List<GetUsedLanguagesDataModel>? data;
  GetUsedLanguagesModel(
      {required this.code, required this.data, required this.message});
  factory GetUsedLanguagesModel.fromJson(Map<String, dynamic> json) =>
      _$GetUsedLanguagesModelFromJson(json);
}

@JsonSerializable()
class GetUsedLanguagesMessageModel {
  List<String>? error;

  GetUsedLanguagesMessageModel({this.error});
  factory GetUsedLanguagesMessageModel.fromJson(Map<String, dynamic> json) =>
      _$GetUsedLanguagesMessageModelFromJson(json);
}

@JsonSerializable()
class GetUsedLanguagesDataModel {
  int? id;
  String? name;

  GetUsedLanguagesDataModel({this.id, this.name});
  factory GetUsedLanguagesDataModel.fromJson(Map<String, dynamic> json) =>
      _$GetUsedLanguagesDataModelFromJson(json);
}
