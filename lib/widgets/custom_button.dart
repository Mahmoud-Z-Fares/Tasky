import 'package:flutter/material.dart';
import 'package:tasky/app_bone/consts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.title});
  final Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // shape: OutlinedBorder.lerp(a, b, t),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: mainColor,
        minimumSize: Size(double.infinity, 48),
      ),

      onPressed: onPressed,
      child: Text(title, style: TextStyle(color: whiteColor)),
    );
  }
}
