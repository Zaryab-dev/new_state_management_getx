
import 'package:get/get.dart';
import 'package:new_state_management_getx/practice/home_screen.dart';
import 'package:new_state_management_getx/practice/login_screen.dart';
import 'package:new_state_management_getx/res/routes_name.dart';
import 'package:new_state_management_getx/view/details.dart';
import 'package:new_state_management_getx/view/home_view.dart';
import 'package:new_state_management_getx/view/splash_screen.dart';

import '../view/login_view.dart';

class AppRoutes {
  static appRoutes() => [
    GetPage(name: RoutesName.splashScreen, page: () => SplashScreen(),
        transition: Transition.leftToRightWithFade,transitionDuration: const Duration(milliseconds: 1000)),
    GetPage(name: RoutesName.loginScreen, page: () => LoginScreen()),
    GetPage(name: RoutesName.loginView, page: () => LoginView(),transition: Transition.upToDown,
        transitionDuration: const Duration(seconds: 1)),
    GetPage(name: RoutesName.homeScreenTwo, page: () => HomeScreenTwo(),transition: Transition.upToDown,
        transitionDuration: const Duration(seconds: 1)),
    // GetPage(name: RoutesName.detailScreen, page: () => DetailScreen(),transition: Transition.upToDown,
    //     transitionDuration: Duration(seconds: 1)),
  ];
}