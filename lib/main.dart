import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:staff_breeze/core/helpers/shared_prefs_manager/user_role_id_saver.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/presentation/pages/find_personal_assistant_page.dart';
import 'package:staff_breeze/features/personal_assistant/presentation/pages/personal_assistant_home_page.dart';
import 'package:staff_breeze/injection_container/injection.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:staff_breeze/router/app_routes.dart';
import 'package:staff_breeze/router/router_generator.dart';
import 'package:staff_breeze/style/app_theme.dart';

import 'core/helpers/shared_prefs_manager/device_token.dart';
import 'features/registration/presentation/pages/complete_registration_page.dart';
import 'features/welcoming_pages/presentation/pages/get_started.dart';

String? userIsNew;
void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureDependencies();
 userIsNew=await initPage(userRoleIdRetriever());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late FirebaseMessaging messaging;
  @override
  void initState() {
    messaging=FirebaseMessaging.instance;
    messaging.getToken().then((value) {
      debugPrint("$value");
      deviceTokenSaver(deviceToken: value);
      debugPrint('the device token retriever is');
      deviceTokenRetriever().then((value) => debugPrint(value));
    });
    super.initState();
  }
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => ProviderScope(
        child: KeyboardDismisser(
          child: MaterialApp(

            initialRoute:userIsNew,
            onGenerateRoute: RouteGenerator.routeGenerator,
            title: 'Staff Breeze',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.appTheme,
          ),
        ),
      ),
    );
  }
}

 Future<String?> initPage(Future<String?>  userIsNew)async{
    if(await userIsNew==null){
      return Future.value(GET_STARTED);
    }else if(await userIsNew =='1'){
      return Future.value(PERSONAL_ASSISTANT_HOMEPAGE);
    }else if(await userIsNew=='2'){
      return Future.value(FIND_PERSONAL_ASSISTANT);
    }else{
      return null;
    }
  }

