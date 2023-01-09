import 'package:staff_breeze/core/network_configration/result.dart';

import '../entities/edit_name_profile_image.dart';

abstract class EditNameProfileImageRepository{
  Future<Result<EditNameProfileImageEntity>> editNameAndProfilePicture({
  required int user_id,
    required String bearer_token,
     String? name,
     String? profile_image,

});
}