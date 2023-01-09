import 'package:json_annotation/json_annotation.dart';
part 'get_cities_in_country_model.g.dart';
@JsonSerializable()
class GetCitiesInCountryModel{
  String code;
  GetCitiesInCountryMessageModel message;
  List<GetCitiesInCountryDataModel>data;
  GetCitiesInCountryModel({required this.code,required this.message,required this.data});
  factory GetCitiesInCountryModel.fromJson(Map<String,dynamic>json)=>_$GetCitiesInCountryModelFromJson(json);
}
@JsonSerializable()
class GetCitiesInCountryMessageModel{
  List<String>error;
  GetCitiesInCountryMessageModel({required this.error});
  factory GetCitiesInCountryMessageModel.fromJson(Map<String,dynamic>json)=>_$GetCitiesInCountryMessageModelFromJson(json);
}
@JsonSerializable()
class GetCitiesInCountryDataModel{
  int id;
  String title;
  GetCitiesInCountryDataModel({required this.title,required this.id});
  factory GetCitiesInCountryDataModel.fromJson(Map<String,dynamic>json)=>_$GetCitiesInCountryDataModelFromJson(json);
}