import 'package:flutter_riverpod/flutter_riverpod.dart';

final personalAssistantSelectedIndex = StateProvider<int?>((ref) => null);
final reviewsOrAboutMeProvider = StateProvider<bool>((ref) => false);
final chosenPersonalAssistantName = StateProvider<String?>((ref) => null);
final chosenPersonalAssistantImage = StateProvider<String?>((ref) => null);
final chosenPersonalAssistantRatingAvrage=StateProvider<double?>((ref)=>null);
final chosenPersonalAssistantAboutProvider =
StateProvider<String?>((ref) => null);
final chosenPersonalAssistantLanguagesList =
StateProvider<List?>((ref) => []);
final chosenPersonalAssistantCountry = StateProvider<List?>((ref) => []);
    final chosenPersonalAssistantservices=
    StateProvider<List?>((ref) => [
]
);
    final chosenPersonalAssistantEducation=
    StateProvider<List?>((ref) => []);

final chosenAssistantIdProvider = StateProvider<int?>((ref) => null);
final reviewItemGeneratedListOfBooleans =
StateProvider<List<bool>>((ref) => []);
final reviewsItemListLength = StateProvider<int>((ref) => 0);
final reviewContent = StateProvider<String>((ref) => '');
final leaveRatingProvider = StateProvider<double>((ref) => 0);

final customerAboutMeProvider = StateProvider<String>((ref) => '');