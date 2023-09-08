
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class LoginControllers extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  RxBool loading = false.obs;

  void getApi() async {
    try{
      loading.value = true;
      var response = await post(Uri.parse('https://reqres.in/api/login'), body: {
        'email' : emailController.value.text,
        'password' : passwordController.value.text,
      });
      var data = jsonDecode(response.body);
      Get.snackbar(response.statusCode.toString(), data['token']);
      if(response.statusCode == 200) {
        loading.value = false;
        Get.snackbar('Success', 'Login Successfully!');
        // Get.toNamed('/');
      } else{
        loading.value = false;
        Get.snackbar('Failed!', data['error']);
      }

    } catch(e) {
      loading.value = false;
      Get.snackbar('Exception', e.toString());
    }
  }
}