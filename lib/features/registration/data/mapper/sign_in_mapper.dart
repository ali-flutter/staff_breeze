import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/registration/data/model/sign_in_model.dart';
import 'package:staff_breeze/features/registration/domain/entities/sign_in_entity.dart';

@injectable
class SignInMapper{
  SignInEntity mapper (SignInModel model){
    return SignInEntity(
      code: model.code,
      message: model.message,
      data: userModelToEntity(model.data)
    );
  }
  UserEntity userModelToEntity (User model){
    return UserEntity(id: model.id,
        cityId: model.cityId,
        countryId:model. countryId,
        name: model.name,
        email: model.email,
        complete: model.complete,
        location: model.location,
        email_verified_at:model. email_verified_at,
        role_id:model. role_id,
        isMale:model. isMale,
        about: model.about,
        phoneNumber:model. phoneNumber,
        profileImage:model. profileImage,
        deviceToken:model. deviceToken,
        accessToken: model.accessToken,
        );
  }
}