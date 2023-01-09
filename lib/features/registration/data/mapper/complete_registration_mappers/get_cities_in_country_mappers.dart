

import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/registration/data/model/complete_registration_model/get_cities_in_country_model.dart';
import 'package:staff_breeze/features/registration/domain/entities/complete_registration_entities/get_cities_in_country.dart';
@injectable
class GetCitiesInCountryMapper{
  GetCitiesInCountry mapper(GetCitiesInCountryModel model){
    return GetCitiesInCountry(data: model.data.map((e) => dataMapper(e)).toList(),
        message: messageMapper(model.message),
        code:model.code);

  }
  GetCitiesInCountryMessageEntity messageMapper(GetCitiesInCountryMessageModel model){
    return GetCitiesInCountryMessageEntity(error: model.error);
  }
  GetCitiesInCountryDataEntity dataMapper(GetCitiesInCountryDataModel modle){
    return GetCitiesInCountryDataEntity(id: modle.id, name:modle.title);
  }
}