import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/customer/data/models/get_customer_info_models.dart';
import 'package:staff_breeze/features/customer/domain/entities/get_customer_entity.dart';

@injectable
class GetCustomerInfoMapper{
  GetCustomerInfoEntity mapper(GetCustomerInfoModel model){
    return GetCustomerInfoEntity(data: dataMapper(model.data), message:messageMapper(model.message), code:model.code);
  }
  CustomerInfoMessageEntity messageMapper(GetCustomerInfoMessageModel model){
    return CustomerInfoMessageEntity(error: model.error );
  }
  CustomerInfoData dataMapper(GetCustomerInfoDataModel model){
    return CustomerInfoData(id: model.id, profileImage:model.profile_image, name:model. name, about:model. about);
  }
}