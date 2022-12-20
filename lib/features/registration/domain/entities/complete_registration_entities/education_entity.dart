import 'package:equatable/equatable.dart';

class EducationsEntity extends Equatable {
  final String code;
  //final EducationMessageEntity message;
  final List<EducationDataEntity> data;

  const EducationsEntity(
      {required this.code, required this.data/* , required this.message */});
  @override
  List<Object?> get props => [code,/*  message, */ data];
}

class EducationMessageEntity extends Equatable {
  List<String> error;
  EducationMessageEntity({required this.error});
  @override
  List<Object?> get props => [error];
}

class EducationDataEntity extends Equatable {
  final int id;
  final String title;

  const EducationDataEntity({required this.id, required this.title});

  @override
  List<Object?> get props => [id, title];
}
