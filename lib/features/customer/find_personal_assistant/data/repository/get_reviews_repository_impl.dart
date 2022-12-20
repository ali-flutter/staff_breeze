import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/handle_response.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/data_source/network/get_reviews_client.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/mapper/get_reviews_mapper.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/models/get_reviews_model.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_reviews_entity.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/repository/get_reviews_repository.dart';

@Singleton(as: GetReviewsRepository)
class GetReviewsRepositoryImp implements GetReviewsRepository {
  GetReviewsCleint cleint;
  GetReviewsMapper mapper;
  GetReviewsRepositoryImp({required this.cleint, required this.mapper});
  @override
  Future<Result<GetReviewsEntity>> getReviews({required int assistantId}) =>
      handleResponse<GetReviewsModel, GetReviewsEntity>(
        () => cleint.getReviews(assistantId: assistantId),
        (response) => mapper.reviewsMapper(response),
      );
}
