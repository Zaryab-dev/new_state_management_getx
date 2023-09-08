import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Two ${Get.arguments[0]}'),centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: TextButton(onPressed: () {
            Get.toNamed('/screenThree');
          }, child: const Text('Go To Home Screen'))),
          Container(
            height: Get.height * .3,
            color: Colors.limeAccent.withOpacity(1),
          )
        ],
      ),
    );
  }
}
