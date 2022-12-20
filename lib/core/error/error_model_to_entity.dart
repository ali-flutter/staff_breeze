import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/error/error_entity.dart';
import 'package:staff_breeze/core/error/error_model.dart';
@injectable
class ErrorMapper {
  ErrorEntity mapper(ErrorModel model) {
    return ErrorEntity(code: model.code, message: model.message);
  }
}
