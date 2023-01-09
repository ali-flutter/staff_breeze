import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/registration/data/model/complete_registration_model/edit_user_details_model.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/edit_user_details_entity.dart';

@injectable
class EditUserDetailsMapper {
  EditUserDetailsEntity mapper(EditUserDetailsModel model) {
    return EditUserDetailsEntity(
        code: model.code,
        message: messageMapper(model.message),
    );
  }

  EditUserDetailsMessage messageMapper(EditUserDetailsMessageModel model) {
    return EditUserDetailsMessage(error: model.error);
  }


}
