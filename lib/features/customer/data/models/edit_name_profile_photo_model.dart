import 'package:freezed_annotation/freezed_annotation.dart';
part'edit_name_profile_photo_model.g.dart';

@JsonSerializable()
class EditNameProfilePhotoModel{
String code;
EditNameProfilePhotoMessageModel message;
EditNameProfilePhotoDataModel data;
EditNameProfilePhotoModel({required this.code,required this.message,required this.data });
factory EditNameProfilePhotoModel.fromJson(Map<String,dynamic>json)=>_$EditNameProfilePhotoModelFromJson(json);
}


@JsonSerializable()
class EditNameProfilePhotoMessageModel{
  List<String>error;
  EditNameProfilePhotoMessageModel({required this.error});
  factory EditNameProfilePhotoMessageModel.fromJson(Map<String,dynamic>json)=>_$EditNameProfilePhotoMessageModelFromJson(json);

}

@JsonSerializable()
class EditNameProfilePhotoDataModel{
  int? id;
  String? name;
  String? about;
  String? profile_image;
  EditNameProfilePhotoDataModel({required this.profile_image,required this.name,required this.id,required this.about});
  factory EditNameProfilePhotoDataModel.fromJson(Map<String,dynamic>json)=>_$EditNameProfilePhotoDataModelFromJson(json);

}