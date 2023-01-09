
import 'package:shared_preferences/shared_preferences.dart';

void deviceTokenSaver({required String? deviceToken})async{
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  sharedPreferences.setString('deviceToken',deviceToken??'');
}
Future<String?> deviceTokenRetriever()async{
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  return sharedPreferences.getString('deviceToken');
}