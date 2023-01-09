import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/models/add_review_model.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/add_review_entity.dart';

@injectable
class AddReviewMapper{
  AddReviewEntity mapper(AddReviewModel model){
    return AddReviewEntity(message:messageMapper( model.message), code: model.code );

  }
  AddReviewMessageEntity messageMapper(AddReviewMessageModel model){
    return AddReviewMessageEntity(error: model.error);
  }
}