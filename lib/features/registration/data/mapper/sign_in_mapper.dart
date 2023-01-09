import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/registration/data/model/sign_in_model.dart';
import 'package:staff_breeze/features/registration/domain/entities/sign_in_entity.dart';

@injectable
class SignInMapper{
  SignInEntity mapper (SignInModel model){
    return SignInEntity(
      code: model.code,
      message:messageMapper( model.message),
      data: userModelToEntity(model.data)
    );
  }
  UserEntity userModelToEntity (User model){
    return UserEntity(
        id: model.id,
        cityId: model.city_id,
        countryId:model. country_id,
        name: model.name,
        email: model.email,
        complete: model.complete,
        location: model.location,
        email_verified_at:model. email_verified_at,
        role_id:model. role_id,
        isMale:model. is_male,
        about: model.about,
        phoneNumber:model. phone_number,
        profileImage:model. profile_image,
        deviceToken:model. device_token,
        token: model.token,
        );
  }
  SignInMessageEntity messageMapper(SignInMessageModel model){
    return SignInMessageEntity(error:model.error);
  }
}