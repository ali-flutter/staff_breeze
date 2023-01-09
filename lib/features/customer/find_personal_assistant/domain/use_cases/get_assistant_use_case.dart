// ignore_for_file: non_constant_identifier_names

import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_assistant_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/repository/get_assistant_repository.dart';

import '../../../../../core/network_configration/result.dart';


@injectable
class GetAssistantUseCase {
  GetAssistantRepository getAssistantRepository;
  GetAssistantUseCase({required this.getAssistantRepository});

  Future <Result<GetAssistantEntity>> call({required int page, required int pageSize,
     int? city,
     List<int>? language,
     double? rating,
     int? is_male,
     List<int>? education,
     String? search,
      List<int>?services,
    int? country,
  }) {
    return getAssistantRepository.getAssistants(
      page: page,
    pageSize: pageSize,
    city: city,
    is_male: is_male,
    education: education,
    search:search,
    rating: rating,
    language: language,
      services: services,
        country: country
   
    );
  }
}
