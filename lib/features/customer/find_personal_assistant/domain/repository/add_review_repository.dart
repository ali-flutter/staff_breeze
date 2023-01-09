import 'package:staff_breeze/core/network_configration/result.dart';

import '../entities/add_review_entity.dart';

abstract class AddReviewRepository{
  Future <Result<AddReviewEntity>> addReview({required String bearer_token,required int assistant_id,required int rating,required String body});
}