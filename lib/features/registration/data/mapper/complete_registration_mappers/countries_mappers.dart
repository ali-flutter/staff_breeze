



import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/registration/data/model/complete_registration_model/countries_model.dart';
import 'package:staff_breeze/features/registration/domain/entities/countries_entity.dart';

@injectable
class CountriesMapper {
  CountriesEntity mapper(CountriesModel model) {
    return CountriesEntity(
        code: model.code,
        data: model.data.map((e) => countriesDataMapper(e)).toList(),
        //message: messagesMappers(model.message)
        );
  }

  CountriesDataEntity countriesDataMapper(CountriesDataModel dataModel) {
    return CountriesDataEntity(id: dataModel.id, name: dataModel.name);
  }

  CountriesMessageEntity messagesMappers(
      CountriesMessageModel messageModel) {
    return CountriesMessageEntity(error: messageModel.errors);
  }
}