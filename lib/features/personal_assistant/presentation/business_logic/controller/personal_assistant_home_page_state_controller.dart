import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//final reviewsSectionHeightProvider=StateProvider((ref) => 400.h);
final notificationScheduleHeight=StateProvider((ref) => 130.h);
final notExpandedAboutSectionHeight=StateProvider((ref)=>130.h);
final aboutMeHeight=StateProvider((ref) => 480.h);
final isAboutMeSectionExpanded=StateProvider((ref) => false);
final aboutMePenIsTapped=StateProvider((ref)=>false);
final isReviewSectionExpanded=StateProvider((ref)=>false);

final bearerToken=StateProvider((ref)=>'');
final aboutMeProvider=StateProvider<String>((ref)=>'');
final languages= StateProvider<List>((ref)=>[]);
final selectedCountryProvider=StateProvider<Object?>((ref) => null);
final selectedEducationProvider=StateProvider<Object?>((ref)=>null);
final selectedLanguagesProvider=StateProvider<List<int>>((ref) => []);

final personalDrawerName=StateProvider<String>((ref) => '');
final personalDrawerPhoto=StateProvider<String>((ref) => '');

final personalAssistantEducationIdsList=StateProvider<List<int>?>((ref) => []);