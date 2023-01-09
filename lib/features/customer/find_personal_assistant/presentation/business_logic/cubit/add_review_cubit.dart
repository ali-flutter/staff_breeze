import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/add_review_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/use_cases/add_review_use_case.dart';
@injectable
class AddReviewCubit extends Cubit<Result<AddReviewEntity>>{
  AddReviewCubit({required this.useCase}):super(Result.initial());
  AddReviewUseCase useCase;
  Future addReview({required String bearer_token,required int assistant_id,required int rating,required String body})async{
    emit(Result.loading());
    final result =await useCase.addReview(bearer_token: bearer_token, assistant_id: assistant_id, rating: rating, body: body);
    emit(result);
  }
}