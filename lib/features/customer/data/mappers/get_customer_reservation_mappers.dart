import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/customer/data/models/get_customer_reservation_model.dart';
import 'package:staff_breeze/features/customer/domain/entities/get_customer_reservation_entity.dart';


@injectable
class GetCustomerReservationMappers{
  GetCustomerReservationEntity mapper(GetCustomerReservationModel model){
    return GetCustomerReservationEntity(code: model.code, message:messageMapper(model.message),
        data:model. data.map((e) => dataMapper(e)).toList());
  }
  GetCustomerReservationMessageEntity messageMapper(GetCustomerReservationMessageModel model){
    return GetCustomerReservationMessageEntity(error: model.error);
  }
  GetCustomerReservationDataEntity dataMapper(GetCustomerReservationDataModel model){
    return GetCustomerReservationDataEntity(assistant:assistantMapper(model.assistant) /*model.assistant.map((e) => assistantMapper(e)).toList()*/,
        reservation_dates: model.reservation_dates);
  }
  AssistantObjectEntity assistantMapper(AssistantObjectModel model){
    return AssistantObjectEntity(name: model.name,
        id: model.id ,
        email:model.email,
        email_verified_at:model. email_verified_at, role: model.role.map((e) => roleMapper(e)).toList(),
        city: model.city.map((e) => cityMapper(e)).toList(),
        country: model.country.map((e) => countryMapper(e)).toList(),
        is_male:model. is_male,
        about: model.about, profile_image:model. profile_image,
        phone_number:model. phone_number, rating_avrage:model. rating_avrage,
        services: model.services.map((e) => servicesMapper(e)).toList(),
        languages: model.languages.map((e) => languagesMapper(e)).toList(),
        complete:model. complete,
        educations: model.educations.map((e) => educationMapper(e)).toList());
  }
  LanguagesObjectEntity languagesMapper(LanguagesObjectModel model){
    return LanguagesObjectEntity(name: model.title, id:model. id);
  }
  ServicesObjectEntity servicesMapper(ServicesObjectModel model){
    return ServicesObjectEntity(name: model.title, id:model. id);
  }
  CountryObjectEntity countryMapper(CountryObjectModel model){
    return CountryObjectEntity(name: model.title, id:model. id);
  }
  CityObjectEntity cityMapper(CityObjectModel model){
    return CityObjectEntity(name: model.title, id:model. id);
  }
  EducationObjectEntity educationMapper(EducationsObjectModel model){
    return EducationObjectEntity(name: model.title, id:model. id);
  }
  RoleObjectEntity roleMapper(RoleObjectModel modle){
    return RoleObjectEntity(id: modle.id,name: modle.title);
  }
}