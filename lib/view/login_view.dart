import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_state_management_getx/practice/login_controller.dart';
import 'package:new_state_management_getx/res/round_button.dart';
import 'package:new_state_management_getx/res/text_input_field.dart';
import 'package:new_state_management_getx/utils/utils.dart';

import '../view_model/loginController.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isLoading = false;
  final LoginController loginController = Get.put(LoginController());
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  Text("login".tr,),centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextInputField(textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next, controller: loginController.emailController.value,
                  title: 'email_hint'.tr,
              ),
              SizedBox(height: 10,),
              TextInputField(textInputType: TextInputType.visiblePassword, textInputAction: TextInputAction.done,
                  controller: loginController.passwordController.value, title: 'password_hint'.tr, obscure: true,),
              SizedBox(height: 50,),
             Obx(() =>  RoundButton(
                 isLoading: loginController.isLoading.value,
                 title: 'login'.tr, onPress: (){
               if(formKey.currentState!.validate()) {
                 loginController.loginApi();
               }
             }, borderRadius: BorderRadius.circular(50)))
            ],
          ),
        ),
      ),
    );
  }
}
