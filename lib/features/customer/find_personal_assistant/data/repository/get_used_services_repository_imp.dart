

import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/handle_response.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/data_source/network/get_used_services_cleint.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/mapper/get_used_services_mapper.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/models/get_used_sevices_model.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_used_services_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/repository/get_used_services_repository.dart';


@Singleton(as: GetUsedServicesRepository)
class GetUsedServicesRepositoryImp implements GetUsedServicesRepository{
  GetUsedServicesCleint cleint;
  GetUsedServicesMappers mappers;
  GetUsedServicesRepositoryImp({required this.cleint,required this.mappers});
  @override
  Future<Result<GetUsedServicesEntity>> getUsedServices()=>handleResponse<GetUsedServicesModel,GetUsedServicesEntity>(
          () => cleint.getUsedServices(),
          (response) =>mappers.mapper(response) );
  
}