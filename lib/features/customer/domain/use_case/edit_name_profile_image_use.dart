

import 'package:injectable/injectable.dart';

import '../../../../core/network_configration/result.dart';
import '../entities/edit_name_profile_image.dart';
import '../repository/edit_name_profile_image_repository.dart';


@injectable
class EditNameProfileImageUseCase{
  EditNameProfileImageUseCase({required this.repository});
 EditNameProfileImageRepository repository;

 Future <Result<EditNameProfileImageEntity>>editNameProfilePhoto({
  String? name,
   String? profile_image,
  required String bearer_token,
  required int user_id,

 }){
   return repository.editNameAndProfilePicture(user_id: user_id, bearer_token: bearer_token,name:name,profile_image: profile_image);
 }
}