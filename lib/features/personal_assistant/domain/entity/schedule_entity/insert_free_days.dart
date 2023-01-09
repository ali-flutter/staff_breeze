import 'package:equatable/equatable.dart';


class InsertFreeDaysEntity extends Equatable{
 final String code;
  final InsertFreeDaysMessageEntity message;
  InsertFreeDaysEntity({required this.code,required this.message});
  @override
  List<Object?> get props =>[code,message];

}
class InsertFreeDaysMessageEntity extends Equatable{
 final List<String>error;
 const InsertFreeDaysMessageEntity({required this.error});
  @override
  List<Object?> get props => [error];

}