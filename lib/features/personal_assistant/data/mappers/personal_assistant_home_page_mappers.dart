import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/personal_assistant/data/model/personal_assistant_home_page_model.dart';
import 'package:staff_breeze/features/personal_assistant/domain/entity/perosnal_assistant_home_page_entity.dart';


@injectable
class PersonalAssistantHomePageMappers {
  PersonalAssistantHomePageEntity mapper(PersonalAssistantHomePageModel model) {
    return PersonalAssistantHomePageEntity(
        code: model.code,
        data: assistantDataMapper(model.data),
     //   message: messageMapper(model.message)
        );
  }

/*   AssistantMessageEntity messageMapper(AssistantMessageModel model) {
    return AssistantMessageEntity(error: model.error);
  } */

  AssistantDataEntity assistantDataMapper(AssistantDataModel model) {
    return AssistantDataEntity(
      id: model.id,
      name: model.name,
      email: model.name,
      email_verfied_at: model.email_verfied_at,
      role: model.role.map((e) => assistantRoleMapper(e)).toList(),
      city: model.city!=null?model.city!.map((e) => assistantCityMapper(e)).toList():[],
      country:model.country!=null? model.country!.map((e) => assistantCountryMapper(e)).toList():[],
      is_male: model.is_male,
      about: model.about,
      phone_number: model.phone_number,
      profile_image: model.profile_image,
      educations:
          model.educations!=null?model.educations!.map((e) => assistantEducationMapper(e)).toList():[],
      complete: model.complete,
      rating_avrage: model.rating_avrage,
    services: model.services!=null?model.services!.map((e) => servicesMapper(e)).toList():[],
      languages:
     model.languages!=null?    model.languages!.map((e) => assistantLanguagesMapper(e)).toList():[],

    );
  }

  AssistantRoleEntity assistantRoleMapper(AssistantRoleModel model) {
    return AssistantRoleEntity(id: model.id, title: model.title);
  }

  AssistantCityEntity assistantCityMapper(AssistantCityModel model) {
    return AssistantCityEntity(id: model.id, title: model.title);
  }

  AssistantCountryEntity assistantCountryMapper(AssistantCountryModel model) {
    return AssistantCountryEntity(id: model.id, title: model.title);
  }

  AssistantLanguagesEntity assistantLanguagesMapper(
      AssistantLanguagesModel model) {
    return AssistantLanguagesEntity(id: model.id, title: model.title);
  }

  AssistantEducationEntity assistantEducationMapper(
      AssistantEducationModel model) {
    return AssistantEducationEntity(id: model.id, title: model.title);
  }
  AssistantServicesEntity servicesMapper(AssistantServicesModel model){
    return AssistantServicesEntity(id: model.id , title: model.title);
  }
}
