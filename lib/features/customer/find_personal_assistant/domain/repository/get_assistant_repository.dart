// ignore_for_file: non_constant_identifier_names

import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_assistant_entity.dart';

abstract class GetAssistantRepository {
  Future<Result<GetAssistantEntity>> getAssistants({
    required int page,
    required int pageSize,
     int?  city,
     int? language,
     double? rating,
     int? is_male,
     int? education,
     String? search,
  });
}
