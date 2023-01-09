import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/add_review_entity.dart';

import '../repository/add_review_repository.dart';

@injectable
class AddReviewUseCase{
  AddReviewUseCase({required this.repository});
AddReviewRepository repository;
Future<Result<AddReviewEntity>>addReview({required String bearer_token,required int assistant_id,required int rating,required String body}){
  return repository.addReview(bearer_token: bearer_token, assistant_id: assistant_id, rating: rating, body: body);
}
}