import 'package:equatable/equatable.dart';

class CountriesEntity extends Equatable {
  final String code;
 // final CountriesMessageEntity message;
  final List<CountriesDataEntity> data;

  const CountriesEntity(
      {required this.code, required this.data, /* required this.message */});
  @override
  List<Object?> get props => [code, /* message ,*/ data];
}

class CountriesMessageEntity extends Equatable {
  List<String> error;
  CountriesMessageEntity({required this.error});
  @override
  List<Object?> get props => [error];
}

class CountriesDataEntity extends Equatable {
  final int id;
  final String name;

  const CountriesDataEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
