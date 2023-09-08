import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_state_management_getx/res/round_button.dart';
import 'package:new_state_management_getx/services/splash_services.dart';
import 'package:new_state_management_getx/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    super.initState();
    splashServices.isLogin();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('emailhint'.tr),),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 111),
          child: Column(
            children: [
              Icon(Icons.cloud_off, color: Colors.red,size: 50,),
              SizedBox(height: 20,),
              Text('generalException'.tr, textAlign: TextAlign.center,),
            ],
          ),
        ),
      ),
    );
  }
}
