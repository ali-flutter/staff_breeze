import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final scheduleAvailableTimePerDay=StateProvider<String>((ref) => 'Available times per day');
final scheduleRepeatForNumberOfWeeks=StateProvider<String>((ref)=>'Repeat for number of weeks');
final selectedNumberOfWeeks=StateProvider<int?>((ref) => null);
final selectedNumberOfHours=StateProvider<int?>((ref) => null);
final selectedAvailabeTimePerDay=StateProvider((ref)=>0);
final hourlyRateProvider=StateProvider<String>((ref)=>'');
final weeksProvider=StateProvider((ref)=>0);
final selectedFreeDays=StateProvider<List<String>>((ref)=>[]);

final selectedFreeDaysForReservation=StateProvider<List<DateTime?>>((ref) => []);

final selectedFreeDaysForSecondMonth=StateProvider<List<DateTime?>>((ref) => []);