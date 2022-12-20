import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_reviews_entity.dart';

abstract class GetReviewsRepository {
  Future<Result<GetReviewsEntity>> getReviews({required int assistantId});
}
