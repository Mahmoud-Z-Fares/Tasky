import 'package:flutter/material.dart';
import 'package:tasky/utils/consts.dart';

class CustomBottomNavigatorBar extends StatelessWidget {
  const CustomBottomNavigatorBar({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.onTap,
  });
  final String firstText;
  final String secondText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Text.rich(
            TextSpan(
              text: firstText,
              children: [
                TextSpan(
                  text: secondText,
                  style: TextStyle(color: mainColor),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 60),
      ],
    );
  }
}
