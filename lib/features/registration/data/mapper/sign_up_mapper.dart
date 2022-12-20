import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/registration/data/model/sign_up_model.dart';
import 'package:staff_breeze/features/registration/domain/entities/sign_up_entity.dart';
@injectable
class SignUpMapper{
  SignUpEntity mapper(SignUpModel model){
    return SignUpEntity(
      code: model.code,
      message: model.message,
      data: dataModelToEntity(model.data)
    );
  }
  DataEntity dataModelToEntity(Data model){
    return DataEntity(
      name: model.name,
       email: model.email,
        role_id:model.role_id,
         id:model. id,
          token:model. token,
          
          );
  }
}
