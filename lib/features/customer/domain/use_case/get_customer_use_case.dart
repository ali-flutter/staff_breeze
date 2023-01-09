

import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/domain/entities/get_customer_entity.dart';

import '../repository/get_customer_repository.dart';
@injectable
class GetCustomerUseCase{
  GetCustomerRepository getCustomerRepository;
  GetCustomerUseCase({required this.getCustomerRepository});

  Future<Result<GetCustomerInfoEntity>>getCustomerInfo({required int user_id}){
    return getCustomerRepository.getCustomerInfo(user_id: user_id);
  }
}