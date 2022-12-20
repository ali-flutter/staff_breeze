import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final showAddressList = StateProvider<bool>((ref) => false);
final showEducationList = StateProvider<bool>((ref) => false);
final showGenderList = StateProvider<bool>((ref) => false);
final showLanguagesList = StateProvider<bool>((ref) => false);

final genderList = StateProvider<List<String>>((ref) => [
      'Male',
      'Female',
    ]);

final selectedEducationList = StateProvider<List<String>>((ref) => []);
final selectedLanguagesList = StateProvider<List<String>>((ref) => []);
final selectedGenderList = StateProvider<List<String>>((ref) => []);
final selectedAddressList = StateProvider<List<String>>((ref) => []);

final selectedSingleEducation = StateProvider<String>((ref) => '');
final selectedSingleLanguage = StateProvider<String>((ref) => '');
final selectedSingleGender = StateProvider<String>((ref) => '');
final selectedSingleAddress = StateProvider<String>((ref) => '');

final uploadedImage = StateProvider<XFile?>((ref) => null);
final phoneNumberCompleteRegistrationProvider =
    StateProvider<String?>((ref) => null);
