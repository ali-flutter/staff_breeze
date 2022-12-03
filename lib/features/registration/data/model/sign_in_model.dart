import 'package:json_annotation/json_annotation.dart';
part 'sign_in_model.g.dart';

@JsonSerializable()
class SignInModel {
  SignInModel({required this.user,required this.accessToken});
  User user;
  String? accessToken;
  factory SignInModel.fromJson(Map<String, dynamic> json) => _$SignInModelFromJson(json);
}

@JsonSerializable()
class User{
  int? id;
  int? cityId;
  int? countryId;
  String? name;
  String? email;
  String? emailVerifiedAt;
  int? role_id;
  int? isMale;
  String? about;
  String? phoneNumber;
  String? profileImage;
  String? deviceToken;
  User({
    required this.id,
    required this.cityId,
    required this.countryId,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
  required this.role_id,
    required this.isMale,
    required this.about,
    required this.phoneNumber,
    required this.profileImage,
    required this.deviceToken});
  factory User.fromJson(Map<String,dynamic>json)=>_$UserFromJson(json);
}