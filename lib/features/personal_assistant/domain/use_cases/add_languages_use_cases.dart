import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/personal_assistant/domain/entity/add_languages_entity.dart';
import 'package:staff_breeze/features/personal_assistant/domain/repository/add_languages_repo.dart';

import '../../../../core/network_configration/result.dart';

@injectable
class AddLanguagesUseCases{
  AddLanguagesRepository addLanguagesRepository;
  AddLanguagesUseCases({required this.addLanguagesRepository});
  Future<Result<AddLanguagesEntity>>addLanguages({required String content_type,required String bearer,required int user_id,required String language_ids}){
        return addLanguagesRepository.addLanguages(content_type: content_type,bearer: bearer,user_id: user_id, language_ids: language_ids);
  }
}