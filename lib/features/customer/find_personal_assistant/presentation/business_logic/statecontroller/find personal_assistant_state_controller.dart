import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';


final showLanguagesFilterProvider = StateProvider<bool>((ref) => false);
final showGenderFilterProvider = StateProvider<bool>((ref) => false);
final showLocationFilterProvider = StateProvider<bool>((ref) => false);
final showServicesFilterProvider=StateProvider<bool>((ref)=>false);
final showEducationFilterProvider=StateProvider<bool>((ref)=>false);
final showRateFilterProvider = StateProvider<bool>((ref) => false);

final personalAssistantListScrollController =
    StateProvider((ref) => ScrollController());
final filterBarHeightProvider = StateProvider<double>((ref) => 59.h);
final searchBarHeightProvider = StateProvider((ref) => 48.h);
final listOfPersonalDistanseFromTop=StateProvider((ref) => 120.h);

final searchForAPersonalAssistantProvider =
    StateProvider<String?>((ref) => null);
final selectedLanguageFilterProvider = StateProvider<int?>((ref) => null);
final selectedGenderFilterProvider = StateProvider<int?>((ref) => null);
final selectedLocationFilterProvider = StateProvider<int?>((ref) => null);
final selectedRateFilterProvider = StateProvider<int?>((ref) => null);

    final selectedLanguagesList=StateProvider<List<int>>((ref) => []);
/*final selectedGenderList=StateProvider((ref) => []);*/
final selectedLocationList=StateProvider<List<int>>((ref) => []);
final selectedServicesList=StateProvider<List<int>>((ref) => []);
final selectedList=StateProvider((ref) => []);
final selectedEducationList=StateProvider<List<int>>((ref) => []);
final selectedCountryId=StateProvider<int?>((ref) => null);
final selectedRateAverage=StateProvider<double?>((ref) => null);
    final customerPhotoStateController=StateProvider<String>((ref) => '');

    final customerPhotoHomePage=StateProvider<String>((ref) => '');