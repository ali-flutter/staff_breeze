import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final showAddressList = StateProvider<bool>((ref) => false);
final showEducationList = StateProvider<bool>((ref) => false);
final showGenderList = StateProvider<bool>((ref) => false);
final showLanguagesList = StateProvider<bool>((ref) => false);
final showServicesList = StateProvider<bool>((ref) => false);

final genderList = StateProvider<List<String>>((ref) => ['Male', 'Female']);

final selectedEducationList = StateProvider<List<String>>((ref) => []);
final selectedLanguagesList = StateProvider<List<String>>((ref) => []);
final selectedGenderList = StateProvider<List<String>>((ref) => []);
final selectedAddressList = StateProvider<List<String>>((ref) => []);
final selectedServicesList = StateProvider<List<String>>((ref) => []);

final selectedSingleEducation = StateProvider<String>((ref) => '');
final selectedSingleLanguage = StateProvider<String>((ref) => '');
final selectedSingleGender = StateProvider<String>((ref) => '');
final selectedSingleAddress = StateProvider<String>((ref) => '');
final selectedSingleService = StateProvider((ref) => '');
final citiesDropdownItemState = StateProvider<List<dynamic>>((ref) => []);
final uploadedImage = StateProvider<String?>((ref) => null);
final phoneNumberCompleteRegistrationProvider =
    StateProvider<String?>((ref) => null);

final selectedEducationIds = StateProvider<List<int>>((ref) => []);
final   selectedGenderId = StateProvider<int?>((ref) => null);
final selectedLocationId = StateProvider<int?>((ref) => null);
final selectedServicesId = StateProvider<List<int>>((ref) => []);
final selectedLanguagesIdComplete = StateProvider<List<int>>((ref) => []);

final showEDITeducationList = StateProvider.autoDispose((ref) => false);
final selectedEDITEducationNamesList = StateProvider((ref) => []);
final selectedEDITEducationIdList = StateProvider((ref) => []);

final showEDITcountriesList = StateProvider.autoDispose<bool>((ref) => false);
final selectedEDITcountryName = StateProvider<String?>((ref) => null);
final selectedEDITcountryId = StateProvider<int?>((ref) => null);

final showEDITcityList = StateProvider.autoDispose<bool>((ref) => false);
final selectedEDITcityName = StateProvider<String?>((ref) => '');
final selectedEDITcityId = StateProvider<int?>((ref) => null);

final showEDITlanguageList = StateProvider.autoDispose<bool>((ref) => false);
final selectedEDITlanguagesNamesList = StateProvider((ref) => []);
final selectedEDITlanguagesIdsList = StateProvider((ref) => []);

final showEDITselectedServicesList =
    StateProvider.autoDispose<bool>((ref) => false);
final selectedEDITServiceNamesList = StateProvider((ref) => []);
final selectedEDITServicesIdsList = StateProvider((ref) => []);



final showCitieslist=StateProvider((ref)=>false);
final selectedCountryNameCompleteRegistration=StateProvider<String?>((ref)=>null);

final selectedCountryIdCompleteRegistration=StateProvider<int?>((ref)=>null);


final selectedCityNameCompleteRegistration=StateProvider<String?>((ref)=>null);
final selectedCityIdCompleteRegistration=StateProvider<int?>((ref) => null);