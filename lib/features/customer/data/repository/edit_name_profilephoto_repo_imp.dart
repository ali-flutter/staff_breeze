

import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/handle_response.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/data/data_source/network/edit_name_profilephoto_client.dart';
import 'package:staff_breeze/features/customer/data/mappers/edit_name_image_mappers.dart';
import 'package:staff_breeze/features/customer/data/models/edit_name_profile_photo_model.dart';
import 'package:staff_breeze/features/customer/domain/entities/edit_name_profile_image.dart';
import 'package:staff_breeze/features/customer/domain/repository/edit_name_profile_image_repository.dart';

@Singleton(as: EditNameProfileImageRepository)
class EditNameProfilePhotoRepoImp implements EditNameProfileImageRepository{
  EditNameProfilePhotoClient cleint;
  EditNameImageProfileMappers mappers;
  EditNameProfilePhotoRepoImp({required this.cleint,required this.mappers});
  @override
  Future<Result<EditNameProfileImageEntity>> editNameAndProfilePicture({required int user_id, required String bearer_token, String? name, String? profile_image}) =>
      handleResponse<EditNameProfilePhotoModel,EditNameProfileImageEntity>(
              () => cleint.editNameProfilePhoto(user_id: user_id, bearer_token: bearer_token,name: name,profile_photo: profile_image),
              (response) =>mappers.mapper(response));
}