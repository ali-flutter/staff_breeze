import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/models/get_reviews_model.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_reviews_entity.dart';

@injectable
class GetReviewsMapper {
  GetReviewsEntity reviewsMapper(GetReviewsModel model) {
    return GetReviewsEntity(
        code: model.code,
        message: messageMapper(model.message),
        data: model.data.map((e) => dataMapper(e)).toList());
  }

  MessageReviewsEntity messageMapper(MessageReviewsModel? model) {
    return MessageReviewsEntity(error: model!.error);
  }

  DataReviewsEntity dataMapper(DataReviewsModel model) {
    return DataReviewsEntity(
        id: model.id,
        clientId: model.client_id,
        clientName: model.client_name,
        clientProfileImage: model.client_profile_image,
        body: model.body,
        isRead: model.is_read??0,
        accepted: model.accepted??0,
        createdAt: model.created_at??'Unknown time'
        );
  }
}
