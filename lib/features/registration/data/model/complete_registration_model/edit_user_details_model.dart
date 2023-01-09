import 'package:json_annotation/json_annotation.dart';
part 'edit_user_details_model.g.dart';
@JsonSerializable(createToJson: false)
class EditUserDetailsModel {
  final String code;
  final EditUserDetailsMessageModel message;


  EditUserDetailsModel(
      {required this.code, required this.message});
  factory EditUserDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$EditUserDetailsModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class EditUserDetailsMessageModel {
  List<String> error;
  EditUserDetailsMessageModel({required this.error});
  factory EditUserDetailsMessageModel.fromJson(Map<String, dynamic> json) =>
      _$EditUserDetailsMessageModelFromJson(json);
}

/*@JsonSerializable(createToJson: false)
class EditUserDetailsDataModel {

  EditUserDetailsDataModel();
  factory EditUserDetailsDataModel.fromJson(Map<String, dynamic> json) =>
      _$EditUserDetailsDataModelFromJson(json);
}*/
