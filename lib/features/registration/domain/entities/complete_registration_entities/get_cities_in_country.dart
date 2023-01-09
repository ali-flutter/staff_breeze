import 'package:equatable/equatable.dart';

class GetCitiesInCountry extends Equatable{
  String code;
  GetCitiesInCountryMessageEntity message;
  List<GetCitiesInCountryDataEntity> data;
  GetCitiesInCountry({required this.data,required this.message,required this.code});
  @override
  List<Object?> get props =>[code,message,data] ;

}
class GetCitiesInCountryMessageEntity extends Equatable{
  List<String>error;
  GetCitiesInCountryMessageEntity({required this.error});
  @override
  List<Object?> get props => [error];

}
class GetCitiesInCountryDataEntity extends Equatable{
  int id;
  String name;
  GetCitiesInCountryDataEntity({required this.id,required this.name});
  @override
  List<Object?> get props => [name,id];

}