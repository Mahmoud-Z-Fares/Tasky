import 'package:flutter/material.dart';
import 'package:tasky/views/auth/login_view.dart';

void main() {
  runApp(Tasky());
}

class Tasky extends StatelessWidget {
  const Tasky({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {LoginView.routeName: (context) => LoginView()},
      initialRoute: LoginView.routeName,
    );
  }
}

// ✅ SPLASH REMINDER
// 1- add package flutter_native_splash in pubspec.yaml under dependencies
//
// 2- design splash android and ios screens
//    download splash images (icon) in assets folder
//    name it: splash_ios_android_11.png
//
// 3- android 12 splash:
//    - in figma create frame 640x640 and center icon inside
//    - create new frame 960x960 and put first frame inside center
//    - export final png as: splash_ios_android_12.png
//
// 4- create file in root:
//    flutter_native_splash.yaml
//    Write inside:

// 5- Run command:
//    dart run flutter_native_splash:create --path=flutter_native_splash.yaml
// ✅ Done
