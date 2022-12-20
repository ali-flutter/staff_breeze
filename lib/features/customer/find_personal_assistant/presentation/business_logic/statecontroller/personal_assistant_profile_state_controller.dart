import 'package:flutter_riverpod/flutter_riverpod.dart';

final personalAssistantSelectedIndex = StateProvider<int?>((ref) => null);
final reviewsOrAboutMeProvider = StateProvider<bool>((ref) => false);
final chosenPersonalAssistantName = StateProvider<String?>((ref) => null);
final chosenPersonalAssistantImage = StateProvider<String?>((ref) => null);
final chosenPersonalAssistantAboutProvider =
    StateProvider<String?>((ref) => null);

final chosenAssistantIdProvider = StateProvider<int?>((ref) => null);
final reviewItemGeneratedListOfBooleans =
    StateProvider<List<bool>>((ref) => []);
final reviewsItemListLength = StateProvider<int>((ref) => 0);
