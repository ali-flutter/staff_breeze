import 'package:staff_breeze/features/personal_assistant/domain/entity/add_languages_entity.dart';

import '../../../../core/network_configration/result.dart';

abstract class AddLanguagesRepository{
  // ignore: non_constant_identifier_names
  Future<Result<AddLanguagesEntity>>addLanguages({required String content_type,required String bearer,required int user_id,required String language_ids});


}