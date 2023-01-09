import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class EditNameProfileImageEntity extends Equatable{
  String code;
  EditNameProfileImageMessageEntity message;
  EditNameProfileImageDataEntity data;
  EditNameProfileImageEntity({required this.data,required this.message,required this.code});
  @override
  List<Object?> get props => [code,message,data];

}
class EditNameProfileImageMessageEntity extends Equatable{
   List<String>error;
   EditNameProfileImageMessageEntity({required this.error});
  @override
  List<Object?> get props => [error];

}

class EditNameProfileImageDataEntity extends Equatable{
   int? id;
   String? name;
   String? about;
   String? profile_image;
   EditNameProfileImageDataEntity({
     required this.about,
     required this.id,
     required this.name,
     required this.profile_image,
});

  @override
  List<Object?> get props => [id,name,about,profile_image];

}