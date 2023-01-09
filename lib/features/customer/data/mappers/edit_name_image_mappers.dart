import 'package:injectable/injectable.dart';

import '../../domain/entities/edit_name_profile_image.dart';
import '../models/edit_name_profile_photo_model.dart';


@injectable
class EditNameImageProfileMappers{
  EditNameProfileImageEntity mapper(EditNameProfilePhotoModel model){
    return EditNameProfileImageEntity(data: dataMapper(model.data),message: messageMapper(model.message),code: model.code);
  }
  EditNameProfileImageMessageEntity messageMapper(EditNameProfilePhotoMessageModel model){
    return EditNameProfileImageMessageEntity(error: model.error);
  }
  EditNameProfileImageDataEntity dataMapper(EditNameProfilePhotoDataModel model){
    return EditNameProfileImageDataEntity(profile_image:model.profile_image ,name:model.name ,
        about: model.about,id:model.id);
  }
}