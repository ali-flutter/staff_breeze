

import 'package:json_annotation/json_annotation.dart';
part 'add_languages_model.g.dart';
@JsonSerializable()
class AddLanguagesModel {
  String code;
  AddLanguageMessagesModel message;
   AddLanguagesModel({required this.message,required this.code});
   factory AddLanguagesModel.fromJson(Map<String ,dynamic>json)=>_$AddLanguagesModelFromJson(json);

}
@JsonSerializable()
class AddLanguageMessagesModel{
  List<String> error;
  AddLanguageMessagesModel({required this.error});
  factory AddLanguageMessagesModel.fromJson(Map<String,dynamic>json)=>_$AddLanguageMessagesModelFromJson(json);
}

