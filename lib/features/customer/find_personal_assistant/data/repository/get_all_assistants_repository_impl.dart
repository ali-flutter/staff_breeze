// ignore_for_file: non_constant_identifier_names

import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/handle_response.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/data_source/network/get_all_assistants_cleint.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/mapper/get_assistants_model_to_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/models/get_all_assistant_model.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_assistant_entity.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/repository/get_assistant_repository.dart';

@Singleton(as: GetAssistantRepository)
class GetAllAssistantsRepositoryImpl implements GetAssistantRepository {
  GetAllAssistantsRepositoryImpl({required this.client, required this.mapper});
  GetAssistantsMapper mapper;
  GetAllAssistantsClient client;
  @override
  Future<Result<GetAssistantEntity>> getAssistants(
          {required int page, required int pageSize, int? city,
     int? language,
     double? rating,
     int? is_male,
     int? education,
     String? search,}) =>
      handleResponse<GetAllAssistantsModel, GetAssistantEntity>(() {
    
        return client.getAllAssistants(page: page, pageSize: pageSize,search: search,language: language,rating: rating,ismale: is_male,education: education,city: city);
      }, (response) {
       
        GetAssistantEntity result = mapper.mapper(response);
        //print('//');
        // print(result);
        return result;
      });
}
