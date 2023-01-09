import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_used_services_entity.dart';

import '../../../../../core/network_configration/result.dart';

abstract class GetUsedServicesRepository{
  Future<Result<GetUsedServicesEntity>>getUsedServices();
}