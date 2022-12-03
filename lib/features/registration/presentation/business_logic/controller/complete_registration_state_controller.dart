import 'package:flutter_riverpod/flutter_riverpod.dart';

final showAddressList = StateProvider<bool>((ref) => false);
final showEducationList = StateProvider<bool>((ref) => false);
final showGenderList = StateProvider<bool>((ref) => false);
final showLanguagesList = StateProvider<bool>((ref) => false);

final educationList = StateProvider<List<String>>((ref) => [
      'Professional Certificates',
      'Undergraduate Degrees',
      'Transfer Degrees',
      'Associate Degrees',
      'Bachelor Degrees',
      'Graduate Degrees',
      'Master Degrees',
      'Specialist Degrees',
      'Not Applicable',
      'Other'
    ]);
final languagesList = StateProvider<List<String>>((ref) => [
      'English',
      'French',
      'Spanish',
      'Arabic',
      'Turkish',
      'Italian',
    ]);
final genderList = StateProvider<List<String>>((ref) => [
      'Male',
      'Female',
    ]);
final addressList = StateProvider<List<String>>((ref) => [
      'United Arab Emirates',
      'Saudi Arabia',
      'Kuwait',
      'Syria',
      'Lebanon',
      'Iraq',
      'Qatar'
    ]);

final selectedEducationList=StateProvider<List<String>>((ref) => []);
final selectedLanguagesList=StateProvider<List<String>>((ref) => []);
    final selectedGenderList=StateProvider<List<String>>((ref) => []);
    final selectedAddressList=StateProvider<List<String>>((ref) => []);


final selectedSingleEducation=StateProvider<String>((ref) => '');
final selectedSingleLanguage=StateProvider<String>((ref) => '');
final selectedSingleGender=StateProvider<String>((ref) => '');
final selectedSingleAddress=StateProvider<String>((ref) => '');