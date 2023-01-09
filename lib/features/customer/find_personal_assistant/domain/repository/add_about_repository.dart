import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/add_about_entity.dart';

abstract class AddAboutRepository{
  Future<Result<AddAboutEntity>> addAbout({
    required String bearer_token,
    required int user_id,
    required String  about
  });
}