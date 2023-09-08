
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Utils{
  static void fieldFocusChange(BuildContext context, FocusNode currentFocus, nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
  static taostMsg(String msg) {
    Fluttertoast.showToast(msg: msg,
      gravity: ToastGravity.CENTER,
      fontSize: 15,
    );
  }
  static showSnackbar(String title, message) {
    Get.snackbar(title, message);
  }
}