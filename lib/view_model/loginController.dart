
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:new_state_management_getx/models/user_model.dart';
import 'package:new_state_management_getx/models/user_preferences/user_preference.dart';
import 'package:new_state_management_getx/repository/login_repository.dart';
import 'package:new_state_management_getx/res/routes_name.dart';
import 'package:new_state_management_getx/utils/utils.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;



  RxBool isLoading = false.obs;
  UserPreferences userPreferences = UserPreferences();

  final _api = LoginRepository();

  void loginApi() {
    isLoading.value = true;
    Map data = {
      'email' : emailController.value.text,
      'password' : passwordController.value.text,
    };
    _api.loginAPi(data).then((value) {
      Utils.showSnackbar('Success', 'User login Successfully!');
      isLoading.value = false;
      userPreferences.saveUser(UserModel.fromJson(value)).then((value) {
        Utils.showSnackbar('Logged', 'Welcome to home screen');
        Get.toNamed(RoutesName.homeScreenTwo);
        Get.delete<LoginController>();
      }).onError((error, stackTrace) {
        Utils.showSnackbar('Error', 'Failed');
      });
    }).onError((error, stackTrace) {
      Utils.showSnackbar("Failed", error.toString());
      isLoading.value = false;
    });
  }
}