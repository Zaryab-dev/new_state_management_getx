import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {

  String title;
  Color textColor, buttonColor;
  BorderRadius borderRadius;
  VoidCallback onPress;
  double height;
  double width;
  bool isLoading;
   RoundButton({super.key,this.isLoading = false, required this.title, required this.onPress, required this.borderRadius , this.height = 45, this.width = 160, this.buttonColor = Colors.blue, this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      borderRadius: BorderRadius.circular(40),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: borderRadius,
        ),
        child: Center(child: isLoading ? const Padding(
          padding: EdgeInsets.symmetric(vertical: 7, horizontal: 22,),
          child: Center(child: CircularProgressIndicator(color: Colors.white,strokeWidth: 3),),
        ) :
        Text(title, style: TextStyle(color: textColor,),)),
      ),
    );
  }
}
