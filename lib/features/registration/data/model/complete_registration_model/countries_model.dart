
import 'package:json_annotation/json_annotation.dart';
part 'countries_model.g.dart';
@JsonSerializable()
class CountriesModel {
  String code;
  //CountriesMessageModel message;
  List<CountriesDataModel> data;
  CountriesModel(
      {required this.code, required this.data/* , required this.message */});
  factory CountriesModel.fromJson(Map<String, dynamic> json) =>
      _$CountriesModelFromJson(json);
}

@JsonSerializable()
class CountriesMessageModel {
  List<String> errors;
  CountriesMessageModel({required this.errors});
  factory CountriesMessageModel.fromJson(Map<String, dynamic> json) =>
      _$CountriesMessageModelFromJson(json);
}

@JsonSerializable()
class CountriesDataModel {
  int id;
  String name;
  CountriesDataModel({required this.id,required this.name});
  factory CountriesDataModel.fromJson(Map<String, dynamic> json) =>
      _$CountriesDataModelFromJson(json);
}
