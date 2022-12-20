import 'package:equatable/equatable.dart';

class AllLanguagesEntity extends Equatable {
  final String code;
 // final LanguagesMessageEntity message;
  final List<LanguagesDataEntity> data;

  const AllLanguagesEntity(
      {required this.code, required this.data, /* required this.message */});
  @override
  List<Object?> get props => [code,/*  message */ data];
}

class LanguagesMessageEntity extends Equatable {
  List<String> error;
  LanguagesMessageEntity({required this.error});
  @override
  List<Object?> get props => [error];
}

class LanguagesDataEntity extends Equatable {
  final int id;
  final String name;

  const LanguagesDataEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
