import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_state_management_getx/res/round_button.dart';

class InternetExceptionWidget extends StatelessWidget {
  VoidCallback onPress;
  InternetExceptionWidget({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('internetException'.tr, textAlign: TextAlign.center,),
          const SizedBox(height: 20,),
          InkWell(
              onTap: onPress,
              child: RoundButton(title: 'Retry',onPress: onPress, borderRadius: BorderRadius.circular(40),))
        ],
      ),
    );
  }
}
