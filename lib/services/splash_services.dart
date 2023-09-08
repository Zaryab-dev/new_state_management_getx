import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_state_management_getx/models/user_preferences/user_preference.dart';
import 'package:new_state_management_getx/res/routes_name.dart';

class SplashServices {
  void isLogin() {
    UserPreferences userPreferences = UserPreferences();
    userPreferences.getUser().then((value) {
      if (value.token == null) {
        Timer(const Duration(seconds: 3), () {
          Get.toNamed(RoutesName.loginView);
        });
      } else {
        Timer(const Duration(seconds: 3), () {
          Get.toNamed(RoutesName.homeScreenTwo);
        });
      }
    });
  }
}
