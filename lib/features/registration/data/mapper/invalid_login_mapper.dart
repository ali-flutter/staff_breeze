import 'package:staff_breeze/features/registration/data/model/invalid_login_model.dart';
import 'package:staff_breeze/features/registration/domain/entities/invalid_login_entity.dart';

class InvalidLoginMapper {
  InvalidLoginEntity mapper(InvalidLoginModel model) {
    return InvalidLoginEntity(
        code: model.code, message: model.message, data: dataMapper(model.data));
  }

  InvalidLoginDataEntity dataMapper(InvalidLoginData ?data) {
    return InvalidLoginDataEntity(

    );
  }
}
