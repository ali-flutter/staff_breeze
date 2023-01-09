import 'package:shared_preferences/shared_preferences.dart';

setUserId({required int id}) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();

  preferences.setInt('UserId', id);
}

Future<int?> getUserId() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  int? id =  preferences.getInt('UserId');
  return Future.value(id);
}

