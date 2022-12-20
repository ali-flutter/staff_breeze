import 'package:equatable/equatable.dart';

class GetUsedLanguagesEntity extends Equatable {
 final String? code;
 final  GetUsedLanguagesEntityMessage? message;
  final List<GetUsedLanguagesDataEntity>? data;
  const GetUsedLanguagesEntity(
      {required this.code, required this.data, required this.message});
  @override
  List<Object?> get props => [code, message, data];
}

class GetUsedLanguagesEntityMessage extends Equatable {
 final List<String>? error;
  const GetUsedLanguagesEntityMessage({required this.error});
  @override
  List<Object?> get props => [error];
}

class GetUsedLanguagesDataEntity extends Equatable {
  final int? id;
 final String? name;
 const GetUsedLanguagesDataEntity({required this.id, required this.name});
  @override
  List<Object?> get props => [id, name];
}
