import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/add_about_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/add_review_entity.dart';

import '../models/add_about_model.dart';
@injectable
class AddAboutMapper{
  AddAboutEntity mapper(AddAboutModel model){
    return AddAboutEntity(code: model.code, message:messageMapper(model.message)  );
  }
  AddAboutMessageEntity messageMapper(AddAboutMessageModel model){
    return AddAboutMessageEntity(error: model.error);
  }

}