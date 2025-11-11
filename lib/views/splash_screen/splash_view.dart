import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:tasky/utils/consts.dart';
import 'package:tasky/views/auth/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const String routeName = 'SplashScreen';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 5),
    ).then((value) => Navigator.pushNamed(context, LoginView.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset(taskIconLogo),
                // Image.asset(yIconLogo),
                SizedBox(
                  width: 250.0,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 70.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                    ),
                    child: AnimatedTextKit(
                      totalRepeatCount: 1,
                      animatedTexts: [
                        ScrambleAnimatedText(
                          textAlign: TextAlign.center,
                          'Task !? ',
                          textStyle: TextStyle(color: Colors.black12),
                          speed: const Duration(milliseconds: 100),
                        ),
                        ScrambleAnimatedText(
                          'Tasky',
                          speed: const Duration(milliseconds: 400),
                        ),
                      ],
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
