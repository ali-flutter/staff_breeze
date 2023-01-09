import 'package:equatable/equatable.dart';

class AddReviewEntity extends Equatable{
  String code;
  AddReviewMessageEntity message;
  AddReviewEntity({required this.message,required this.code});
  @override
  List<Object?> get props =>[code,message];

}

class AddReviewMessageEntity extends Equatable{
  List<String>error;
  AddReviewMessageEntity({required this.error});
  @override
  List<Object?> get props =>[error];

}