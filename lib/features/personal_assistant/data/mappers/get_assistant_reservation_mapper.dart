import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/models/get_all_assistant_model.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_assistant_entity.dart';
import 'package:staff_breeze/features/personal_assistant/data/model/schedule_models/get_assistant_reservation_model.dart';
import 'package:staff_breeze/features/personal_assistant/domain/entity/schedule_entity/get_assistant_reservation_entity.dart';

import '../../../customer/data/models/get_customer_reservation_model.dart';

@injectable
class GetAssistantReservationMappers{
  GetAssistantReservationEntity mapper(GetAssistantReservationModel model){
    return GetAssistantReservationEntity(
        code: model.code,
        data: model.data.map((e) => dataMapper(e)).toList(),
        message: messageMapper(model.message));
  }
  GetAssistantReservationMessageEntity messageMapper(GetAssistantReservationMessageModel model){
    return GetAssistantReservationMessageEntity(error: model.error);
  }
  GetAssistantReservationDataEntity dataMapper(GetAssistantReservationDataModel model){
    return GetAssistantReservationDataEntity(customer: customerDataMapper(model.customer), reservation_dates:model. reservation_dates);
  }
  GetCustomerDataEntity customerDataMapper(CustomerDataModel model){
    return GetCustomerDataEntity(name : model.name,
        id:model. id,
        complete:model. complete,
        country: model.country.map((e) => countryMapper(e)).toList(),
        educations:model. educations.map((e) => educationMapper(e)).toList(),
        services: model.services.map((e) => servicesMapper(e)).toList(),
        languages:model. languages.map((e) => languagesMapper(e)).toList(),
        about:model. about,
        is_male: model.is_male,
        email:model. email,
        phoneNumber: model.phone_number,
        role: model.role.map((e) => roleMapper(e)).toList(),
        profileImage: model.profile_image,
        city:model. city.map((e) => cityMapper(e)).toList(),
        ratingAvrage:model.rating_avrage,
        email_verifie_at:model.emailVerifiedAt,);
  }
  AssistantLanguagesObjectEntity languagesMapper(LanguagesObjectModel model){
    return AssistantLanguagesObjectEntity(name: model.title, id:model. id);
  }

  AssistantServicesObjectEntity servicesMapper(ServicesObjectModel model){
    return AssistantServicesObjectEntity(name: model.title, id:model. id);
  }

  AssistantCountryObjectEntity countryMapper(CountryObjectModel model){
    return AssistantCountryObjectEntity(name: model.title, id:model. id);
  }
  AssistantCityObjectEntity   cityMapper(CityObjectModel model){
    return AssistantCityObjectEntity(id: model.id, name:model.title);
  }
  AssistantEducationObjectEntity educationMapper(EducationsObjectModel model){
    return AssistantEducationObjectEntity(name: model.title, id:model. id);
  }
  AssistantRoleObjectEntity roleMapper(RoleObjectModel modle){
    return AssistantRoleObjectEntity(id: modle.id, name: modle.title);
  }
}