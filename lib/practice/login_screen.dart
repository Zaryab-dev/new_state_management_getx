import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_state_management_getx/practice/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginControllers controller = Get.put(LoginControllers());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: controller.emailController.value,
            decoration: InputDecoration(
              hintText: 'Email',
              prefixIcon: Icon(Icons.alternate_email)
            ),
          ),
          TextFormField(
            controller: controller.passwordController.value,
            decoration: InputDecoration(
              hintText: 'Password',
              prefixIcon: Icon(Icons.lock_outline)
            ),
          ),
          const SizedBox(height: 22,),
          Obx(() {
            return controller.loading.value ? CircularProgressIndicator():
               IconButton(onPressed: () {
                controller.getApi();
              }, icon: Icon(Icons.login));
            }
          )
        ],
      ),
    );
  }
}
