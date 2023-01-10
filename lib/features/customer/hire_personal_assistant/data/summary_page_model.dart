
import 'package:json_annotation/json_annotation.dart';
part 'summary_page_model.g.dart';
@JsonSerializable()
class SummaryPageModel{
  String code;
  SummaryPageDataModel data;
  SummaryPageModel({required this.data,required this.code});
  factory SummaryPageModel.fromJson(Map<String,dynamic>json)=>_$SummaryPageModelFromJson(json);
}

@JsonSerializable()
class SummaryPageDataModel{
  int? total_payment;
  String? starts_at;
  String? ends_at;
  SummaryPageDataModel({required this.total_payment,required this.starts_at,required this.ends_at});
  factory SummaryPageDataModel.fromJson(Map<String,dynamic>json)=>_$SummaryPageDataModelFromJson(json);
}