
import 'package:json_annotation/json_annotation.dart';
part 'add_review_model.g.dart';
@JsonSerializable()
class AddReviewModel{
  String code;
  AddReviewMessageModel message;
  AddReviewModel({required this.code,required this.message});
  factory AddReviewModel.fromJson(Map<String,dynamic>json)=>_$AddReviewModelFromJson(json);
}
@JsonSerializable()
class AddReviewMessageModel{
  List<String>error;
  AddReviewMessageModel({required this.error});
  factory AddReviewMessageModel.fromJson(Map<String,dynamic>json)=>_$AddReviewMessageModelFromJson(json);
}