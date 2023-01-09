// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';



class GetFreeDaysEntity extends Equatable{
  
 final String code;
 final GetFreeDaysMessageEntity message;
final GetFreeDaysDataEntity data;
 const GetFreeDaysEntity({required this.code,required this.data,required this.message});
  @override
  List<Object?> get props => [code, message,data];

}


class GetFreeDaysMessageEntity extends Equatable{
  final List<String >error;
 const GetFreeDaysMessageEntity({required this.error}) ;
  @override
  List<Object?> get props => [error];

}

class GetFreeDaysDataEntity extends Equatable{
 final List <String>? first_month_dates;
 final List <String>? second_month_dates;
 const GetFreeDaysDataEntity({required this.first_month_dates,required this.second_month_dates});


  @override
  List<Object?> get props => [first_month_dates,second_month_dates];
  }