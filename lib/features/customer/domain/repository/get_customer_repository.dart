import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/domain/entities/get_customer_entity.dart';

abstract class GetCustomerRepository{

  Future<Result<GetCustomerInfoEntity>>getCustomerInfo({required int user_id});

}