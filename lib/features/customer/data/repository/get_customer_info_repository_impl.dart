import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/handle_response.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/data/models/get_customer_info_models.dart';
import 'package:staff_breeze/features/customer/domain/entities/get_customer_entity.dart';
import 'package:staff_breeze/features/customer/domain/repository/get_customer_repository.dart';

import '../data_source/network/get_customer_info_cleint.dart';
import '../mappers/get_customer_info_mappers.dart';

@Singleton(as: GetCustomerRepository)
class GetCustomerInfoRepositoryImp implements GetCustomerRepository {
  GetCustomerClient client;
  GetCustomerInfoMapper mapper;

  GetCustomerInfoRepositoryImp({required this.client, required this.mapper});

  @override
  Future<Result<GetCustomerInfoEntity>> getCustomerInfo(
          {required int user_id}) =>
      handleResponse<GetCustomerInfoModel, GetCustomerInfoEntity>(
        () => client.getCustomerInfo(user_id: user_id),
        (response) => mapper.mapper(response),
      );
}
