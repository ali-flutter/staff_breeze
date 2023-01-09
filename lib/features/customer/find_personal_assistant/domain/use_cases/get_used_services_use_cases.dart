

import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_used_services_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/repository/get_used_services_repository.dart';

import '../../../../../core/network_configration/result.dart';

@injectable
class GetUsedServicesUseCase{
  GetUsedServicesRepository getUsedServicesRepository;
  GetUsedServicesUseCase({required this.getUsedServicesRepository});
  Future<Result<GetUsedServicesEntity>>getUsedServices(){
    return getUsedServicesRepository.getUsedServices();
  }
}