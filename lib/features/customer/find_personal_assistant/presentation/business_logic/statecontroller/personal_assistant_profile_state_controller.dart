
import 'package:flutter_riverpod/flutter_riverpod.dart';

final personalAssistantSelectedIndex=StateProvider<int?>((ref) => null);
final reviewsOrAboutMeProvider=StateProvider<bool>((ref) => false);
final chosenPersonalAssistantName=StateProvider<String>((ref) => '');
final chosenPersonalAssistantImage=StateProvider<String>((ref) => '');