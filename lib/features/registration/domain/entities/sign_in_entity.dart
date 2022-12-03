import 'package:equatable/equatable.dart';

class SignInEntity extends Equatable{
  UserEntity user;
  String? accessToken;
  SignInEntity({required this.user,required this.accessToken});
  @override
  List<Object?> get props => [];
}
class UserEntity extends Equatable{
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
  UserEntity({
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
  @override
  List<Object?> get props => [id,cityId,countryId,name,email,emailVerifiedAt,role_id, isMale,about,phoneNumber,profileImage,deviceToken];

}