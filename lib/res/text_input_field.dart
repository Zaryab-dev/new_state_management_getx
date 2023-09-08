import 'package:flutter/material.dart';
import 'package:new_state_management_getx/utils/utils.dart';

class TextInputField extends StatelessWidget {
  String title;
  TextInputAction textInputAction;
  bool obscure;
  TextEditingController controller;
  TextInputType textInputType;


  TextInputField({super.key,required this.textInputType, required this.textInputAction, required this.controller, required this.title, this.obscure = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      obscureText: obscure,
      validator: (value) {
        if(value!.isEmpty) {
          return 'Please fill the field!';
        }
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(15),
        hintText: title,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
