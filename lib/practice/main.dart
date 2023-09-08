import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_state_management_getx/res/language.dart';
import 'package:new_state_management_getx/view/splash_screen.dart';

import '../res/routes.dart';
import 'home_screen.dart';
import 'login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Language(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.grey.shade900),
      // home: const HomeScreen(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}

