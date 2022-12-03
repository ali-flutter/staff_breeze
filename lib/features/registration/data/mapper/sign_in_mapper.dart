import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/registration/data/model/sign_in_model.dart';
import 'package:staff_breeze/features/registration/domain/entities/sign_in_entity.dart';

@injectable
class SignInMapper{
  SignInEntity mapper (SignInModel model){
    return SignInEntity(
      accessToken: model.accessToken,
      user: userModelToEntity(model.user)
    );
  }
  UserEntity userModelToEntity (User model){
    return UserEntity(id: model.id,
        cityId: model.cityId,
        countryId:model. countryId,
        name: model.name,
        email: model.email,
        emailVerifiedAt:model. emailVerifiedAt,
        role_id:model. role_id,
        isMale:model. isMale,
        about: model.about,
        phoneNumber:model. phoneNumber,
        profileImage:model. profileImage,
        deviceToken:model. deviceToken);
  }
}