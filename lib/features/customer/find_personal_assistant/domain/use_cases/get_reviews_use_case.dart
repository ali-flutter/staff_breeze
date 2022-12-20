import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_reviews_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/repository/get_reviews_repository.dart';

import '../../../../../core/network_configration/result.dart';

@injectable
class GetReviewsUseCase {
  GetReviewsUseCase({required this.getReviewsRepository});

  final GetReviewsRepository getReviewsRepository;

  Future<Result<GetReviewsEntity>> call({required int assistantId}) {
    return getReviewsRepository.getReviews(assistantId: assistantId);
  }
}
