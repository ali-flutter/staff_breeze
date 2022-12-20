import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/models/get_all_assistant_model.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_assistant_entity.dart';

@injectable
class GetAssistantsMapper {
  GetAssistantEntity mapper(GetAllAssistantsModel model) {
    return GetAssistantEntity(
        code: model.code,
        // message: messageMapper(model.message!),
        data: model.data!.map((e) => dataMapper(e)).toList());
  }

  MessageEntity messageMapper(Message messageModel) {
    return MessageEntity(scalar: messageModel.scalar);
  }

  AssistantsDataEntity dataMapper(DataModel model) {
    return AssistantsDataEntity(
        email: model.email,
        email_verified_at: model.email_verified_at,
        id: model.id,
        name: model.name,
        city: model.city!.map((e) {
            return cityMapper(e);
        }).toList(),
        country: model.country!.map((e) => countryMapper(e)).toList(),
        about: model.about,
        complete: model.complete,
        education: model.educations!.map((e) => educationMapper(e)).toList(),
        isMale: model.isMale,
        languages: model.languages!.map((e) => languageMapper(e)).toList(),
        phone_number: model.phone_number,
        profile_image: model.profile_image,
        rating_avrage: model.rating_avrage);
  }

  CityObjectEntity cityMapper(City city) {
    return CityObjectEntity(id:city.id,title: city.title);
  }

  CountryObjectEntity countryMapper(Country country) {
    return CountryObjectEntity(id: country.id, title: country.title);
  }
    EducationEntity educationMapper(EducationModel model) {
    return EducationEntity(id: model.id, title: model.title);
  }
   LanguageEntity languageMapper(LanguagesModel model) {
    return LanguageEntity(id: model.id, title: model.title);
  }
}
