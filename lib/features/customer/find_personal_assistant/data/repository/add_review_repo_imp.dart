import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/handle_response.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/add_review_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/repository/add_review_repository.dart';

import '../data_source/network/add_review_client.dart';
import '../mapper/add_review_mapper.dart';
import '../models/add_review_model.dart';
@Singleton(as:AddReviewRepository )
class AddReviewRepoImp implements AddReviewRepository{
  AddReviewRepoImp({required this.mapper,required this.cleint});
  AddReviewClient cleint;
  AddReviewMapper mapper;
  @override
  Future<Result<AddReviewEntity>> addReview({required String bearer_token, required int assistant_id, required int rating, required String body}) =>
      handleResponse<AddReviewModel,AddReviewEntity>(
              () =>cleint.addReview(bearer_token: bearer_token, assistant_id: assistant_id, rating: rating, body: body),
              (response) => mapper.mapper(response ));

}